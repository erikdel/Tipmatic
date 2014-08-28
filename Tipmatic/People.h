//
//  People.h
//  Tipmatic
//
//  Created by EDL on 8/21/14.
//  Copyright (c) 2014 Elkride Software LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface People : UIViewController {
    
    NSUserDefaults *defaults;
    
}

@property (strong, nonatomic) IBOutlet UITextField *peopleTextField;

@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIButton *enterButton;

@property (strong, nonatomic) IBOutlet UILabel *separatorLabel;
@property (strong, nonatomic) IBOutlet UILabel *topBarLabel;
@property (strong, nonatomic) IBOutlet UILabel *underlineLabel;

@end
