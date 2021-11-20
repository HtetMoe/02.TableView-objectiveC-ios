//
//  TableViewCell.m
//  TableViewDemo
//
//  Created by Htet Moe Phyu on 06/11/2021.

#import "TableViewCell.h"
#import "Utils.h"
#import "Product.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    deligate = self;
}

-(void)configure:(Product *)product :(NSString *)row { // set up data to cell
    self.productName.text    = product.productName;
    self.qtyLabel.text       = @(product.productQty).stringValue;
    self.productImage.image   = [UIImage imageNamed:@"image"];

    self.selectedRow = row;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (IBAction)btnIncreasePressed:(id)sender {
    //[deligate pressedIncreaseOrDecrease: @(qty+1).stringValue];
    //NSLog(@"selected Row : %@", self.selectedRow);
    
    NSInteger qty = [self.qtyLabel.text integerValue];

    //prepare data to pass
    Product *selectedProduct = [[Product alloc] init];
    selectedProduct.productName = _productName.text;
    selectedProduct.productQty = @(qty+1).intValue;
    
    NSDictionary *dict =  @{@"product": selectedProduct,@"row" : self.selectedRow};
    
    //send noti
    [Utils NSPostNotification:@"increase":dict];
}

- (IBAction)btnDecreasePressed:(id)sender {
    //[deligate pressedIncreaseOrDecrease:_productName.text];
    //NSLog(@"selected Row : %@", self.selectedRow);
    
    NSInteger qty = [self.qtyLabel.text integerValue];
    if(qty > 1){
        //prepare data to pass
        Product *selectedProduct = [[Product alloc] init];
        selectedProduct.productName = _productName.text;
        selectedProduct.productQty = @(qty-1).intValue;
        
        NSDictionary *dict =  @{@"product": selectedProduct,@"row" : self.selectedRow};
        
        //send noti
        [Utils NSPostNotification:@"decrease" :dict];
    }
}

//protocol
- (void)pressedIncreaseOrDecrease:(nonnull NSString *)pName{
    //NSLog(@"%@", pName);
}
@end
