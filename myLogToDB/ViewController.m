//
//  ViewController.m
//  myLogToDB
//
//  Created by 杨乐乐 on 16/4/14.
//  Copyright © 2016年 杨乐乐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//存放的事logInfoModel数据
@property (nonatomic, strong) NSMutableArray *logInfoDataArr;

@end

@implementation ViewController

-(NSMutableArray *)logInfoDataArr
{
    if (!_logInfoDataArr) {
        _logInfoDataArr = [NSMutableArray array];
    }
    return _logInfoDataArr;
}
- (void)viewDidLoad {
//    [super viewDidLoad];
//    logSqlModel *logSql = [[logSqlModel alloc] init];
//    NSArray *queryResultArr = [[DBConnect shareConnect] getDBlist:logSql.queryDataSqlStr];
//    _logInfoDataArr = [logInfoModel logInfoModelsList:queryResultArr];
//    NSLog(@"logInfoDataArr count %lu", (unsigned long)_logInfoDataArr.count);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
