//
//  Home.m
//  Tipmatic
//
//  Created by EDL on 8/21/14.
//  Copyright (c) 2014 Elkride Software LLC. All rights reserved.
//

#import "Home.h"

@interface Home ()

@end

@implementation Home

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //initialize defaults
    [self initializeDefaults];
    
    //create the separator label
    [self createSeparatorLabel];
    
    //create top label
    [self createBarLabel];
    
    //create underline label
    [self createUnderlineLabel];
    
    //create total text field
    [self createTotalTextField];
    
    //create enter button
    [self createEnterButton];
    
    //create settings button
    [self createSettingsButton];
    
    //tests
    //NSLog(@"home loaded");
    //NSLog(@"defaultTipOver5People: %@", [defaults objectForKey:@"defaultTipOver5People"]);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    
    //check if the app has been used more than 20 times; if so, force the user to upgrade
    [self checkEnteredBackgroundCount];
    
}

- (BOOL)prefersStatusBarHidden {
    
    return YES;

}

#pragma mark text field methods

- (IBAction)totalTextFieldEditing:(id)sender {
    
    [self matchUnderlineLabel];
    
    [self checkExpenseAmountIfZero];
    
}

- (void)createTotalTextField {
    
    _totalTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 280, 60)];
    _totalTextField.keyboardType = UIKeyboardTypeDecimalPad;
    _totalTextField.textAlignment = NSTextAlignmentCenter;
    _totalTextField.font = [UIFont fontWithName:DEFAULT_FONT size:45];
    _totalTextField.textColor = [UIColor darkGrayColor];
    [_totalTextField addTarget:self
                        action:@selector(totalTextFieldEditing:)
              forControlEvents:UIControlEventAllEditingEvents];
    
    [self.view addSubview:_totalTextField];
    
    [_totalTextField becomeFirstResponder];
    
}

#pragma mark button methods

- (IBAction)buttonHighlighted:(UIButton *)sender {
    
    sender.showsTouchWhenHighlighted = YES;
    
}

- (IBAction)buttonPressed:(UIButton *)sender {
    
    switch (sender.tag) {
            
        case 2: //enter button
            
        {
            
            NSLog(@"enter button pressed");
            
            [self checkIfValidNumber];
            
            [defaults setObject:_totalTextField.text forKey:@"total"];
            [defaults synchronize];
            
            [_totalTextField resignFirstResponder];
            
            [self performSegueWithIdentifier:@"HomeToPeople" sender:self];
            
            /*
             [UIView transitionWithView:_mainImage
                              duration:IMAGE_ANIMATION_DURATION
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:^{
                                _mainImage.backgroundColor = [[PatternData sharedInstance] randomPattern];
                                [_quoteTextView removeFromSuperview];
                                [self createQuoteTextView];
                                
                            }
                            completion:nil];
             */
            
        }
            
            break;
            
        case 3: //settings button
            
        {
            
            [_totalTextField resignFirstResponder];
            
            [self performSegueWithIdentifier:@"HomeToSettings" sender:self];
            
            NSLog(@"settings button pressed");
            
        }
            
            break;
            
        default:
            
            break;
    }
}

- (void)createEnterButton {
    
    _enterButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 31)];
    _enterButton.center = CGPointMake(self.view.frame.size.width/2, _underlineLabel.frame.origin.y + 90);
    _enterButton.tag = 2;
    _enterButton.titleLabel.font = [UIFont fontWithName:@"STHeitiTC-Light" size:15];
    [_enterButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_enterButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [_enterButton setTitle:@"Enter" forState:UIControlStateNormal];
    [_enterButton addTarget:self
                     action:@selector(buttonPressed:)
           forControlEvents:UIControlEventTouchUpInside];
    [_enterButton addTarget:self
                     action:@selector(buttonHighlighted:)
           forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:_enterButton];
    
}

- (void)createSettingsButton {
    
    _settingsButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    _settingsButton.tag = 3;
    _settingsButton.alpha = 0.70;
    [_settingsButton setImage:[UIImage imageNamed:@"settings_iphone.png"] forState:UIControlStateNormal];
    [_settingsButton addTarget:self
                        action:@selector(buttonPressed:)
              forControlEvents:UIControlEventTouchUpInside];
    [_settingsButton addTarget:self
                        action:@selector(buttonHighlighted:)
              forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:_settingsButton];
    
}

#pragma mark label methods

- (void)createSeparatorLabel {
    
    //create & initialize the separator bar
    _separatorLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 217, self.view.frame.size.width, 1)];
    _separatorLabel.backgroundColor = [UIColor colorWithRed:217/255.0f green:217/255.0f blue:217/255.0f alpha:1.0];
    _separatorLabel.alpha = 1;
    
    [self.view addSubview:_separatorLabel];
    
}

- (void)createBarLabel {
    
    //create & initialize the top bar
    _topBarLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    //_topBarLabel.backgroundColor = [UIColor colorWithRed:250/255.0f green:250/255.0f blue:250/255.0f alpha:1];
    //_topBarLabel.tintColor
    //_topBarLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:[NSString stringWithFormat:@"top_label%@", [[ImageName sharedInstance] pngName]]]];
    _topBarLabel.backgroundColor = [UIColor colorWithRed:86/255.0f green:176/255.0f blue:187/255.0f alpha:1.0];
    _topBarLabel.textAlignment = NSTextAlignmentCenter;
    _topBarLabel.font = [UIFont fontWithName:DEFAULT_LABEL_FONT size:DEFAULT_LABEL_FONT_SIZE];
    _topBarLabel.textColor = [UIColor whiteColor];
    _topBarLabel.text = @"How much?";
    //_topBarLabel.backgroundColor = [UIColor colorWithRed:204/255.0f green:55/255.0f blue:75/255.0f alpha:1]; //sweet cherry 1
    _topBarLabel.alpha = 1;
    
    
    [self.view addSubview:_topBarLabel];
    //[self.view addSubview:_bottomBarLabel];
    
}

- (void)createUnderlineLabel {
    
    _underlineLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, _totalTextField.frame.origin.y + 120, 280, 60)];
    _underlineLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:45];
    _underlineLabel.textAlignment = NSTextAlignmentCenter;
    _underlineLabel.textColor = [UIColor darkGrayColor];
    
    [self.view addSubview:_underlineLabel];
    
}

- (void)matchUnderlineLabel {
    
    if ([_totalTextField.text length] < 1) {
        
        _underlineLabel.text = @"_";
        
    } else {
        
        _underlineLabel.text = [@"_" stringByPaddingToLength:[_totalTextField.text length]
                                                  withString:@"_"
                                             startingAtIndex:0];

    }
    
    
}

#pragma mark store kit methods

/*
- (BOOL)canMakePurchases {
    
    return [SKPaymentQueue canMakePayments];
    
}
*/


#pragma mark miscellaneous methods

- (void)initializeDefaults {
    
    defaults = [NSUserDefaults standardUserDefaults];
    
    /*
     if ([[defaults objectForKey:@"defaultTip"] isEqualToString:@"0"] || [[defaults objectForKey:@"defaultTip"] isEqualToString:@""]) {
        
        [defaults setObject:@"15" forKey:@"defaultTip"];
        [defaults synchronize];
        
    }
     */
    
}


- (void)checkExpenseAmountIfZero {
    
    if ([_totalTextField.text isEqualToString:@""] || [_totalTextField.text doubleValue] == 0) {
        
        _enterButton.enabled = NO;
        
    } else {
        
        _enterButton.enabled = YES;
        
    }
    
}

- (void)checkIfValidNumber {
    
    NSScanner *doubleScanner = [NSScanner scannerWithString:_totalTextField.text];
    double doubleValue;
    [doubleScanner scanDouble:&doubleValue];
    
    if (doubleValue == 0) {
        
        _enterButton.enabled = NO;
        [_totalTextField becomeFirstResponder];
        
    } else {
        
        _enterButton.enabled = YES;
        _totalTextField.text = [NSString stringWithFormat:@"%.2f", fabs(doubleValue)]; //fabs to auto-correct to positive value
        
    }
    
}

- (void)checkEnteredBackgroundCount {
    
    if ([[defaults objectForKey:@"enteredBackgroundCount"] integerValue] > 5) {
        
        NSLog(@"enteredBackgroundCount reached 20");
        
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
