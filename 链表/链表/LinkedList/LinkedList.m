//
//  LinkedList.m
//  链表
//
//  Created by xiang on 16/8/9.
//  Copyright © 2016年 xiang. All rights reserved.
//

#import "LinkedList.h"

@interface LinkedList ()

@property (nonatomic, strong) Node *headNode;
@property (nonatomic) NSInteger numberOfNodes;

@end

@implementation LinkedList

- (void)addItem:(id)item {
    if (self.headNode == nil) {
        //创建头结点
        self.headNode = [Node nodeWithItem:item];
    } else {
        [self addItem:item node:self.headNode];
    }
}

- (void)addItem:(id)item node:(Node *)node {
    if (node.nextNode == nil) {
        node.nextNode = [Node nodeWithItem:item];
    } else {
        [self addItem:item node:node.nextNode];
    }
}

@end
