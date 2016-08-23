//
//  FaceDataClass.m
//  FaceViewDemo
//
//  Created by xiang on 16/8/9.
//  Copyright © 2016年 xiang. All rights reserved.
//

#import "FaceDataClass.h"

@interface FaceDataClass ()
{
    NSDictionary *mFaceInfoDic;
    NSMutableDictionary *mFaceStringDic;
    NSMutableString *mPatternString;//正则条件string
}

@end

@implementation FaceDataClass

+ (FaceDataClass *)sharedFaceDataClass {
    static FaceDataClass *shareData = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareData = [[FaceDataClass alloc] init];
    });
    
    return shareData;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        //转换到应用程序的Document目录下
        NSString *tFilePath = [[NSBundle mainBundle] pathForResource:@"faceList" ofType:@"plist"];
        
        mFaceInfoDic = [[NSDictionary alloc] initWithContentsOfFile:tFilePath];
        mFaceStringDic = [[NSMutableDictionary alloc] init];
        mPatternString = [[NSMutableString alloc] initWithString:@"("];//正则条件string
        
        NSArray *tKeys = [mFaceInfoDic allKeys];
        NSString *tFaceName = nil;
        NSNumber *tKey = nil;
        
        NSMutableString *tPattern = nil;
        NSInteger count = [tKeys count];
        for (NSInteger i = 0; i < count; i++) {
            tKey = [tKeys objectAtIndex:i];
            tFaceName = [mFaceInfoDic objectForKey:tKey];
            [mFaceStringDic setObject:tKey forKey:tFaceName];
            tPattern = [[NSMutableString alloc] initWithString:tFaceName];
            NSRange range = NSMakeRange(0, 1);
            [tPattern replaceCharactersInRange:range withString:@"\\["];
            range = NSMakeRange(tPattern.length - 1, 1);
            [tPattern replaceCharactersInRange:range withString:@"\\]"];
            [mPatternString appendString:tPattern];
            
            if (i != count - 1) {
                [mPatternString appendString:@"|"];
            }
        }
        
        [mPatternString appendString:@")"];
    }
    
    return self;
}

- (NSDictionary *)faceInfoDictionary {
    return mFaceInfoDic;
}

- (NSString *)returnFaceImageName:(NSString *)faceString {
    NSNumber *value = [mFaceStringDic objectForKey:faceString];
    if (value == nil) {
        return nil;
    }
    
    return [NSString stringWithFormat:@"%@", value];
}

- (BOOL)isFaceString:(NSString *)faceString {
    if ([mFaceStringDic objectForKey:faceString] == nil) {
        return NO;
    }
    
    return YES;
}

//拆分源数据转成表情数组string
- (void)changedFaceString:(NSMutableArray *)changedStringArray sourceString:(NSString *)sourceString {
    NSError *error = nil;
    NSRegularExpression *regExp = [[NSRegularExpression alloc] initWithPattern:mPatternString options:NSRegularExpressionCaseInsensitive error:&error];
    
    //查找匹配的字符串
    NSArray *result = [regExp matchesInString:sourceString options:NSMatchingReportCompletion range:NSMakeRange(0, [sourceString length])];
    if (error || [result count] == 0) {
        if (error) {
            NSLog(@"ERROR:%@", result);
        }
        
        [changedStringArray addObject:sourceString];
        return;
    }
    
    NSRange aRange;
    for (NSInteger i = 0; i < [result count]; i++) {
        aRange = [[result objectAtIndex:1] range];
        if (i == 0) {
            if (aRange.location != 0) {
                [changedStringArray addObject:[sourceString substringToIndex:aRange.location]];
            }
        }
        
        [changedStringArray addObject:[sourceString substringWithRange:aRange]];
    }
    
    if (aRange.location + aRange.length != [sourceString length]) {
        [changedStringArray addObject:[sourceString substringFromIndex:aRange.location+aRange.length]];
    }
}

@end
