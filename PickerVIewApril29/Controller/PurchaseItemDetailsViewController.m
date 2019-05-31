//
//  PurchaseItemDetailsViewController.m
//  PickerVIewApril29
//
//  Created by user153543 on 5/4/19.
//  Copyright © 2019 user153543. All rights reserved.
//

#import "PurchaseItemDetailsViewController.h"

@interface PurchaseItemDetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *quantityLbl;
@property (weak, nonatomic) IBOutlet UILabel *totalCostLbl;
@property (weak, nonatomic) IBOutlet UILabel *dateLbl;

@end

@implementation PurchaseItemDetailsViewController
- (IBAction)doneBtnPressed:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLbl.text=[self.singlePurchase name];
    self.quantityLbl.text=[NSString stringWithFormat:@"%d",[self.singlePurchase quantity]];
    self.totalCostLbl.text=[NSString stringWithFormat:@"%g",[self.singlePurchase price]];
    self.dateLbl.text=[self.singlePurchase description];

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
