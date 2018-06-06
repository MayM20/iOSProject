//
//  AlertViewController.h
//  iOS try app
//
//  Created by Fatima Abreu on 30/5/18.
//  Copyright © 2018 5526. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertViewController : UIViewController

//Constants
extern NSString *const alertMessageConstant;
extern NSString *const alertTitleConstant;
extern NSString *const alertButtonConstant;

extern NSString *const inputAlertMessageConstant;
extern NSString *const inputAlertTitleConstant;
extern NSString *const ceroInputAlertMessageConstant;
extern NSString *const passwNotMatchingAlertMessageConstant;
extern NSString *const updateDBAlertMessageConstant;
extern NSString *const alertLoggedOutTitle;
extern NSString *const alertMessageLoggedOut; 

-(void)displayInputAlert: (NSString *) fieldName;

-(void)displayAlertMessage: (NSString *) message;

@end
