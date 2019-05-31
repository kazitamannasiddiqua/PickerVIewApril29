//
//  PurchaseHistoryTableViewController.m
//  PickerVIewApril29
//
//  Created by user153543 on 5/4/19.
//  Copyright © 2019 user153543. All rights reserved.
//

#import "PurchaseHistoryTableViewController.h"
#import "PurchaseHistory.h"
#import "PurchaseItemDetailsViewController.h"
#import "ViewController.h"
@interface PurchaseHistoryTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation PurchaseHistoryTableViewController
@synthesize purchaseHTVCArray=_purchaseHTVCArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(NSMutableArray*)purchaseHTVCArray{
    
    if(!_purchaseHTVCArray){
        _purchaseHTVCArray=[[NSMutableArray alloc]init];
    }
    return _purchaseHTVCArray;
    
}
-(void) setPurchaseHTVCArray:(NSMutableArray *)purchaseHTVCArray{
    _purchaseHTVCArray=purchaseHTVCArray;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    PurchaseItemDetailsViewController *pidVC=(PurchaseItemDetailsViewController*)[segue destinationViewController];
    pidVC.singlePurchase=self.singlePurchase;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.purchaseHTVCArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text=[[self.purchaseHTVCArray objectAtIndex:indexPath.row] name];
    int quantity=[[self.purchaseHTVCArray objectAtIndex:indexPath.row] quantity];
    NSString *quantityStr=[NSString stringWithFormat:@"%d",quantity];
    cell.detailTextLabel.text=quantityStr;
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //long index=(long)indexPath.row;
    self.singlePurchase=[self.purchaseHTVCArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"purchase_detail" sender:self];
}

@end
