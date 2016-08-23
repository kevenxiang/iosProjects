//
//  FactoryManager.h
//  抽象工厂
//
//  Created by xiang on 16/8/8.
//  Copyright © 2016年 xiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseFactory.h"
#import "AppleFactory.h"
#import "GoogleFactory.h"

typedef NS_ENUM(NSUInteger, EfactoryType){
    kApple,
    kGoogle,
};

@interface FactoryManager : NSObject

/**
 *  获取工厂
 *
 *  @param factoryType 工厂类型
 *
 *  @return 创建出的工厂
 */
+ (BaseFactory *)factoryWithBrand:(EfactoryType)factoryType;

@end
