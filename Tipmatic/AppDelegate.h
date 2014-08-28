//
//  AppDelegate.h
//  Tipmatic
//
//  Created by EDL on 8/21/14.
//  Copyright (c) 2014 Elkride Software LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>
#import "Home.h"

@class Home;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UIAlertViewDelegate, SKProductsRequestDelegate, SKPaymentTransactionObserver > {
    
    NSUserDefaults *defaults;
    
    SKProductsRequest *productsRequest;
    
    NSArray *validProducts;
    
    NSMutableArray *_products;
    
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) Home *homeViewController;

@end
