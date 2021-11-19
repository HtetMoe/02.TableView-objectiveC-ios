//
//  ViewController.h
//  TableViewDemo
//
//  Created by Htet Moe Phyu on 06/11/2021.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

