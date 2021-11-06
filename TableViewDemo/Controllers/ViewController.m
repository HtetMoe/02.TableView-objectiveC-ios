//
//  ViewController.m
//  TableViewDemo
//
//  Created by Htet Moe Phyu on 06/11/2021.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController (){
    NSArray *productName;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    productName = [NSArray arrayWithObjects:@"Product1", @"Product2", @"Product3", @"Product4",@"Product5",@"Product6",@"Product7",@"Product8",@"Product9", nil];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 20, 0);
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}


//TABLE VIEW DATA SOURCE
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return productName.count;
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
    cell.productName.text   = productName[indexPath.row];
    cell.productImage.image = [UIImage imageNamed:@"image"];
    
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
@end
