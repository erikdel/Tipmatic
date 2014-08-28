//
//  Home.h
//  Tipmatic
//
//  Created by EDL on 8/21/14.
//  Copyright (c) 2014 Elkride Software LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <StoreKit/StoreKit.h>

@interface Home : UIViewController /*<SKProductsRequestDelegate, SKPaymentTransactionObserver>*/  {
    
    NSUserDefaults *defaults;
    
    //SKProductsRequest *productsRequest;
    
    //NSArray *validProducts;
    
    //NSMutableArray *_products;
    
}

@property (strong, nonatomic) IBOutlet UITextField *totalTextField;

@property (strong, nonatomic) IBOutlet UIButton *settingsButton;
@property (strong, nonatomic) IBOutlet UIButton *enterButton;

@property (strong, nonatomic) IBOutlet UILabel *separatorLabel;
@property (strong, nonatomic) IBOutlet UILabel *topBarLabel;
@property (strong, nonatomic) IBOutlet UILabel *underlineLabel;

@end
