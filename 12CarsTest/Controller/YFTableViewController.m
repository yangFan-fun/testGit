//
//  YFTableViewController.m
//  12CarsTest
//
//  Created by 杨帆 on 2020/3/7.
//  Copyright © 2020 杨帆. All rights reserved.
//

#import "YFTableViewController.h"
#import "YFModel.h"
#import "YFTableViewCell.h"
#import "YFModelData.h"
@interface YFTableViewController ()

@property (nonatomic, strong) NSArray *dataList;

@end

@implementation YFTableViewController

- (NSArray *)dataList {
    
    if (_dataList == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"cars_total.plist" ofType:nil];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrM = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in arr) {
            YFModel *modelData = [YFModel modelWithDict:dict];
            [arrM addObject:modelData];
        }
        _dataList = arrM;
    }
    return _dataList;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    YFModel *model = self.dataList[section];
    return model.cars.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    YFModel *model = self.dataList[indexPath.section];
    YFModelData *modelData = model.cars[indexPath.row];
    
    cell.imageIcon.image = [UIImage imageNamed:modelData.icon];
    
    cell.nameText.text = modelData.name;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    YFModel *model = self.dataList[section];
    return model.title;
    
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    
    //1.获取模型中的title
    
//    NSMutableArray *arrM = [[NSMutableArray alloc] init];
//
//    for (YFModel *model in self.dataList) {
//        [arrM addObject:model.title];
//    }
//    return arrM;
    
    //2.通过KVC的方式
    
    return [self.dataList valueForKey:@"title"];
    
}

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
