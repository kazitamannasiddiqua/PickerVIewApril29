//
//  PurchaseHistoryTableViewController2.m
//  PickerVIewApril29
//
//  Created by user153543 on 5/5/19.
//  Copyright © 2019 user153543. All rights reserved.
//

#import "PurchaseHistoryTableViewController2.h"
#import "PurchaseHistory.h"
#import "PurchaseItemDetailsViewController.h"
#import "ViewController.h"
@interface PurchaseHistoryTableViewController2 ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation PurchaseHistoryTableViewController2
@synthesize purchaseHTVCArray=_purchaseHTVCArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"name is: %@: ", [[self.purchaseHTVCArray objectAtIndex:0] name]);
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
    NSString *quantityStr=[NSString stringWithFormat:@"%d", quantity];
    cell.detailTextLabel.text=quantityStr;
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //long index=(long)indexPath.row;
    self.singlePurchase=[self.purchaseHTVCArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"purchase_detail" sender:self];
}




/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
