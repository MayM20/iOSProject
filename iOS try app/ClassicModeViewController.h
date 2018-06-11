//
//  ClassicModeViewController.h
//  iOS try app
//
//  Created by 5526 on 24/5/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassicModeViewController : UIViewController{
    float gameViewWidth;
    NSMutableArray* blocksArr;
    NSMutableArray* centersArr;
    
    CGPoint empty;
    
    float blockWidth;
    
}

@property (weak, nonatomic) IBOutlet UIView *gameView;
@property (weak, nonatomic) IBOutlet UIImageView *sampleImgView;

@property (weak, nonatomic) NSString* gameMode;


//NEW


- (IBAction)backAction:(id)sender;

-(void)randomizeAction;
-(void)makeBlocksAction;
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
-(void)viewDidAppear:(BOOL)animated;
//-(BOOL)isGameFinished;

@end
