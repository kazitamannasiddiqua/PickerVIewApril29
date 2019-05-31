//
//  ItemClass.h
//  PickerVIewApril29
//
//  Created by user153543 on 4/30/19.
//  Copyright © 2019 user153543. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ItemClass : NSObject
-(instancetype)initWithName:(NSString*)name
                      price:(double)price
                   quantity:(int)quantity;
-(NSString*) description;
-(NSString*) name;
-(void)setQuantity:(int)quantity;
-(double) price;
-(int) quantity;
@end

NS_ASSUME_NONNULL_END
