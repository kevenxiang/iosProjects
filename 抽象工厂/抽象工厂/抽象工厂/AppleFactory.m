//
//  AppleFactory.m
//  抽象工厂
//
//  Created by xiang on 16/8/8.
//  Copyright © 2016年 xiang. All rights reserved.
//

#import "AppleFactory.h"
#import "iPhone.h"
#import "iWatch.h"

@implementation AppleFactory

- (BasePhone *)createPhone {
    return [[iPhone alloc] init];
}

- (BaseWatch *)createWatch {
    return [[iWatch alloc] init];
}

@end
