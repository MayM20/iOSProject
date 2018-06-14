//
//  ClassicModeViewController.m
//  iOS try app
//
//  Created by 5526 on 24/5/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import "ClassicModeViewController.h"
#import "BlockModel.h"

@interface ClassicModeViewController ()
{
    //this allow us to divide the pieces of blocks same size in the big grey square,
    //calculate width based on size gameView
    //float gameViewWidth;
   
    //we are going to use this to place our blocks and coordinates
    //NSMutableArray* blocksArr;
    //NSMutableArray* centersArr;
    
    //CGPoint empty;
    
    //float blockWidth;
    
    // USE THIS for testing inside the randomize function. index 0 is the right corner.
    //[centersArr removeObjectAtIndex:0];
    //and remove the commented self.randomizeAction inside the viewDidAppear
}

@end

@implementation ClassicModeViewController

@synthesize gameView, sampleImgView, gameMode;

- (void)viewDidLoad {
    /*TESTING PURPOSES
     NSLog(@"\n\n VIEW DID LOAD : game view width is: %f", gameViewWidth);
     //this shows in the command line what the width size is. 260 in this
     case for iphone SE.
     NSLog(@"\n\n VIEW DID APPEAR : game view width is: %f", gameViewWidth);
     */
}

-(void)viewDidAppear:(BOOL)animated
{
    //NSLog(@"Game mode is %@", _gameMode);
    
    //make the clicked image, the correspondant/correct image sample to start puzzle
    NSString* nameForSample = [NSString stringWithFormat:@"%@Sample.jpg", gameMode];
    sampleImgView.image = [UIImage imageNamed:nameForSample];
    
    [super viewDidAppear:YES];
    
    [gameView layoutIfNeeded];//forces the receiver to layout its subviews inmediately
                              //if required. it resizes a custom view
                             //this makes sure of load first the layout then do the calculations
    gameViewWidth = gameView.frame.size.width;
    
    [self makeBlocksAction];
    /*
     #proccess involved when calling makeBlocksAction method:
     
     //1-It calculates the  float value, a quarter of the width
     make a new frame for it
     //2-CGRect blockFrame -> Based on the top left corner based on height and
     width that we established before
     //3-Make a new imageView based on that new frame
     //4-Stick the image into the block
     //5-Added to the gameView
     
     */
    [self randomizeAction];
    
}

//method that makes the blocks
-(void)makeBlocksAction
{
    blocksArr = [NSMutableArray new];
    centersArr = [NSMutableArray new];
    
    blockWidth = gameViewWidth /4;
    
    //this is made because every screen size for iOS devices varies, and it needs to
    //calculate the halfcenter y and x of the UIImageView (block) based on frame
    float xCen = blockWidth /2;
    float yCen = blockWidth /2;
    
    int imgNum = 1;
    NSUInteger index = 0;
    
    //horizontla blocks
    for (int h = 0; h < 4; h++)
    {
        
        //vertical blocks
        for (int v = 0; v < 4; v++)
        {
            CGPoint newCen = CGPointMake(xCen, yCen);
            
            //this will generate the frame for us to hold the pieces
            
            //'-3' because it will generate a bit of spacing between blocks
            CGRect blockFrame = CGRectMake(0, 0, blockWidth-3, blockWidth-3);
            //UIImageView* block = [[UIImageView alloc] initWithFrame:blockFrame];
            BlockModel* block = [[BlockModel alloc] initWithFrame:blockFrame];
            
            NSLog(@"block index is: %lu", block.index);
            
            //piece of image inserted into the block
            NSString* imgName = [NSString stringWithFormat:@"%@_%02d.jpg", gameMode, imgNum];
            
            block.image = [UIImage imageNamed: imgName];
            block.center = newCen;
            block.originalCenter = newCen;
            [gameView addSubview:block];
            
            [blocksArr addObject: block];
            [centersArr addObject: [NSValue valueWithCGPoint:newCen]];
            
            //once you make one block, make the other one and so on
            xCen += blockWidth;
            imgNum = imgNum +1;
            
            index++;
        }
        //once the first round 'X' is made do 'Y':
        yCen = yCen + blockWidth; //bring them one step lower
        xCen = blockWidth /2; //start making the blocks from the left again
    }
    
    //NSLog(@"Centers array is: %@", centersArr);
    
    
    
}
-(BOOL)isGameFinished{
    
    
    for(BlockModel * block in blocksArr){

        if(!CGPointEqualToPoint(block.center, block.originalCenter)){
            return NO;
        }
        
    }
    
    return YES;
    
}

-(void)randomizeAction
{
    [[blocksArr objectAtIndex:15] removeFromSuperview];
    [blocksArr removeObjectAtIndex:15];
    
    // save originalblock here so we can use to compare later
    //originalArr = blocksArr;

    
    
    
    //randomise their locations
    for(BlockModel* any in blocksArr)
    {
        //making sure objects are interactable
        any.userInteractionEnabled = true;
        
        int randomIndex = arc4random() % centersArr.count;
        any.center = [[centersArr objectAtIndex:randomIndex]CGPointValue];

        [centersArr removeObjectAtIndex:randomIndex];
        
        // USE THIS for testing. index 0 is the right corner.
        //[centersArr removeObjectAtIndex:0];

    }
    //testing purposes
    NSLog(@"There are currently %lu elements in the center array", (unsigned long) centersArr.count);
    
    NSLog(@"There is the empty space of: %@", [centersArr objectAtIndex:0]);
    
    //one center is still in the array
    empty = [[centersArr objectAtIndex:0]CGPointValue];
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch* myTouch = [[touches allObjects] objectAtIndex:0];
    
    //UIView* touchView = myTouch.view;
    UIView* touchView = myTouch.view;

    
    if( [blocksArr containsObject:touchView])
    {
        //NSLog(@"Tapped on one of the blocks. orig: %@ curr:,  NSStringFromCGPoint(touchView.center));
        
        //calculate the distance between this view's center
        //and the empty center
        float xDif = touchView.center.x - empty.x;
        float yDif = touchView.center.y - empty.y;
        
        float distance = sqrt(pow(xDif, 2) + pow(yDif, 2));
        
        if (distance == blockWidth)
        {
            /*test -> NSLog(@"This image view is a neighbor of the empty");*/
            
            CGPoint tempCen = touchView.center;
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration: .5];
            touchView.center = empty;
            [UIView commitAnimations];
            
            empty = tempCen;
        }
    }
    
    if(self.isGameFinished){
        NSLog(@"The game has finished");
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

- (IBAction)backAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end