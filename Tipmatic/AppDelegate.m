//
//  AppDelegate.m
//  Tipmatic
//
//  Created by EDL on 8/21/14.
//  Copyright (c) 2014 Elkride Software LLC. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [self initializeDefaults];
    
    //create default tips
    if ([[defaults objectForKey:@"defaultTip"] isEqualToString:@"0"] || [[defaults objectForKey:@"defaultTip"] isEqualToString:@""] || ![defaults objectForKey:@"defaultTip"]) {
        
        [defaults setObject:@"15" forKey:@"defaultTip"];
        [defaults synchronize];
        
    }
    
    if ([[defaults objectForKey:@"defaultTipOver5People"] isEqualToString:@"0"] || [[defaults objectForKey:@"defaultTipOver5People"] isEqualToString:@""] || ![defaults objectForKey:@"defaultTipOver5People"]) {
        
        [defaults setObject:@"18" forKey:@"defaultTipOver5People"];
        [defaults synchronize];
        
    }
    
    return YES;
    
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    [self initializeDefaults];
    
    if (![defaults objectForKey:@"enteredBackgroundCount"] || [[defaults objectForKey:@"enteredBackgroundCount"] isEqualToString:@""]) {
        
        [defaults setObject:@"0" forKey:@"enteredBackgroundCount"];
        [defaults synchronize];
        
    }
    
    int enteredBackgroundCount = (int)[[defaults objectForKey:@"enteredBackgroundCount"] integerValue];
    enteredBackgroundCount++;
    [defaults setObject:[NSString stringWithFormat:@"%d", enteredBackgroundCount] forKey:@"enteredBackgroundCount"];
    [defaults synchronize];
    
    
    //NSLog(@"enteredBackgroundCount: %@", [defaults objectForKey:@"enteredBackgroundCount"]);
    
    //test
    //NSLog(@"self.window %@", self.window);
    
    
    //NSLog(@"enteredBackgroundCount: %li", (long)[defaults integerForKey:@"enteredBackgroundCount"]);
    
    /*
    if ((enteredBackgroundCount) == 25) {
        
        UIAlertView *showNoPurchaseAlertView = [[UIAlertView alloc]initWithTitle:@"Data Connection Turned Off for iBought"
                                                                         message:@"iBought needs a data connection! Please enable it in the Settings menu"
                                                                        delegate:self
                                                               cancelButtonTitle:@"Okay"
                                                               otherButtonTitles: nil];
        
        [showNoPurchaseAlertView show];
        
    }
     */
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    
    //int enteredBackgroundCount = (int)[[defaults objectForKey:@"enteredBackgroundCount"] integerValue];\
    
    [self initializeDefaults];
    
    if ([[defaults objectForKey:@"enteredBackgroundCount"] integerValue] > 5) {
        
        //NSLog(@"enteredBackgroundCount greater than 5");
        //_homeViewController.settingsButton.enabled = NO;
        
    }
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark miscellaneous methods

- (void)initializeDefaults {
    
    defaults = [NSUserDefaults standardUserDefaults];
    
}

#pragma mark store kit methods

-(void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions {
    
    for (SKPaymentTransaction *transaction in transactions) {
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchasing:
                //NSLog(@"Purchasing");
                break;
            case SKPaymentTransactionStatePurchased:
                if ([transaction.payment.productIdentifier
                     isEqualToString:PRODUCT_ID]) {
                    //NSLog(@"Purchased ");
                    UIAlertView *alertViewTransactionPurchased = [[UIAlertView alloc]initWithTitle:@"Purchase completed succesfully"
                                                                                           message:nil
                                                                                          delegate:self
                                                                                 cancelButtonTitle:@"Ok"
                                                                                 otherButtonTitles: nil];
                    [alertViewTransactionPurchased show];
                    
                    //update upgradePackPurchased to YES
                    [defaults setObject:@"YES" forKey:@"upgradePackPurchased"];
                    [defaults synchronize];
                    
                    //[self checkForAdRemovalPurchased];
                    
                }
                
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                break;
                
            case SKPaymentTransactionStateRestored:
                
                //update upgradePackPurchased to YES
                [defaults setObject:@"YES" forKey:@"upgradePackPurchased"];
                [defaults synchronize];
                //_removeAdBannerButton.enabled = NO;
                //_restorePurchaseButton.enabled = NO;
                
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                
                /*
                 alertViewRestore = [[UIAlertView alloc] initWithTitle:@"Restore completed succesfully"
                                                              message:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"Ok"
                                                    otherButtonTitles:nil];
                [alertViewRestore show];*/
                
                //[self checkForUpgradePackPurchased];
                break;
                
            case SKPaymentTransactionStateFailed:
                
            {
                /*
                 UIAlertView *test = [[UIAlertView alloc] initWithTitle:@"Purchase unsuccesful. Please try again" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                 [test show];
                 */
                
            }
                
                break;
                
            default:
                break;
                
        }
    }
}

-(void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response {
    
    SKProduct *validProduct = nil;
    
    long int count = [response.products count];
    
    if ( count > 0) {
        
        validProducts = response.products;
        validProduct = [response.products objectAtIndex:0];
        
        if ([validProduct.productIdentifier
             isEqualToString:PRODUCT_ID]) {
            /*
             [_productTitleLabel setText:[NSString stringWithFormat:
             @"Product Title: %@",validProduct.localizedTitle]];
             [_productDescriptionLabel setText:[NSString stringWithFormat:
             @"Product Desc: %@",validProduct.localizedDescription]];
             [_productPriceLabel setText:[NSString stringWithFormat:
             @"Product Price: %@",validProduct.price]];*/
            //NSLog(@"productTitleLabel: %@", validProduct.localizedTitle);
            //NSLog(@"productDescriptionLabel: %@", validProduct.localizedDescription);
            //NSLog(@"productPriceLabel: %@", validProduct.price);
            
        }
    } else {
        
        UIAlertView *tmp = [[UIAlertView alloc]
                            initWithTitle:@"Not Available"
                            message:@"No products to purchase, please try again"
                            delegate:self
                            cancelButtonTitle:nil
                            otherButtonTitles:@"Ok", nil];
        
        [tmp show];
    }
    
    //[activityIndicatorView stopAnimating];
    //_purchaseButton.hidden = NO;
    
}

- (BOOL)canMakePurchases {
    
    return [SKPaymentQueue canMakePayments];
    
}

- (void)fetchAvailableProducts {
    
    NSSet *productIdentifiers = [NSSet setWithObjects:PRODUCT_ID, nil];
    productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:productIdentifiers];
    productsRequest.delegate = self;
    [productsRequest start];
    
}

- (void)purchaseMyProduct:(SKProduct*)product {
    
    if ([self canMakePurchases]) {
        
        SKPayment *payment = [SKPayment paymentWithProduct:product];
        [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
        [[SKPaymentQueue defaultQueue] addPayment:payment];
        
        
    } else {
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle: @"Purchases are disabled in your device"
                                                           message:nil
                                                          delegate:self
                                                 cancelButtonTitle:@"Ok"
                                                 otherButtonTitles: nil];
        
        [alertView show];
        
    }
    
}

@end
