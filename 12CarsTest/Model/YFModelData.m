//
//  YFModelData.m
//  12CarsTest
//
//  Created by 杨帆 on 2020/3/7.
//  Copyright © 2020 杨帆. All rights reserved.
//

#import "YFModelData.h"

@implementation YFModelData

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)dataWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
    
}

@end
