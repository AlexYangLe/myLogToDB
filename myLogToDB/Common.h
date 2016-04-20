//
//  Common.h
//  LumberjackDemo
//
//  Created by 杨乐乐 on 16/4/13.
//  Copyright © 2016年 杨乐乐. All rights reserved.
//

#ifndef Common_h
#define Common_h
#import "DDLog.h"

#ifndef DEBUG
static const int ddLogLevel = DDLogLevelDebug;
#else
static const int ddLogLevel = DDLogLevelInfo;
#endif

#ifndef DEBUG
#define NSLog(format, ...)
#else
#define NSLog(format, ...) DDLogWarn(format, ##__VA_ARGS__)
#endif

#define DDAssert(condition, frmt, ...)                                                \
if (!(condition)) {                                                           \
NSString *description = [NSString stringWithFormat:frmt, ## __VA_ARGS__]; \
DDLogError(@"%@", description);                                           \
NSAssert(NO, description);                                                \
}
#define DDAssertCondition(condition) DDAssert(condition, @"Condition not satisfied: %s", #condition)


#endif /* Common_h */
