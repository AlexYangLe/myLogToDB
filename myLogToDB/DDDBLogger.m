//
//  DDDBLogger.m
//  myLogToDB
//
//  Created by 杨乐乐 on 16/4/14.
//  Copyright © 2016年 杨乐乐. All rights reserved.
//

#import "DDDBLogger.h"
#import "DBConnect.h"
#import "logSqlModel.h"


@interface DDDBLogger ()

@property (nonatomic, strong) DDLogMessage *saveDBLogMessage;


@end


@implementation DDDBLogger

- (void)setsaveDBTotalNum:(NSUInteger)threshold {
//    dispatch_block_t block = ^{
//        @autoreleasepool {
            if (_saveDBTotalNum != threshold) {
                _saveDBTotalNum = threshold;
            }
//        }
//    };
}



-(instancetype)init
{
    self = [super init];
    if (self)
    {
        self.deleteOnEverySave = NO;
        self.saveInterval = 1;         //1 seconds，1秒发送一次
        self.saveThreshold = 1;       //每一条就发送
        self.saveDBTotalNum = 2000;   //数据库总共存2000 条
        
    }
    return  self;
};


- (BOOL)db_log:(DDLogMessage *)logMessage
{
    //没有日志信息
    if(!_logFormatter)
    {
        return NO;
    }
    
    _saveDBLogMessage = logMessage;
    return YES;
}

- (void)db_save {
    if ([self isOnGlobalLoggingQueue]) {
        NSAssert(NO, @"db_saveAnddelete should only be executed on the internaLoggerQueue thread, if you are seeing this, your doing it wrong");
    }
    [self saveLogEntries:self.saveDBLogMessage];

}


-(void)saveLogEntries:(DDLogMessage *)logMessage
{
    logSqlModel *logSql = [[logSqlModel alloc] init];
//    NSString *countSqlStr = logSql.countSqlStr;
    //获取当前的数据库中村的数据的条数
    //统计数据库数据条数的sql
    NSInteger saveDBNum = [[DBConnect shareConnect] getDBDataCount: logSql.countSqlStr];
    
    NSString *logTimeStr = [self stringFromDate:logMessage.timestamp];
    
    if (_saveDBTotalNum < saveDBNum)
    {
        //数据库中存储的数据条数 大于 要求存储的条数
        //删除的数据条数
        NSInteger deleteNum = saveDBNum - _saveDBTotalNum;
        NSString *deleteDataSqlStr = [NSString stringWithFormat:@"DELETE FROM logMessageHistory order by lastUpdateTime limit %ld", (long)deleteNum];
        [[DBConnect shareConnect] executeUpdateSql:deleteDataSqlStr];
    }else if (_saveDBTotalNum > saveDBNum) {
        //数据库能保存的数据多余现在的数据，就是直接插入数据库
        [[DBConnect shareConnect].dataBase executeUpdate:logSql.insertSqlStr,logTimeStr, logMessage.fileName, logMessage.function, logMessage.message, logMessage.timestamp];
    }
    else{
        //数据库已经存满，此时需要update时间最早的数据
        [[DBConnect shareConnect].dataBase executeUpdate: logSql.updateDataSqlStr,logTimeStr, logMessage.fileName, logMessage.function, logMessage.message, logMessage.timestamp];
    }
    
}


//-(void)saveLogEntries:(DDLogMessage *)logMessage
//{
////    logSqlModel *logSql = [[logSqlModel alloc] init];
////    NSString *countSqlStr = logSql.countSqlStr;
//    //获取当前的数据库中村的数据的条数
//    //统计数据库数据条数的sql  logMessageHistory
//    NSString *countSqlStr = @"SELECT count(*) FROM logMessageHistory";
//    NSInteger saveDBNum = [[DBConnect shareConnect] getDBDataCount: countSqlStr];
//    
//    NSString *logTimeStr = [self stringFromDate:logMessage.timestamp];
//    //插入数据库的sql
//    NSString *insertSqlStr = [NSString stringWithFormat:@"INSERT INTO logMessageHistory (logtime,filename,function,message,lastUpdateTime) VALUES (?, ?, ?, ?, ?)"];
//    //更新数据库的语句
//    NSString *updateDataSqlStr = [NSString stringWithFormat:@"UPDATE logMessageHistory SET logtime = ?, filename = ?, function = ?, message = ?, lastUpdateTime = ? order by lastUpdateTime limit 1"];
//
//    if (_saveDBTotalNum < saveDBNum)
//    {
//        //数据库中存储的数据条数 大于 要求存储的条数
//        //删除的数据条数
//        NSInteger deleteNum = saveDBNum - _saveDBTotalNum;
//        NSString *deleteDataSqlStr = [NSString stringWithFormat:@"DELETE FROM logMessageHistory order by lastUpdateTime limit %ld", (long)deleteNum];
//        [[DBConnect shareConnect] executeUpdateSql:deleteDataSqlStr];
//    }else if (_saveDBTotalNum > saveDBNum) {
//        //数据库能保存的数据多余现在的数据，就是直接插入数据库
//        [[DBConnect shareConnect].dataBase executeUpdate:insertSqlStr,logTimeStr, logMessage.fileName, logMessage.function, logMessage.message, logMessage.timestamp];
//    }
//    else{
//        //数据库已经存满，此时需要update时间最早的数据
//        [[DBConnect shareConnect].dataBase executeUpdate: updateDataSqlStr,logTimeStr, logMessage.fileName, logMessage.function, logMessage.message, logMessage.timestamp];
//    }
//    
//}

- (NSString *)stringFromDate:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}



@end
