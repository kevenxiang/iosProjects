//
//  ViewController.m
//  抽象工厂
//
//  Created by xiang on 16/8/8.
//  Copyright © 2016年 xiang. All rights reserved.
//

#import "ViewController.h"
#import "FactoryManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //获取工厂
    BaseFactory *factory = [FactoryManager factoryWithBrand:kGoogle];
    
    //创建商品
    BasePhone *phone = [factory createPhone];
    BaseWatch *watch = [factory createWatch];
    NSLog(@"%@ %@", phone, watch);
//     <iPhone: 0x7fb65a4a1200> <iWatch: 0x7fb65a416510>
//     <Android: 0x7f86e2f15a10> <AndroidWatch: 0x7f86e2f1ee10>
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
