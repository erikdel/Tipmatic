//
//  People.m
//  Tipmatic
//
//  Created by EDL on 8/21/14.
//  Copyright (c) 2014 Elkride Software LLC. All rights reserved.
//

#import "People.h"

@interface People ()

@end

@implementation People

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
    
    //create underline label
    [self createUnderlineLabel];
    
    //create the separator label
    [self createSeparatorLabel];
    
    //create total text field
    [self createNumberTextField];
    
    //create back button
    [self createBackButton];
    
    //create enter button
    [self createEnterButton];
    
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

#pragma mark text field methods

- (IBAction)totalTextFieldEditing:(id)sender {
    
    [self matchUnderlineLabel];
    
    [self checkExpenseAmountIfZero];
    
}

- (void)createNumberTextField {
    
    _peopleTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 280, 60)];
    _peopleTextField.keyboardType = UIKeyboardTypeNumberPad;
    _peopleTextField.textAlignment = NSTextAlignmentCenter;
    _peopleTextField.font = [UIFont fontWithName:@"AppleSDGothicNeo-Thin" size:40];
    _peopleTextField.textColor = [UIColor darkGrayColor];
    [_peopleTextField addTarget:self
                        action:@selector(totalTextFieldEditing:)
              forControlEvents:UIControlEventAllEditingEvents];
    
    [self.view addSubview:_peopleTextField];
    
    [_peopleTextField becomeFirstResponder];
    
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
            
            [self checkIfValidNumber];
            
            [defaults setObject:_peopleTextField.text forKey:@"numberOfPeople"];
            [defaults synchronize];
            
            [_peopleTextField resignFirstResponder];
            
            [self performSegueWithIdentifier:@"PeopleToHome" sender:self];
            
        }
            
            break;
            
        case 3: //enter button
            
        {
            
            NSLog(@"enter button pressed");
            
            [self checkIfValidNumber];
            
            [defaults setObject:_peopleTextField.text forKey:@"numberOfPeople"];
            [defaults synchronize];
            
            [_peopleTextField resignFirstResponder];
            
            [self performSegueWithIdentifier:@"PeopleToSummary" sender:self];
            
        }
            
            break;
            
        default:
            
            break;
    }
    
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

- (void)createEnterButton {
    
    _enterButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 31)];
    _enterButton.center = CGPointMake(self.view.frame.size.width/2, _underlineLabel.frame.origin.y + 90);
    _enterButton.tag = 3;
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
    _topBarLabel.text = @"How many?";
    //_topBarLabel.backgroundColor = [UIColor colorWithRed:204/255.0f green:55/255.0f blue:75/255.0f alpha:1]; //sweet cherry 1
    _topBarLabel.alpha = 1;
    
    
    [self.view addSubview:_topBarLabel];
    //[self.view addSubview:_bottomBarLabel];
    
}

- (void)createUnderlineLabel {
    
    _underlineLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, _peopleTextField.frame.origin.y + 120, 280, 60)];
    _underlineLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:40];
    _underlineLabel.textAlignment = NSTextAlignmentCenter;
    _underlineLabel.textColor = [UIColor darkGrayColor];
    
    [self.view addSubview:_underlineLabel];
    
}

- (void)matchUnderlineLabel {
    
    if ([_peopleTextField.text length] < 1) {
        
        _underlineLabel.text = @"_";
        
    } else {
        
        _underlineLabel.text = [@"_" stringByPaddingToLength:[_peopleTextField.text length]
                                                  withString:@"_"
                                             startingAtIndex:0];
        
    }
    
    
}

#pragma mark miscellaneous methods

- (void)initializeDefaults {
    
    defaults = [NSUserDefaults standardUserDefaults];
    
}

- (void)checkExpenseAmountIfZero {
    
    if ([_peopleTextField.text isEqualToString:@""] || [_peopleTextField.text doubleValue] == 0) {
        
        _enterButton.enabled = NO;
        
    } else {
        
        _enterButton.enabled = YES;
        
    }
    
}

- (void)checkIfValidNumber {
    
    NSScanner *doubleScanner = [NSScanner scannerWithString:_peopleTextField.text];
    double doubleValue;
    [doubleScanner scanDouble:&doubleValue];
    
    if (doubleValue == 0) {
        
        _enterButton.enabled = NO;
        [_peopleTextField becomeFirstResponder];
        
    } else {
        
        _enterButton.enabled = YES;
        _peopleTextField.text = [NSString stringWithFormat:@"%.0f", fabs(doubleValue)]; //fabs to auto-correct to positive value
        
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
