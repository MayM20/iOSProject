//
//  ClassicModeViewController.m
//  iOS try app
//
//  Created by 5526 on 24/5/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import "ClassicModeViewController.h"

@interface ClassicModeViewController ()
{
    //this allow us to divide the pieces of blocks same size in the big grey square, calculate width based on size gameView
    float gameViewWidth;
    
    //we are going to use this to place our blocks and centers
    NSMutableArray* blocksArr;
    NSMutableArray* centersArr;
    
    CGPoint empty;
    
    float blockWidth;

}

@end

@implementation ClassicModeViewController

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
    NSString* nameForSample = [NSString stringWithFormat:@"%@Sample.jpg", _gameMode];
    _sampleImgView.image = [UIImage imageNamed:nameForSample];
    
    [super viewDidAppear:YES];
    
    [_gameView layoutIfNeeded];//forces the receiver to layout its subviews inmediately
                              //if required. it resizes a custom view
                             //this makes sure of load first the layout then do the calculations
    gameViewWidth = _gameView.frame.size.width;
    
    /*
     #proccess involved when calling this method:
     
     //1-It calculates the  float value, a quarter of the width
     make a new frame for it
     //2-CGRect blockFrame -> Based on the top left corner based on height and
     width that we established before
     //3-Make a new imageView based on that new frame
     //4-stick the image into the block
     //5-Added to the gameView
     
     */
    [self makeBlocksAction];
    [self randomizeAction];
    
}

//method that makes the blocks
-(void)makeBlocksAction
{
    blocksArr = [NSMutableArray new];
    centersArr = [NSMutableArray new];
    
    blockWidth = gameViewWidth /4;
    
    //this is made because every screen size varies and it needs to
    //calculate the halfcenter y and x of the UIImageView (block) based on frame
    float xCen = blockWidth /2;
    float yCen = blockWidth /2;
    
    int imgNum = 1;
    
    //horizontla blocks
    for (int h = 0; h < 4; h++)
    {
        
        //vertical blocks
        for (int v = 0; v < 4; v++)
        {
            CGPoint newCen = CGPointMake(xCen, yCen);
            
            //this will generate the frame for us to hold the pieces
            //-3 because it will generate a bit of margin of height and width between blocks
            CGRect blockFrame = CGRectMake(0, 0, blockWidth-3, blockWidth-3);
            UIImageView* block = [[UIImageView alloc] initWithFrame:blockFrame];
            
            //whatever integer value its, needs to have 2 digits
            NSString* imgName = [NSString stringWithFormat:@"cute_%02d.jpg", imgNum];
            block.image = [UIImage imageNamed: imgName];
            block.center = newCen;
            [_gameView addSubview:block];
            
            [blocksArr addObject: block];
            [centersArr addObject: [NSValue valueWithCGPoint:newCen]];
            
            //once you make one block, make the other one and so on
            xCen += blockWidth;
            imgNum = imgNum +1;
        }
        //once the first round is made do:
        yCen = yCen + blockWidth; //bring them one step lower
        xCen = blockWidth /2; //start making the blocks from the left again
    }
    
    NSLog(@"Centers array is: %@", centersArr);
    
}

-(void)randomizeAction
{
    [[blocksArr objectAtIndex:15] removeFromSuperview];
    [blocksArr removeObjectAtIndex:15];
    
    //randomise their locations
    for(UIImageView* any in blocksArr)
    {
        //making sure objects are interactable
        any.userInteractionEnabled = true;
        
        int randomIndex = arc4random() % centersArr.count;
        any.center = [[centersArr objectAtIndex:randomIndex]CGPointValue];//convert it in CGPoint and apply to my center
        //once you use certain location, remove it so the blocks are randomised but in good locations, then i cannot reuse it
        [centersArr removeObjectAtIndex:randomIndex];
    }
    
    /*testing purposes
    NSLog(@"There are currently %lu elements in the center array", (unsigned long) centersArr.count);
    
    NSLog(@"There is the empty space of: %@", [centersArr objectAtIndex:0]);*/
    
    //one center is still in the array
    empty = [[centersArr objectAtIndex:0]CGPointValue];
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch* myTouch = [[touches allObjects] objectAtIndex:0];
    
    UIView* touchView = myTouch.view;
    
    if( [blocksArr containsObject:touchView])
    {
        NSLog(@"Tapped on one of the blocks");
        
        //lets calculate the distance between this view's center
        //and the empty center
        float xDif = touchView.center.x - empty.x;
        float yDif = touchView.center.y - empty.y;
        
        float distance = sqrt(pow(xDif, 2) + pow(yDif, 2));
        
        if (distance == blockWidth)
        {
            /*NSLog(@"This image view is a neighbor of the empty");*/
            
            CGPoint tempCen = touchView.center;
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration: .5];
            touchView.center = empty;
            [UIView commitAnimations];
            
            empty = tempCen;
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
