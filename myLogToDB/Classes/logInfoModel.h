//
//  logInfoModel.h
//  myLogToDB
//
//  Created by 杨乐乐 on 16/4/15.
//  Copyright © 2016年 杨乐乐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface logInfoModel : NSObject

@property (nonatomic, copy) NSString *logtime;
@property (nonatomic, copy) NSString *filename;
@property (nonatomic, copy) NSString *function;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *level;
@property (nonatomic, copy) NSString *line;
@property (nonatomic, strong) NSDate *lastUpdateTime;

- (instancetype)initWithArray: (NSArray *)arr;
+ (instancetype)logInfoModelWithArray: (NSArray *)arr;
+ (NSArray *)logInfoModelsList:(NSArray *)dataArray;



@end
