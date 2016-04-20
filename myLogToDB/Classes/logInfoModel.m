//
//  logInfoModel.m
//  myLogToDB
//
//  Created by 杨乐乐 on 16/4/15.
//  Copyright © 2016年 杨乐乐. All rights reserved.
//

#import "logInfoModel.h"

@implementation logInfoModel

- (instancetype)initWithDic: (NSDictionary *)dic
{
    if(self =[self init])
    {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)logInfoModelWithDic: (NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

+ (NSArray *)logInfoModelsList:(NSArray *)dataArray
{
    //将数组字典中的数据转换成模型数组
    NSMutableArray * tmpArray = [NSMutableArray array];
    for (NSDictionary * dic in dataArray) {
        logInfoModel * logInfo = [logInfoModel logInfoModelWithDic:dic];
        [tmpArray addObject:logInfo];
    }
    return tmpArray;
}





@end
