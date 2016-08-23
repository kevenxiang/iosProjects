//
//  Node.h
//  链表
//
//  Created by xiang on 16/8/9.
//  Copyright © 2016年 xiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

//指向下一个结点
@property (nonatomic, strong) Node *nextNode;

//结点挂载的对象
@property (nonatomic, strong) id item;

/**
 *  便利构造器
 *
 *  @param item 结点挂载的对象
 *
 *  @return Node对象
 */
+ (instancetype)nodeWithItem:(id)item;

@end
