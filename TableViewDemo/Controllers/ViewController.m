//
//  ViewController.m
//  TableViewDemo
//
//  Created by Htet Moe Phyu on 06/11/2021.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "Utils.h"
#import "Product.h"

@interface ViewController (){
    NSMutableArray<Product*> *products;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    products = [[NSMutableArray alloc]init];
    
    //p1
    Product *p1 = [[Product alloc]init];
    p1.productName = @"Product1";
    p1.productQty = 10;
    
    //p2
    Product *p2 = [[Product alloc]init];
    p2.productName = @"Product2";
    p2.productQty = 5;
    
    [products addObject:p1];
    [products addObject:p2];
    
    //NSLog(@"Product count : %lu",products.count);
    
    // Add an observer that will respond to loginComplete
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveNotification:)
                                                 name:@"increase" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveNotification:)
                                                 name:@"decrease" object:nil];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 20, 0);
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

-(void)receiveNotification:(NSNotification *) notification {
//    if([notification.name  isEqual: @"increase"]){
//        NSLog(@"InCreased!");
//    }
//    else if([notification.name  isEqual: @"decrease"]){
//        NSLog(@"Decreased!");
//    }
    
    NSDictionary* userInfo = notification.userInfo;
    Product *updatedProduct = (Product*)userInfo[@"product"];
    NSString *selectedRow = (NSString*)userInfo[@"row"];
    
    //NSLog(@"%d", updatedProduct.productQty);
    //NSLog(@"%@", selectedRow);
    
    products[[selectedRow intValue]] = updatedProduct;
    //NSLog(@"%d", products[[selectedRow intValue]].productQty);
    [self.tableView reloadData];
}

//TABLE VIEW DATA SOURCE
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(!cell){
        [tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    }
    
    //remove selection style
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //setup data to cell
    
    [cell configure:products[indexPath.row] : @(indexPath.row).stringValue];
    
    //set border to image view
    [cell.productImage.layer setBorderColor: [[UIColor systemBlueColor] CGColor]];
    [cell.productImage.layer setBorderWidth: 0.8];
    
    //set border to cell
    [cell.cellBackground.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [cell.cellBackground.layer setBorderWidth:0.8f];
    
    //set rounded border to cell
    cell.cellBackground.layer.cornerRadius  = 18;
    cell.cellBackground.layer.masksToBounds = true;
    
    cell.clipsToBounds = true;
    
    return cell;
}


//- (void)pressedIncreaseOrDecrease:(nonnull NSString *)pName {
//    NSLog(@"%@", pName);
//}


@end
