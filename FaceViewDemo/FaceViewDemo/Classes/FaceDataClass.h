//
//  FaceDataClass.h
//  FaceViewDemo
//
//  Created by xiang on 16/8/9.
//  Copyright © 2016年 xiang. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FaceViewFontSize     17.0
//行高
#define VIEW_LINE_HEIGHT     20.0
//左边开始位置
#define VIEW_LEFT            0.0
//顶部开始位置
#define VIEW_TOP             0.0

//表情的宽高
#define KFaceSizeWidth    18.0
#define KFaceSizeHeight   18.0

@interface FaceDataClass : NSObject

//外部的初始化函数
+ (FaceDataClass *)sharedFaceDataClass;

//返回表情信息dic
- (NSDictionary *)faceInfoDictionary;

//返回Face图片名字，nil说明不是图片
- (NSString *)returnFaceImageName:(NSString *)faceString;

//判断字符串是不是表情字符
- (BOOL)isFaceString:(NSString *)faceString;

//拆分源数据转成表情数组string
- (void)changedFaceString:(NSMutableArray *)changedStringArray sourceString:(NSString *)sourceString;

@end
