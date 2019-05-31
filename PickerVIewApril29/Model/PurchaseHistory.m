//
//  PurchaseHistory.m
//  CashRegister_Obj_C
//
//  Created by user153543 on 5/3/19.
//  Copyright © 2019 user153543. All rights reserved.
//

#import "PurchaseHistory.h"

@implementation PurchaseHistory

-(instancetype)initWithName:(NSString *)name price:(double)totalPrice quantity:(int)quantity purchaseDate:(NSDate *)date{
    self=[super initWithName:name price:totalPrice quantity:quantity];
    if(self){
        self.purchaseDate=date;
    }
    return self;
    
}

-(NSString*) description{
    // or @"yyyy-MM-dd hh:mm:ss a" if you prefer the time with AM/PM
    NSDateFormatter * dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss a"];
    NSString *dateString=[dateFormatter stringFromDate:self.purchaseDate];
    return [NSString stringWithFormat:@"%@", dateString];
    //NSLog(@"%@",[dateFormatter stringFromDate:self.purchaseDate]);
}
@end
