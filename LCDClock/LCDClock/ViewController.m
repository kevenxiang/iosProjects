//
//  ViewController.m
//  LCDClock
//
//  Created by xiang on 16/7/25.
//  Copyright © 2016年 xiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableDictionary *data;
}
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *digitViews;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)testDic {

    NSMutableDictionary *dic1 = [[NSMutableDictionary alloc] init];
    [dic1 setValue:@"dic1_value1" forKey:@"dic1_key1"];
    [dic1 setValue:@"dic1_value2" forKey:@"label"];
    
    NSMutableDictionary *dic2 = [[NSMutableDictionary alloc] init];
    [dic2 setValue:@"dic2_value2" forKey:@"dic2_key1"];
    [dic2 setValue:@"dic2_value2" forKey:@"label"];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    [arr addObject:dic1];
    [arr addObject:dic2];
    
    data = [[NSMutableDictionary alloc] init];
    [data setObject:arr forKey:@"data"];
    NSLog(@"data====:%@", data);
    
    NSArray *testArr = @[@"dic1_value2", @"dic2_value2"];
    
    
    for (NSInteger i = 0; i < arr.count; i++) {
        NSDictionary *dic = arr[i];
        for (NSInteger j = 0; j < testArr.count; j++) {
            NSString *test = testArr[j];
            NSString *value = dic[@"label"];
            if ([value isEqualToString:test]) {
                [dic setValue:@"xiugaidezhi" forKey:@"label"];
                [arr removeObjectAtIndex:j];
                [arr insertObject:dic atIndex:j];
                
            }
        }

    }
    
    [data removeObjectForKey:@"data"];
    [data setObject:arr forKey:@"data"];
    
     NSLog(@"data====:%@", data);
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *digits = [UIImage imageNamed:@"Digits.png"];
    
    for (UIView *view in self.digitViews) {
        view.layer.contents = (__bridge id)digits.CGImage;
        view.layer.contentsRect = CGRectMake(0, 0, 0.1, 1.0);
        view.layer.contentsGravity = kCAGravityResizeAspect;
        //use nearest-neighbor scaling
        view.layer.magnificationFilter = kCAFilterNearest;
    }
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    [self tick];
    
    [self testDic];
    
    
}

- (void)setDigit:(NSInteger)digit forView:(UIView *)view {
    view.layer.contentsRect = CGRectMake(digit * 0.1, 0, 0.1, 1.0);
   
}

- (void)tick{
    
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger units = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *components = [calender components:units fromDate:[NSDate date]];
    
    [self setDigit:components.hour/10 forView:self.digitViews[0]];
    [self setDigit:components.hour % 10 forView:self.digitViews[1]];
    
    //set minutes
    [self setDigit:components.minute / 10 forView:self.digitViews[2]];
    [self setDigit:components.minute % 10 forView:self.digitViews[3]];
    
    //set seconds
    [self setDigit:components.second / 10 forView:self.digitViews[4]];
    [self setDigit:components.second % 10 forView:self.digitViews[5]];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end














