//
//  YFModel.m
//  12CarsTest
//
//  Created by 杨帆 on 2020/3/7.
//  Copyright © 2020 杨帆. All rights reserved.
//

#import "YFModel.h"
#import "YFModelData.h"
@implementation YFModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
        //因为模型中有一个数组，所以需要将数组转成模型
        NSMutableArray *arrM = [[NSMutableArray alloc] init];
        
        for (NSDictionary *item in dict[@"cars"]) {
            
            YFModelData *modelData = [YFModelData dataWithDict:item];
            
            [arrM addObject:modelData];
        }
        self.cars = arrM;
    }
    return self;
}

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

//如果出现空值调用这个方法
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
@end
