//
//  FactoryManager.m
//  抽象工厂
//
//  Created by xiang on 16/8/8.
//  Copyright © 2016年 xiang. All rights reserved.
//

#import "FactoryManager.h"

@implementation FactoryManager

+ (BaseFactory *)factoryWithBrand:(EfactoryType)factoryType {
    BaseFactory *factory = nil;
    
    if (factoryType == kApple) {
        factory = [[AppleFactory alloc] init];
    } else if (factoryType == kGoogle) {
        factory = [[GoogleFactory alloc] init];
    }
    
    return factory;
}

@end
