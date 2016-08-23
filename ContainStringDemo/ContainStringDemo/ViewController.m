//
//  ViewController.m
//  ContainStringDemo
//
//  Created by xiang on 16/8/23.
//  Copyright © 2016年 xiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *str = @"1234";
    if ([str containsString:@"1"]) {
         NSLog(@"%@", str);
    }
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
