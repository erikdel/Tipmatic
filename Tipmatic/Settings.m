//
//  Settings.m
//  Tipmatic
//
//  Created by EDL on 8/21/14.
//  Copyright (c) 2014 Elkride Software LLC. All rights reserved.
//

#import "Settings.h"

@interface Settings ()

@end

@implementation Settings

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
    
    //create top label
    [self createBarLabel];
    
    //create default tip label
    //[self createDefaultTipLabel];
    
    //create default tip over 5 people label
    //[self createDefaultTipOver5PeopleLabel];
    
    //create about text view
    //[self createAboutTextView];
    
    //create back button
    [self createBackButton];
    
    //create default tip button
    [self createDefaultTipButton];
    
    //create default tip over 5 button
    [self createDefaultTipOver5Button];
    
    //create upgrade button
    [self createUpgradeButton];
    
    //create restore purchase button
    [self createRestorePurchaseButton];
    
    //create rate this app button
    [self createRateThisAppButton];
    
    //create send feedback button
    [self createSendFeedbackButton];
    
    //create default tip stepper
    //[self createDefaultTipStepper];
    
    //tests
    NSLog(@"people loaded");
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    
    return YES;
    
}

#pragma mark button methods

- (IBAction)buttonHighlighted:(UIButton *)sender {
    
    sender.showsTouchWhenHighlighted = YES;
    
}

- (IBAction)buttonPressed:(UIButton *)sender {
    
    switch (sender.tag) {
            
        case 2: //back button
            
        {
            
            NSLog(@"back button pressed");
            
            //[self checkIfValidNumber];
            
            //[defaults setObject:_peopleTextField.text forKey:@"numberOfPeople"];
            //[defaults synchronize];
            
            //[_peopleTextField resignFirstResponder];
            
            [self performSegueWithIdentifier:@"SettingsToHome" sender:self];
            
        }
            
            break;
            
        case 3: //default tip button
            
        {
            
            NSLog(@"default tip pressed");
            
            [self defaultTipButtonPressed];
            
        }
            
            break;
            
        case 4: //default tip over 5 button
            
        {
            
            NSLog(@"default tip over 5 button pressed");
            
            [self defaultTipOver5ButtonPressed];
            
        }
            
            break;
            
        case 5: //upgrade button
            
        {
            
            NSLog(@"upgrade pressed");
            
        }
            
            break;
            
        case 6: //restore purchase button
            
        {
            
            NSLog(@"restore purchase pressed");
            
        }
            
            break;
            
        case 7: //rate this app button
            
        {
            
            NSLog(@"rate this app pressed");
            
        }
            
            break;
            
        case 8: //send feedback button
            
        {
            
            NSLog(@"send feedback pressed");
            
        }
            
            break;
            
        case 9: //close default tip option button
            
        {
            
            //save the values
            [defaults setObject:[NSString stringWithFormat:@"%.0f", _defaultTipStepper.value] forKey:@"defaultTip"];
            [defaults synchronize];
            
            [_defaultTipButton setTitle:[NSString stringWithFormat:@"Default Tip ( %@%% )", [defaults objectForKey:@"defaultTip"]] forState:UIControlStateNormal];
            
            [self closeDefaultTipOptionPressed];
            
        }
            
            break;
            
        case 10: //close default tip over 5 option button
            
        {
            
            //save the values
            [defaults setObject:[NSString stringWithFormat:@"%.0f", _tipOver5PeopleStepper.value] forKey:@"defaultTipOver5People"];
            [defaults synchronize];
            
            [_defaultTipOver5Button setTitle:[NSString stringWithFormat:@"Default Tip For 6+ People ( %@%% )", [defaults objectForKey:@"defaultTipOver5People"]] forState:UIControlStateNormal];
            
            [self closeDefaultTipOver5OptionPressed];
            
        }
            
            break;
            
        default:
            
            break;
    }
    
}

- (UIColor *)defaultButtonColor {
    
    return ([UIColor colorWithRed:236/255.0f green:240/255.0f blue:241/255.0f alpha:1.0]);
    
}

- (void)createBackButton {
    
    _backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    _backButton.tag = 2;
    [_backButton setImage:[UIImage imageNamed:@"back_iphone.png"] forState:UIControlStateNormal];
    [_backButton addTarget:self
                    action:@selector(buttonPressed:)
          forControlEvents:UIControlEventTouchUpInside];
    [_backButton addTarget:self
                    action:@selector(buttonHighlighted:)
          forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:_backButton];
    
}

- (void)createDefaultTipButton {
    
    _defaultTipButton = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 305, 320, 50)];
    _defaultTipButton.tag = 3;
    _defaultTipButton.backgroundColor = [self defaultButtonColor];
    _defaultTipButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _defaultTipButton.titleLabel.font = [UIFont fontWithName:DEFAULT_BUTTON_FONT size:DEFAULT_BUTTON_FONT_SIZE];
    [_defaultTipButton setTitle:[NSString stringWithFormat:@"Default Tip ( %@%% )", [defaults objectForKey:@"defaultTip"]] forState:UIControlStateNormal];
    [_defaultTipButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_defaultTipButton addTarget:self
                          action:@selector(buttonPressed:)
                forControlEvents:UIControlEventTouchUpInside];
    [_defaultTipButton addTarget:self
                          action:@selector(buttonHighlighted:)
                forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:_defaultTipButton];
    
}

- (void)createDefaultTipOver5Button {
    
    _defaultTipOver5Button = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 254, 320, 50)];
    _defaultTipOver5Button.tag = 4;
    _defaultTipOver5Button.backgroundColor = [self defaultButtonColor];
    _defaultTipOver5Button.titleLabel.textAlignment = NSTextAlignmentCenter;
    _defaultTipOver5Button.titleLabel.font = [UIFont fontWithName:DEFAULT_BUTTON_FONT size:DEFAULT_BUTTON_FONT_SIZE];
    [_defaultTipOver5Button setTitle:[NSString stringWithFormat:@"Default Tip For 6+ People ( %@%% )", [defaults objectForKey:@"defaultTipOver5People"]] forState:UIControlStateNormal];
    [_defaultTipOver5Button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_defaultTipOver5Button addTarget:self
                               action:@selector(buttonPressed:)
                     forControlEvents:UIControlEventTouchUpInside];
    [_defaultTipOver5Button addTarget:self
                               action:@selector(buttonHighlighted:)
                     forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:_defaultTipOver5Button];
    
}

- (void)createUpgradeButton {
    
    _upgradeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 203, 320, 50)];
    _upgradeButton.tag = 5;
    _upgradeButton.backgroundColor = [self defaultButtonColor];
    _upgradeButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _upgradeButton.titleLabel.font = [UIFont fontWithName:DEFAULT_BUTTON_FONT size:DEFAULT_BUTTON_FONT_SIZE];
    //_upgradeButton.contentHorizontalAlignment = 1;
    [_upgradeButton setTitle:@"Upgrade to Unlimited Use" forState:UIControlStateNormal];
    [_upgradeButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_upgradeButton addTarget:self
                       action:@selector(buttonPressed:)
             forControlEvents:UIControlEventTouchUpInside];
    [_upgradeButton addTarget:self
                       action:@selector(buttonHighlighted:)
             forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:_upgradeButton];
    
}

- (void)createRestorePurchaseButton {
    
    _restorePurchaseButton = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 152, 320, 50)];
    _restorePurchaseButton.tag = 6;
    _restorePurchaseButton.backgroundColor = [self defaultButtonColor];
    _restorePurchaseButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _restorePurchaseButton.titleLabel.font = [UIFont fontWithName:DEFAULT_BUTTON_FONT size:DEFAULT_BUTTON_FONT_SIZE];
    //_restorePurchaseButton.contentHorizontalAlignment = 1;
    [_restorePurchaseButton setTitle:@"Restore Purchase" forState:UIControlStateNormal];
    [_restorePurchaseButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_restorePurchaseButton addTarget:self
                               action:@selector(buttonPressed:)
                     forControlEvents:UIControlEventTouchUpInside];
    [_restorePurchaseButton addTarget:self
                               action:@selector(buttonHighlighted:)
                     forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:_restorePurchaseButton];
    
}

- (void)createRateThisAppButton {
    
    _rateThisAppButton = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 101, 320, 50)];
    _rateThisAppButton.tag = 7;
    _rateThisAppButton.backgroundColor = [self defaultButtonColor];
    _rateThisAppButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _rateThisAppButton.titleLabel.font = [UIFont fontWithName:DEFAULT_BUTTON_FONT size:DEFAULT_BUTTON_FONT_SIZE];
    //_rateThisAppButton.contentHorizontalAlignment = 1;
    [_rateThisAppButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_rateThisAppButton setTitle:@"Rate this App" forState:UIControlStateNormal];
    [_rateThisAppButton addTarget:self
                           action:@selector(buttonPressed:)
                 forControlEvents:UIControlEventTouchUpInside];
    [_rateThisAppButton addTarget:self
                           action:@selector(buttonHighlighted:)
                 forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:_rateThisAppButton];
    
}

- (void)createSendFeedbackButton {
    
    _sendFeedbackButton = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 50, 320, 50)];
    _sendFeedbackButton.tag = 8;
    _sendFeedbackButton.backgroundColor = [self defaultButtonColor];
    _sendFeedbackButton.titleLabel.font = [UIFont fontWithName:DEFAULT_BUTTON_FONT size:DEFAULT_BUTTON_FONT_SIZE];
    //_sendFeedbackButton.contentHorizontalAlignment = 1;
    [_sendFeedbackButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_sendFeedbackButton setTitle:@"Send Feedback" forState:UIControlStateNormal];
    [_sendFeedbackButton addTarget:self
                            action:@selector(buttonPressed:)
                  forControlEvents:UIControlEventTouchUpInside];
    [_sendFeedbackButton addTarget:self
                            action:@selector(buttonHighlighted:)
                  forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:_sendFeedbackButton];
    
}

- (void)createCloseDefaultTipOptionButton {
    
    _closeDefaultTipOptionButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    _closeDefaultTipOptionButton.tag = 9;
    _closeDefaultTipOptionButton.center = CGPointMake(self.view.frame.size.width/2, _defaultTipStepper.frame.origin.y + 70);
    _closeDefaultTipOptionButton.titleLabel.font = [UIFont fontWithName:@"STHeitiTC-Light" size:15];
    [_closeDefaultTipOptionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_closeDefaultTipOptionButton setTitle:@"Done" forState:UIControlStateNormal];
    [_closeDefaultTipOptionButton addTarget:self
                                     action:@selector(buttonPressed:)
                           forControlEvents:UIControlEventTouchUpInside];
    [_closeDefaultTipOptionButton addTarget:self
                                     action:@selector(buttonHighlighted:)
                           forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:_closeDefaultTipOptionButton];
    
}

- (void)createCloseDefaultTipOver5OptionButton {
    
    _closeDefaultTipOver5OptionButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    _closeDefaultTipOver5OptionButton.tag = 10;
    _closeDefaultTipOver5OptionButton.center = CGPointMake(self.view.frame.size.width/2, _tipOver5PeopleStepper.frame.origin.y + 70);
    _closeDefaultTipOver5OptionButton.titleLabel.font = [UIFont fontWithName:@"STHeitiTC-Light" size:15];
    [_closeDefaultTipOver5OptionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_closeDefaultTipOver5OptionButton setTitle:@"Done" forState:UIControlStateNormal];
    [_closeDefaultTipOver5OptionButton addTarget:self
                                     action:@selector(buttonPressed:)
                           forControlEvents:UIControlEventTouchUpInside];
    [_closeDefaultTipOver5OptionButton addTarget:self
                                     action:@selector(buttonHighlighted:)
                           forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:_closeDefaultTipOver5OptionButton];
    
}

#pragma mark ui image methods 

- (void)createBackgroundImageView {
    
    _backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _backgroundImageView.backgroundColor = [UIColor colorWithRed:86/255.0f green:176/255.0f blue:187/255.0f alpha:1.0];
    _backgroundImageView.alpha = 1;
    
    [self.view addSubview:_backgroundImageView];
    
}

/*
- (void)unloadBackgroundImageView {
    
    _
}
 */

#pragma mark label methods

- (void)createBarLabel {
    
    //create & initialize the top bar
    _topBarLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    //_topBarLabel.backgroundColor = [UIColor colorWithRed:250/255.0f green:250/255.0f blue:250/255.0f alpha:1];
    //_topBarLabel.tintColor
    //_topBarLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:[NSString stringWithFormat:@"top_label%@", [[ImageName sharedInstance] pngName]]]];
    _topBarLabel.backgroundColor = [UIColor colorWithRed:86/255.0f green:176/255.0f blue:187/255.0f alpha:1.0];
    _topBarLabel.textAlignment = NSTextAlignmentCenter;
    _topBarLabel.font = [UIFont fontWithName:@"EuphemiaUCAS" size:18];
    _topBarLabel.textColor = [UIColor whiteColor];
    _topBarLabel.text = @"Settings";
    //_topBarLabel.backgroundColor = [UIColor colorWithRed:204/255.0f green:55/255.0f blue:75/255.0f alpha:1]; //sweet cherry 1
    _topBarLabel.alpha = 1;
    
    
    [self.view addSubview:_topBarLabel];
    //[self.view addSubview:_bottomBarLabel];
    
}

- (void)createDefaultTipLabel {
    
    _defaultTipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    _defaultTipLabel.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2 - 50);
    _defaultTipLabel.backgroundColor = [UIColor clearColor];
    _defaultTipLabel.textAlignment = NSTextAlignmentCenter;
    _defaultTipLabel.font = [UIFont fontWithName:DEFAULT_BUTTON_FONT size:50];
    _defaultTipLabel.textColor = [UIColor whiteColor];
    _defaultTipLabel.text = [NSString stringWithFormat:@"%.0f%%" ,_defaultTipStepper.value];
    
    [self.view addSubview:_defaultTipLabel];
    
}

- (void)createDefaultTipOver5PeopleLabel {
    
    _defaultTipOver5PeopleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    _defaultTipOver5PeopleLabel.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2 - 50);
    _defaultTipOver5PeopleLabel.backgroundColor = [UIColor clearColor];
    _defaultTipOver5PeopleLabel.textAlignment = NSTextAlignmentCenter;
    _defaultTipOver5PeopleLabel.font = [UIFont fontWithName:DEFAULT_BUTTON_FONT size:50];
    _defaultTipOver5PeopleLabel.textColor = [UIColor whiteColor];
    _defaultTipOver5PeopleLabel.text = [NSString stringWithFormat:@"%.0f%%" ,_tipOver5PeopleStepper.value];
    
    [self.view addSubview:_defaultTipOver5PeopleLabel];
    
}

#pragma mark text view methods 

- (void)createAboutTextView {
    
    NSLog(@"_defaultTipLabel.frame.origin.y : %f", _defaultTipLabel.frame.origin.y);
    
    _aboutTextView = [[UITextView alloc] initWithFrame:CGRectMake(20, _topBarLabel.frame.origin.y + 51, 280, (self.view.frame.size.height - 356))];
    _aboutTextView.textAlignment = NSTextAlignmentCenter;
    _aboutTextView.backgroundColor = [UIColor lightGrayColor];
    _aboutTextView.font = [UIFont fontWithName:@"STHeitiSC-Light" size:12];
    _aboutTextView.textColor = [UIColor darkGrayColor];
    _aboutTextView.text = [NSString stringWithFormat:@"Tipmatic version %@\n\n\n© Elkride Software LLC", [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
    
    [_aboutTextView addObserver:self
                     forKeyPath:@"contentSize"
                        options:(NSKeyValueObservingOptionNew)
                        context:NULL];
    
    [self.view addSubview:_aboutTextView];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context {
    
    UITextView *tv = object;
    CGFloat topCorrect = ([tv bounds].size.height - [tv contentSize].height * [tv zoomScale])  / 2.0;
    topCorrect = ( topCorrect < 0.0 ? 0.0 : topCorrect );
    tv.contentOffset = (CGPoint){.x = 0, .y = -topCorrect};
    
}

#pragma mark ui stepper methods

- (void)createDefaultTipStepper {
    
    _defaultTipStepper = [[UIStepper alloc] init];
    _defaultTipStepper.tintColor = [self defaultButtonColor];
    _defaultTipStepper.minimumValue = 0;
    _defaultTipStepper.value = [[defaults objectForKey:@"defaultTip"] floatValue];
    _defaultTipStepper.maximumValue = 50;
    _defaultTipStepper.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2 + 10);
    _defaultTipStepper.autorepeat = YES;
    [_defaultTipStepper addTarget:self
                           action:@selector(defaultTipStepperPressed:)
                 forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_defaultTipStepper];
    
}

- (IBAction)defaultTipStepperPressed:(id)sender {
    
    //NSLog(@"stepper value: %f", _tipStepper.value);
    _defaultTipLabel.text = [NSString stringWithFormat:@"%.0f%%", _defaultTipStepper.value];
    //_breakdownLabel.text = [NSString stringWithFormat:@"$ %.2f", [self calculatePerPerson]];
    
}

- (void)createTipOver5Stepper {
    
    _tipOver5PeopleStepper = [[UIStepper alloc] init];
    _tipOver5PeopleStepper.tintColor = [self defaultButtonColor];
    _tipOver5PeopleStepper.minimumValue = 0;
    _tipOver5PeopleStepper.value = [[defaults objectForKey:@"defaultTipOver5People"] floatValue];
    _tipOver5PeopleStepper.maximumValue = 50;
    _tipOver5PeopleStepper.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2 + 10);
    _tipOver5PeopleStepper.autorepeat = YES;
    [_tipOver5PeopleStepper addTarget:self
                               action:@selector(tipOver5StepperPressed:)
                     forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_tipOver5PeopleStepper];
    
}

- (IBAction)tipOver5StepperPressed:(id)sender {
    
    //NSLog(@"stepper value: %f", _tipStepper.value);
    _defaultTipOver5PeopleLabel.text = [NSString stringWithFormat:@"%.0f%%", _tipOver5PeopleStepper.value];
    //_breakdownLabel.text = [NSString stringWithFormat:@"$ %.2f", [self calculatePerPerson]];
    
}

#pragma mark miscellaneous methods

- (void)initializeDefaults {
    
    defaults = [NSUserDefaults standardUserDefaults];
    
}

- (void)defaultTipButtonPressed {
    
    //create the background image
    [self createBackgroundImageView];
    
    //disable all buttons
    _backButton.enabled = NO;
    _defaultTipButton.enabled = NO;
    _defaultTipOver5Button.enabled = NO;
    _upgradeButton.enabled = NO;
    _restorePurchaseButton.enabled = NO;
    _rateThisAppButton.enabled = NO;
    _sendFeedbackButton.enabled = NO;
    
    //create default tip ui stepper
    [self createDefaultTipStepper];
    
    //create default tip label
    [self createDefaultTipLabel];
    
    //create done button
    [self createCloseDefaultTipOptionButton];
    
}

- (void)defaultTipOver5ButtonPressed {
    
    //create the background image
    [self createBackgroundImageView];
    
    //disable all buttons
    _backButton.enabled = NO;
    _defaultTipButton.enabled = NO;
    _defaultTipOver5Button.enabled = NO;
    _upgradeButton.enabled = NO;
    _restorePurchaseButton.enabled = NO;
    _rateThisAppButton.enabled = NO;
    _sendFeedbackButton.enabled = NO;
    
    //create tip over 5 ui stepper
    [self createTipOver5Stepper];
    
    //create default tip label
    [self createDefaultTipOver5PeopleLabel];
    
    //create done button
    [self createCloseDefaultTipOver5OptionButton];
    
}

- (void)closeDefaultTipOptionPressed {
    
    //remove background image view
    [_backgroundImageView removeFromSuperview];
    
    //enable all buttons
    //disable all buttons
    _backButton.enabled = YES;
    _defaultTipButton.enabled = YES;
    _defaultTipOver5Button.enabled = YES;
    _upgradeButton.enabled = YES;
    _restorePurchaseButton.enabled = YES;
    _rateThisAppButton.enabled = YES;
    _sendFeedbackButton.enabled = YES;
    
    //remove default tip ui stepper
    [_defaultTipStepper removeFromSuperview];
    
    //remove default tip label
    [_defaultTipLabel removeFromSuperview];
    
    //remove the close button
    [_closeDefaultTipOptionButton removeFromSuperview];
    
}

- (void)closeDefaultTipOver5OptionPressed {
    
    //remove background image view
    [_backgroundImageView removeFromSuperview];
    
    //enable all buttons
    //disable all buttons
    _backButton.enabled = YES;
    _defaultTipButton.enabled = YES;
    _defaultTipOver5Button.enabled = YES;
    _upgradeButton.enabled = YES;
    _restorePurchaseButton.enabled = YES;
    _rateThisAppButton.enabled = YES;
    _sendFeedbackButton.enabled = YES;
    
    //remove default tip ui stepper
    [_tipOver5PeopleStepper removeFromSuperview];
    
    //remove default tip label
    [_defaultTipOver5PeopleLabel removeFromSuperview];
    
    //remove the close button
    [_closeDefaultTipOver5OptionButton removeFromSuperview];
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
