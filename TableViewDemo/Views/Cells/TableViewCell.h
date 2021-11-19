//
//  TableViewCell.h
//  TableViewDemo
//
//  Created by Htet Moe Phyu on 06/11/2021.
//

#import <UIKit/UIKit.h>
#import "Product.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TableViewCellDeligate <NSObject>
-(void)pressedIncreaseOrDecrease:(NSString *)pName;
@end

@interface TableViewCell : UITableViewCell<TableViewCellDeligate>{
    id deligate;
}

@property (strong, nonatomic) IBOutlet UIImageView *productImage;
@property (strong, nonatomic) IBOutlet UILabel *productName;
@property (strong, nonatomic) IBOutlet UIView *cellBackground;
@property (weak, nonatomic) IBOutlet UILabel *qtyLabel;

-(void)configure:(Product *)product : (NSString *)row;
@property (strong,nonatomic) NSString *selectedRow;
@end
NS_ASSUME_NONNULL_END
