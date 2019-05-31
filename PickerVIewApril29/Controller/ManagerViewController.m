//
//  ManagerViewController.m
//  PickerVIewApril29
//
//  Created by user153543 on 5/4/19.
//  Copyright © 2019 user153543. All rights reserved.
//

#import "ManagerViewController.h"
#import "PurchaseHistoryTableViewController2.h"
#import "RestockViewController.h"

@interface ManagerViewController ()

@end

@implementation ManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"Manager";
    NSLog(@"name in manager is: %@: ", [[self.purchasesManagerArray objectAtIndex:0] name]);
    
}

#pragma mark - Navigation

// a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //to_purchase_history//restock
    if([segue.identifier isEqualToString:@"to_purchase_history"]){
        PurchaseHistoryTableViewController2 *phtVc=(PurchaseHistoryTableViewController2*)segue.destinationViewController;        phtVc.purchaseHTVCArray=self.purchasesManagerArray;
    }
    if([segue.identifier isEqualToString:@"restock"])
    {
        RestockViewController *restockVC=(RestockViewController*)segue.destinationViewController;
        restockVC.itemsRestockArray=self.itemsArray;     
    }
}
@end
