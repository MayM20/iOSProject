//
//  ClassicModeViewController.h
//  iOS try app
//
//  Created by 5526 on 24/5/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassicModeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *gameView;
@property (weak, nonatomic) IBOutlet UIImageView *sampleImgView;

@property (weak, nonatomic) NSString* gameMode;


- (IBAction)backAction:(id)sender;

-(void)randomizeAction;
-(void)makeBlocksAction;
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
-(void)viewDidAppear:(BOOL)animated;

@end
