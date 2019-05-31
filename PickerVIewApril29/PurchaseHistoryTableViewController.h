//
//  PurchaseHistoryTableViewController.h
//  PickerVIewApril29
//
//  Created by user153543 on 5/4/19.
//  Copyright © 2019 user153543. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PurchaseHistory.h"

NS_ASSUME_NONNULL_BEGIN

@interface PurchaseHistoryTableViewController : UIViewController
@property (nonatomic) NSMutableArray *purchaseHTVCArray;

@property(nonatomic)PurchaseHistory *singlePurchase;

-(NSMutableArray*)purchaseHTVCArray;

-(void)setPurchaseHTVCArray:(NSMutableArray *)purchaseHTVCArray;
@end

NS_ASSUME_NONNULL_END
