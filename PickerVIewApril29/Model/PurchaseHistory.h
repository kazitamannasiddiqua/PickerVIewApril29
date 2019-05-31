//
//  PurchaseHistory.h
//  CashRegister_Obj_C
//
//  Created by user153543 on 5/3/19.
//  Copyright © 2019 user153543. All rights reserved.
//


#import "ItemClass.h"

NS_ASSUME_NONNULL_BEGIN
//@class PurchaseHistory;
@interface PurchaseHistory : ItemClass
@property (nonatomic) NSDate *purchaseDate;
-(instancetype) initWithName:(NSString *)name price:(double)totalPrice quantity:(int)quantity purchaseDate:(NSDate *) date;
-(NSString*) description;

@end

NS_ASSUME_NONNULL_END
