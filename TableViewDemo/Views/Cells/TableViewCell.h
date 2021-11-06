//
//  TableViewCell.h
//  TableViewDemo
//
//  Created by Htet Moe Phyu on 06/11/2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *productImage;
@property (strong, nonatomic) IBOutlet UILabel *productName;
@property (strong, nonatomic) IBOutlet UIView *cellBackground;

@end

NS_ASSUME_NONNULL_END
