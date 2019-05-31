//
//  ViewController.m
//  PickerVIewApril29
//
//  Created by user153543 on 4/29/19.
//  Copyright © 2019 user153543. All rights reserved.
//

#import "ViewController.h"
#import "ItemClass.h"
#import "PurchaseHistory.h"
#import "ManagerViewController.h"
@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *lblItem;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblQuantity;
@property (weak, nonatomic) IBOutlet UILabel *errorMsg;

@property (nonatomic) ItemClass *item;
@property(nonatomic) ItemClass *buyingItem;

@property(nonatomic) NSMutableArray *itemsDetail;

@property(nonatomic)BOOL isNumber;
//@property(nonatomic) ItemClass *items;
@property (nonatomic) int buyingQuantity;
@property (nonatomic) double totalPrice;
@property (nonatomic) long tempRow;

@end

@implementation ViewController//()//<UIPickerViewDelegate,UIPickerViewDataSource>

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"to_manager"])
    {
        ManagerViewController *mvc=(ManagerViewController*)segue.destinationViewController;
        
        mvc.purchasesManagerArray=self.purchaseArray;
        mvc.itemsArray=self.itemsDetail;
    }
}

-(void) viewWillAppear :(BOOL)animated{
    [self.picker reloadAllComponents];
}

- (IBAction)btnNumberPressed:(UIButton *)sender {
   /* if(self.isNumber){
        self.lblQuantity.text=[NSString stringWithFormat:@"%d",
            [sender.currentTitle intValue]];
        self.isNumber=NO;
    }
    else{*/
    self.errorMsg.text=@"";
    self.lblPrice.text=@"";
    
    NSString* digitOnly=self.lblQuantity.text;
    NSString* digitPressed=sender.titleLabel.text;
    self.lblQuantity.text=[NSString stringWithFormat:@"%@%@",digitOnly,digitPressed];
    
    self.buyingQuantity=[self.lblQuantity.text intValue];
    self.totalPrice=[self.buyingItem price] * self.buyingQuantity;
    self.lblPrice.text=[NSString stringWithFormat:@"%g",self.totalPrice];
    
    //}
}

- (IBAction)btnBuyPressed:(UIButton *)sender {
    
    self.isNumber=YES;
    int availableQuantity= [self.buyingItem quantity];
    int quantityLeft=availableQuantity-self.buyingQuantity;
    
    if (quantityLeft < 0){
        self.errorMsg.text=[NSString stringWithFormat:@"Avaiable Quantity is : %d",availableQuantity];
        return;
    }
   
    self.totalPrice=self.buyingItem.price* self.buyingQuantity;
    [self.buyingItem setQuantity:quantityLeft];
    [self.picker reloadAllComponents];
    [self updatePurchaseArrey];
    self.errorMsg.text=@"";
}

-(void) updatePurchaseArrey{
    
    NSDate * date=[NSDate date];
    PurchaseHistory *purchase=[[PurchaseHistory alloc]initWithName:self.lblItem.text price:self.totalPrice quantity:self.buyingQuantity purchaseDate:date];
    if (!_purchaseArray){
        _purchaseArray=[[NSMutableArray alloc]init];
        
    }
    [self.purchaseArray addObject:purchase];
   // NSLog(<#NSString * _Nonnull format, ...#>)
    
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    self.lblPrice.text=@"";
    self.lblQuantity.text=@"";
    self.buyingQuantity=0;
    self.tempRow = row;
   
    self.buyingItem =[self.itemsDetail objectAtIndex:self.tempRow];
    
    self.lblItem.text = self.buyingItem.name;
    //self.tempQuantity = self.buyingItem.quantity;
    double totalPrice=self.buyingItem.price*self.buyingQuantity;
    self.lblPrice.text=[NSString stringWithFormat:@"%g",totalPrice];
    
}
-(NSMutableArray*)itemsDetail{
    if(!_itemsDetail){
        ItemClass *item1=[[ItemClass alloc]initWithName:@"Pants"   price:109.99 quantity:10];
        ItemClass *item2=[[ItemClass alloc]initWithName:@"Shoes" price:300.99 quantity:10];
        ItemClass *item3=[[ItemClass alloc]initWithName:@"Shirts"
            price:99.99 quantity:10];
        
        _itemsDetail=[[NSMutableArray alloc]initWithObjects:item1,item2,item3 ,nil];
       
    }
    return _itemsDetail;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{    
    return [[self.itemsDetail objectAtIndex:row] description];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
   
    return self.itemsDetail.count;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.isNumber=YES;
    
    self.navigationItem.title=@"Cash_Register";
    self.errorMsg.lineBreakMode=NSLineBreakByWordWrapping;
    NSLog(@"name in manager is: %@: ", [[self.purchaseArray objectAtIndex:0] name]);
    
}
@end
