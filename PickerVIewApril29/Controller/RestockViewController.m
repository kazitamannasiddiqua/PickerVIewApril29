//
//  RestockViewController.m
//  PickerVIewApril29
//
//  Created by user153543 on 5/4/19.
//  Copyright © 2019 user153543. All rights reserved.

#import "RestockViewController.h"
#import "ItemClass.h"
@interface RestockViewController ()
@property (weak, nonatomic) IBOutlet UITextField *restockTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic) ItemClass* item;
@end

@implementation RestockViewController

- (IBAction)cancelButtonPressed:(UIButton *)sender {
    [self.restockTextField resignFirstResponder];
}
- (IBAction)okButtonPressed:(UIButton *)sender {
    int addQuantity = [self.restockTextField.text intValue];
    int currentQuantity = [self.item quantity] + addQuantity;
    [self.item setQuantity:currentQuantity];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
