//
//  FaceData.h
//  FaceViewDemo
//
//  Created by xiang on 16/8/9.
//  Copyright © 2016年 xiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FaceData : NSObject

@property (nonatomic, strong) NSString *mTitle;
@property (nonatomic, strong) UIImage *mImage;
@property (nonatomic, strong) NSString *mTextToInput;
@property uint8_t mType;//1表示删除按钮,2表示发送按钮

@end
