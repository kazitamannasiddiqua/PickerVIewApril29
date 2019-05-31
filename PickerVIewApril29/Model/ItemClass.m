//
//  ItemClass.m
//  PickerVIewApril29
//
//  Created by user153543 on 4/30/19.
//  Copyright © 2019 user153543. All rights reserved.
//

#import "ItemClass.h"

@interface ItemClass()

@property (nonatomic,strong) NSString *name;
@property (nonatomic) double price;
@property (nonatomic) int quantity;

@end
@implementation ItemClass
@synthesize quantity=_quantity;
-(instancetype)initWithName:(NSString*)name
                      price:(double)price
                   quantity:(int)quantity{

    self=[super init];
        if (self) {
            self.name=name;
            self.price= price;
            self.quantity= quantity;
        }
     return self;
  }
-(void)setQuantity:(int)quantity{
    _quantity=quantity;
}
-(NSString*)name{
    return _name;
}
-(int)quantity{
    return _quantity;
}

-(NSString*) description
{
    return [NSString stringWithFormat:@"%@  %.2f :  %d",self.name,self.price ,self.quantity];
}



@end
