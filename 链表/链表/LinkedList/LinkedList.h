//
//  LinkedList.h
//  链表
//
//  Created by xiang on 16/8/9.
//  Copyright © 2016年 xiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface LinkedList : NSObject

//头节点
@property (nonatomic, strong, readonly) Node *headNode;

//有几个节点
@property (nonatomic, readonly) NSInteger numberOfNodes;

/**
 *  节点挂载的对象
 *
 *  @param item 结点挂载的对象
 */
- (void)addItem:(id)item;

@end
