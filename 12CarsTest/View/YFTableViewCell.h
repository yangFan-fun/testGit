//
//  YFTableViewCell.h
//  12CarsTest
//
//  Created by 杨帆 on 2020/3/7.
//  Copyright © 2020 杨帆. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YFTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;

@property (weak, nonatomic) IBOutlet UILabel *nameText;

@end

NS_ASSUME_NONNULL_END
