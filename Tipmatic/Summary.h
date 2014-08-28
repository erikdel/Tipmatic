//
//  Summary.h
//  Tipmatic
//
//  Created by EDL on 8/21/14.
//  Copyright (c) 2014 Elkride Software LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Summary : UIViewController {
    
    NSNumberFormatter * formatter;
    
    NSUserDefaults *defaults;
    
}

//@property (strong, nonatomic) IBOutlet UITextField *totalTextField;

@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIButton *startOverButton;

@property (strong, nonatomic) IBOutlet UIImageView *circleBackgroundImageView;

@property (strong, nonatomic) IBOutlet UILabel *topBarLabel;
//@property (strong, nonatomic) IBOutlet UILabel *totalLabel;
//@property (strong, nonatomic) IBOutlet UILabel *totalValueLabel;
//@property (strong, nonatomic) IBOutlet UILabel *numberOfPeopleLabel;
//@property (strong, nonatomic) IBOutlet UILabel *numberOfPeopleValueLabel;
//@property (strong, nonatomic) IBOutlet UILabel *tipLabel;
@property (strong, nonatomic) IBOutlet UILabel *tipValueLabel;
@property (strong, nonatomic) IBOutlet UILabel *breakdownLabel;
@property (strong, nonatomic) IBOutlet UILabel *perPersonLabel;

@property (strong, nonatomic) IBOutlet UIStepper *tipStepper;

@end
