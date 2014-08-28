//
//  Summary.m
//  Tipmatic
//
//  Created by EDL on 8/21/14.
//  Copyright (c) 2014 Elkride Software LLC. All rights reserved.
//

#import "Summary.h"

@interface Summary ()

@end

@implementation Summary

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
    //initialize defaults
    [self initializeDefaults];
    
    //create tip stepper
    [self createTipStepper];
    
    //create circle background image
    [self createCircleBackgroundImageView];
    
    //create total label
    //[self createTotalLabel];
    
    //create total value label
    //[self createTotalValueLabel];
    
    //create number of people label
    //[self createNumberOfPeopleLabel];
    
    //create number of people value label
    //[self createNumberOfPeopleValueLabel];
    
    //create tip label
    //[self createTipLabel];
    
    //create tip value label
    [self createTipValueLabel];
    
    //create breakdown label
    [self createBreakdownLabel];
    
    //create per person label
    [self createPerPersonLabel];
    
    //create top label
    [self createBarLabel];
    
    //create back button
    //[self createBackButton];
    
    //create start over button
    [self createStartOverButton];
    
    //tests
    NSLog(@"home loaded");
    
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

/*
- (UIButton *)sender {
    
    sender.
}
 */

- (IBAction)buttonHighlighted:(UIButton *)sender {
    
    sender.showsTouchWhenHighlighted = YES;
    
}

- (IBAction)buttonPressed:(UIButton *)sender {
    
    switch (sender.tag) {
            
        case 2: //back button
            
        {
            
            NSLog(@"back button pressed");
            
            [self performSegueWithIdentifier:@"SummaryToPeople" sender:self];
            
        }
            
            break;
            
        case 3: //start over button
            
        {
            
            
            [self performSegueWithIdentifier:@"SummaryToHome" sender:self];
            
            NSLog(@"start over button pressed");
            
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

- (void)createStartOverButton {
    
    _startOverButton = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50)];
    _startOverButton.tag = 3;
    _startOverButton.titleLabel.font = [UIFont fontWithName:@"STHeitiTC-Light" size:15];
    [_startOverButton setBackgroundColor:[self defaultButtonColor]];
    [_startOverButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_startOverButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [_startOverButton setTitle:@"Start Over" forState:UIControlStateNormal];
    [_startOverButton addTarget:self
                         action:@selector(buttonPressed:)
               forControlEvents:UIControlEventTouchUpInside];
    [_startOverButton addTarget:self
                         action:@selector(buttonHighlighted:)
               forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:_startOverButton];
    
}

#pragma mark ui image view methods

- (void)createCircleBackgroundImageView {
    
    _circleBackgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 280, 280)];
    _circleBackgroundImageView.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    _circleBackgroundImageView.image = [UIImage imageNamed:@"circle_background_iphone.png"];
    //_circleBackgroundImageView.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:_circleBackgroundImageView];
    
}

#pragma mark label methods

- (void)createBarLabel {
    
    //create & initialize the top bar
    _topBarLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    //_topBarLabel.backgroundColor = [UIColor colorWithRed:250/255.0f green:250/255.0f blue:250/255.0f alpha:1];
    //_topBarLabel.tintColor
    //_topBarLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:[NSString stringWithFormat:@"top_label%@", [[ImageName sharedInstance] pngName]]]];
    _topBarLabel.backgroundColor = [UIColor colorWithRed:86/255.0f green:176/255.0f blue:187/255.0f alpha:1.0];
    _topBarLabel.textAlignment = NSTextAlignmentCenter;
    _topBarLabel.adjustsFontSizeToFitWidth = YES;
    _topBarLabel.minimumScaleFactor = 0.5;
    _topBarLabel.font = [UIFont fontWithName:DEFAULT_LABEL_FONT size:DEFAULT_LABEL_FONT_SIZE];
    _topBarLabel.textColor = [UIColor whiteColor];
    _topBarLabel.text = [NSString stringWithFormat:@"Bill : %@ | People : %@", [self total], [defaults objectForKey:@"numberOfPeople"]];
    //_topBarLabel.backgroundColor = [UIColor colorWithRed:204/255.0f green:55/255.0f blue:75/255.0f alpha:1]; //sweet cherry 1
    _topBarLabel.alpha = 1;
    
    
    [self.view addSubview:_topBarLabel];
    //[self.view addSubview:_bottomBarLabel];
    
}

/*
- (void)createTotalLabel {
    
    _totalLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, self.view.frame.size.width, 50)];
    //_totalLabel.textAlignment = NSTextAlignmentCenter;
    _totalLabel.font = [UIFont fontWithName:DEFAULT_FONT size:DEFAULT_SUMMARY_LABEL_FONT_SIZE];
    _totalLabel.textColor = [UIColor darkGrayColor];
    _totalLabel.text = @"Total : ";
    
    [self.view addSubview:_totalLabel];
    
}
 */

/*
- (void)createTotalValueLabel {
    
    _totalValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 120, 50, 100, 50)];
    _totalValueLabel.textAlignment = NSTextAlignmentCenter;
    _totalValueLabel.font = [UIFont fontWithName:DEFAULT_FONT size:DEFAULT_SUMMARY_LABEL_FONT_SIZE];
    _totalValueLabel.textColor = [UIColor darkGrayColor];
    _totalValueLabel.text = [NSString stringWithFormat:@"%@", [defaults objectForKey:@"total"]];
    //_totalValueLabel.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:_totalValueLabel];
    
}
 */

/*
- (void)createNumberOfPeopleLabel {
    
    _numberOfPeopleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, _totalLabel.frame.origin.y + 50, self.view.frame.size.width, 50)];
    _numberOfPeopleLabel.font = [UIFont fontWithName:DEFAULT_FONT size:DEFAULT_SUMMARY_LABEL_FONT_SIZE];
    _numberOfPeopleLabel.textColor = [UIColor darkGrayColor];
    _numberOfPeopleLabel.text = @"Number of People : ";
    
    [self.view addSubview:_numberOfPeopleLabel];
    
}
 */

/*
- (void)createNumberOfPeopleValueLabel {
    
    _numberOfPeopleValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(_totalValueLabel.frame.origin.x, _totalValueLabel.frame.origin.y + 50, _totalValueLabel.frame.size.width, _totalValueLabel.frame.size.height)];
    _numberOfPeopleValueLabel.textAlignment = NSTextAlignmentCenter;
    _numberOfPeopleValueLabel.font = [UIFont fontWithName:DEFAULT_FONT size:DEFAULT_SUMMARY_LABEL_FONT_SIZE];
    _numberOfPeopleValueLabel.textColor = [UIColor darkGrayColor];
    _numberOfPeopleValueLabel.text = [NSString stringWithFormat:@"%@", [defaults objectForKey:@"numberOfPeople"]];
    //_numberOfPeopleValueLabel.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:_numberOfPeopleValueLabel];
}
 */

/*
- (void)createTipLabel {
    
    _tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, _numberOfPeopleLabel.frame.origin.y + 50, 150, 50)];
    //_numberOfPeopleLabel.textAlignment = NSTextAlignmentCenter;
    _tipLabel.font = [UIFont fontWithName:DEFAULT_FONT size:DEFAULT_SUMMARY_LABEL_FONT_SIZE];
    _tipLabel.textColor = [UIColor darkGrayColor];
    _tipLabel.text = @"Tip : ";
    
    [self.view addSubview:_tipLabel];
    
}
 */

- (void)createTipValueLabel {
    
    _tipValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    _tipValueLabel.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2 + 40);
    _tipValueLabel.textAlignment = NSTextAlignmentCenter;
    _tipValueLabel.font = [UIFont fontWithName:DEFAULT_FONT size:DEFAULT_SUMMARY_LABEL_FONT_SIZE];
    _tipValueLabel.textColor = [UIColor darkGrayColor];
    _tipValueLabel.text = [NSString stringWithFormat:@"w/ %.0f%% tip", _tipStepper.value];
    //_tipValueLabel.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:_tipValueLabel];
    
}

- (void)createBreakdownLabel {
    
    //NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    //[formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    //[formatter setLocale:[NSLocale currentLocale]];
    
    _breakdownLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 220, 100)];
    _breakdownLabel.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2 - 40);
    _breakdownLabel.textAlignment = NSTextAlignmentCenter;
    //_breakdownLabel.lineBreakMode = NSLineBreakByWordWrapping;
    //_breakdownLabel.numberOfLines = 2;
    _breakdownLabel.font = [UIFont fontWithName:@"Avenir-Light" size:50];
    _breakdownLabel.adjustsFontSizeToFitWidth = YES;
    _breakdownLabel.minimumScaleFactor = 0.5;
    _breakdownLabel.textColor = [UIColor darkGrayColor];
    //_breakdownLabel.backgroundColor = [UIColor lightGrayColor];
    //_breakdownLabel.text = [NSString stringWithFormat:@"$ %.2f", [self calculatePerPerson]];
    //_breakdownLabel.text = [formatter stringFromNumber:[NSNumber numberWithFloat:[self calculatePerPerson]]];
    _breakdownLabel.text = [self calculatedPerPersonTotal];
    
    [self.view addSubview:_breakdownLabel];
    
}

- (void)createPerPersonLabel {
    
    int rgb = 160;
    
    _perPersonLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    _perPersonLabel.center = CGPointMake(self.view.frame.size.width/2, _breakdownLabel.frame.origin.y + 80);
    _perPersonLabel.textAlignment = NSTextAlignmentCenter;
    _perPersonLabel.font = [UIFont fontWithName:@"Avenir-Light" size:14];
    _perPersonLabel.textColor = [UIColor colorWithRed:rgb/255.0f green:rgb/255.0f blue:rgb/255.0f alpha:1];;
    _perPersonLabel.text = @"per person";
    
    [self.view addSubview:_perPersonLabel];
    
}

#pragma mark ui stepper methods

- (void)createTipStepper {
    
    //[self initializeDefaults];
    
    //NSLog(@"defaults: %@", [defaults objectForKey:@"defaultTip"]);
    
    _tipStepper = [[UIStepper alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
    _tipStepper.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2 + 80);
    _tipStepper.minimumValue = 0;
    _tipStepper.value = [self tipData];
    _tipStepper.maximumValue = 50;
    _tipStepper.tintColor = [UIColor colorWithRed:190/255.0f green:190/255.0f blue:190/255.0f alpha:1];
    _tipStepper.autorepeat = YES;
    /*[_tipStepper addTarget:self
                    action:@selector(stepperPressed:)
          forControlEvents:UIControlEventTouchUpInside];*/
    [_tipStepper addTarget:self
                    action:@selector(stepperPressed:)
          forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_tipStepper];
    
}

- (IBAction)stepperPressed:(id)sender {
    
    //NSLog(@"stepper value: %f", _tipStepper.value);
    _tipValueLabel.text = [NSString stringWithFormat:@"w/ %.0f%% tip", _tipStepper.value];
    //_breakdownLabel.text = [NSString stringWithFormat:@"$ %.2f", [self calculatePerPerson]];
    _breakdownLabel.text = [self calculatedPerPersonTotal];
    
}

//- (IBAction)stepperPressedContinously:(id)sender

#pragma mark miscellaneous methods

- (void)initializeDefaults {
    
    defaults = [NSUserDefaults standardUserDefaults];
    
    formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [formatter setLocale:[NSLocale currentLocale]];
    
}

/*
- (float)calculatePerPerson {
    
    //NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    //[formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    //[formatter setLocale:[NSLocale currentLocale]];
    
    float total = [[defaults objectForKey:@"total"] floatValue];
    float numberOfPeople = [[defaults objectForKey:@"numberOfPeople"] floatValue];
    
    float perPersonTotal = (total * ( 1 + (_tipStepper.value / 100))) / numberOfPeople;
    
    
    
    return perPersonTotal;
    
}
 */

- (double)tipData {
    
    if ([[defaults objectForKey:@"numberOfPeople"] integerValue] < 6) {
        
        return ([[defaults objectForKey:@"defaultTip"] doubleValue]);
        
    } else {
        
        return ([[defaults objectForKey:@"defaultTipOver5People"] doubleValue]);
        
    }
}

- (NSString *)total {
    
    //NSNumber *temp = [[defaults objectForKey:@"total"] floatValue];
    
    return ([NSString stringWithFormat:@"%@", [formatter stringFromNumber:[NSNumber numberWithFloat:[[defaults objectForKey:@"total"] floatValue]]]]);
    
}

- (NSString *)calculatedPerPersonTotal {
    
    //float total = [[defaults objectForKey:@"total"] floatValue];
    //float numberOfPeople = [[defaults objectForKey:@"numberOfPeople"] floatValue];
    
    /*if ([[defaults objectForKey:@"numberOfPeople"] floatValue] > 5) {
        
        float perPersonTotal = ([[defaults objectForKey:@"total"] floatValue] * ( 1 + (_tipStepper.value / 100))) / ([[defaults objectForKey:@"numberOfPeople"] floatValue]);
        //use default tip
        return ([NSString stringWithFormat:@"%@", [formatter stringFromNumber:[NSNumber numberWithFloat:perPersonTotal]]]);
        
    } else {
        
        //use custom tip for over 5 people
        float perPersonTotal = ([[defaults objectForKey:@"total"] floatValue] * ( 1 + (_tipStepper.value / 100))) / ([[defaults objectForKey:@"numberOfPeople"] floatValue]);
        //use default tip
        return ([NSString stringWithFormat:@"%@", [formatter stringFromNumber:[NSNumber numberWithFloat:perPersonTotal]]]);
        
    }
     */
    
    float perPersonTotal = ([[defaults objectForKey:@"total"] floatValue] * ( 1 + (_tipStepper.value / 100))) / ([[defaults objectForKey:@"numberOfPeople"] floatValue]);
    
    return ([NSString stringWithFormat:@"%@", [formatter stringFromNumber:[NSNumber numberWithFloat:perPersonTotal]]]);
    
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
