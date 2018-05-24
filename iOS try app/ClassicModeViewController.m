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
}

@end

@implementation ClassicModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    gameViewWidth = _gameView.frame.size.width;
    NSLog(@"\n\n game view width is: %f", gameViewWidth);//this shows in the command line what the width size is. 260 in this case.
    
    /*
     #proccess involved when calling this method:
     
     //1-It calculates the  float value, a quarter of the width
        make a new frame for it
     //2-CGRect blockFrame -> Based on the top left corner based on height and width that we established before
     //3-Make a new imageView based on that new frame
     //4-stick the image into the block
     //5-Added to the gameView
     
     */
    [self makeBlocksAction];
}
//method that makes the blocks
-(void)makeBlocksAction
{
    float blockWidth = gameViewWidth /4;
    
    //this will generate the frame for us to hold the pieces
    CGRect blockFrame = CGRectMake(0, 0, blockWidth, blockWidth);
    UIImageView* block = [[UIImageView alloc] initWithFrame:blockFrame];
    block.image = [UIImage imageNamed:@"cute_01.jpg"];
    [_gameView addSubview:block];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backAction:(id)sender {
}
@end
