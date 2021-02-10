//
//  YFModelData.h
//  12CarsTest
//
//  Created by 杨帆 on 2020/3/7.
//  Copyright © 2020 杨帆. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YFModelData : NSObject

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *name;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)dataWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
