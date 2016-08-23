//
//  GoogleFactory.m
//  抽象工厂
//
//  Created by xiang on 16/8/8.
//  Copyright © 2016年 xiang. All rights reserved.
//

#import "GoogleFactory.h"
#import "Android.h"
#import "AndroidWatch.h"

@implementation GoogleFactory

- (BasePhone *)createPhone {
    return [[Android alloc] init];
}

- (BaseWatch *)createWatch {
    return [[AndroidWatch alloc] init];
}

@end
