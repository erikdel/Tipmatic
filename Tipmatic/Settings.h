//
//  Settings.h
//  Tipmatic
//
//  Created by EDL on 8/21/14.
//  Copyright (c) 2014 Elkride Software LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Config.h"

@interface Settings : UIViewController {
    
    NSUserDefaults *defaults;
    
}

@property (strong, nonatomic) IBOutlet UITextView *aboutTextView;

@property (strong, nonatomic) IBOutlet UIStepper *defaultTipStepper;
@property (strong, nonatomic) IBOutlet UIStepper *tipOver5PeopleStepper;

//@property (strong, nonatomic) IBOutlet UISwitch *tipOver5PeopleSwitch;

@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIButton *defaultTipButton;
@property (strong, nonatomic) IBOutlet UIButton *defaultTipOver5Button;
@property (strong, nonatomic) IBOutlet UIButton *upgradeButton;
@property (strong, nonatomic) IBOutlet UIButton *restorePurchaseButton;
@property (strong, nonatomic) IBOutlet UIButton *rateThisAppButton;
@property (strong, nonatomic) IBOutlet UIButton *sendFeedbackButton;
@property (strong, nonatomic) IBOutlet UIButton *closeDefaultTipOptionButton;
@property (strong, nonatomic) IBOutlet UIButton *closeDefaultTipOver5OptionButton;

@property (strong, nonatomic) IBOutlet UILabel *topBarLabel;
@property (strong, nonatomic) IBOutlet UILabel *defaultTipLabel;
@property (strong, nonatomic) IBOutlet UILabel *defaultTipOver5PeopleLabel;

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end
