//
//  PurchaseHistoryTableViewController2.h
//  PickerVIewApril29
//
//  Created by user153543 on 5/5/19.
//  Copyright © 2019 user153543. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "PurchaseHistory.h"

NS_ASSUME_NONNULL_BEGIN

@interface PurchaseHistoryTableViewController2 : UITableViewController
@property (nonatomic) NSMutableArray *purchaseHTVCArray;

@property(nonatomic)PurchaseHistory *singlePurchase;

-(NSMutableArray*)purchaseHTVCArray;

-(void)setPurchaseHTVCArray:(NSMutableArray *)purchaseHTVCArray;
@end

NS_ASSUME_NONNULL_END

