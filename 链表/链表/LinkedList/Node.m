//
//  Node.m
//  链表
//
//  Created by xiang on 16/8/9.
//  Copyright © 2016年 xiang. All rights reserved.
//

#import "Node.h"

@implementation Node

+ (instancetype)nodeWithItem:(id)item {
    
    //这里之所以用self关键字来开辟对象，是考虑到有继承的问题
    Node *node = [[[self class] alloc] init];
    
    return node;
}

@end
