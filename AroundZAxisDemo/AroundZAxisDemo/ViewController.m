//
//  ViewController.m
//  AroundZAxisDemo
//
//  Created by xiang on 16/8/15.
//  Copyright © 2016年 xiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *outerView;
@property (weak, nonatomic) IBOutlet UIView *innerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
//    [UIView animateWithDuration:2.5 animations:^{
//        CATransform3D outer = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
//        self.outerView.layer.transform = outer;
//        
//        //rotate the inner layer -45 degress
//        CATransform3D inner = CATransform3DMakeRotation(-M_PI_4, 0, 0, 1);
//        self.innerView.layer.transform = inner;
//    }];
    
    
    [UIView animateWithDuration:2.5 animations:^{
        //rotate the outer layer 45 degrees
        CATransform3D outer = CATransform3DIdentity;
        outer.m34 = -1.0/500.0;
        outer = CATransform3DRotate(outer, M_PI_4, 0, 1, 0);
        self.outerView.layer.transform = outer;
        
        //rotate the inner layer -45 degrees
        CATransform3D inner = CATransform3DIdentity;
        inner.m34 = -1.0/500.0;
        inner = CATransform3DRotate(inner, -M_PI_4, 0, 1, 0);
        self.innerView.layer.transform = inner;
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end













