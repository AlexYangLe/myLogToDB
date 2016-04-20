//
//  DDDBLogger.h
//  myLogToDB
//
//  Created by 杨乐乐 on 16/4/14.
//  Copyright © 2016年 杨乐乐. All rights reserved.
//

#import "DDAbstractDatabaseLogger.h"

@interface DDDBLogger : DDAbstractDatabaseLogger

@property (readwrite, assign) NSInteger saveDBTotalNum;

@end
