//
//  BaseFactory.h
//  抽象工厂
//
//  Created by xiang on 16/8/8.
//  Copyright © 2016年 xiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasePhone.h"
#import "BaseWatch.h"

@interface BaseFactory : NSObject

/**
 *  创建手机
 *
 *  @return 手机
 */
- (BasePhone *)createPhone;

/**
 *  创建手表
 *
 *  @return 手表  
 */
- (BaseWatch *)createWatch;

@end
