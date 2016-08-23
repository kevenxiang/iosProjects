//
//  ShareViewController.m
//  GirlShare
//
//  Created by xiang on 16/8/18.
//  Copyright © 2016年 xiang. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

- (BOOL)isContentValid {
    // Do validation of contentText and/or NSExtensionContext attachments here
    return YES;
}

- (void)viewDidLoad {
    [[[self navigationController] navigationBar] setTintColor:[UIColor whiteColor]];
    [[[self navigationController] navigationBar] setBackgroundColor:[UIColor colorWithRed:(62)/255.0 green:(175)/255.0 blue:(252)/255.0 alpha:1]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nigongn) name:@"222222222" object:nil];
}

- (void)nigongn {
    NSLog(@"222222222");
}

- (void)didSelectPost {
    
    //加载动画初始化
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicatorView.frame = CGRectMake((self.view.frame.size.width - activityIndicatorView.frame.size.width) / 2,
                                             (self.view.frame.size.height - activityIndicatorView.frame.size.height) / 2,
                                             activityIndicatorView.frame.size.width,
                                             activityIndicatorView.frame.size.height);
    activityIndicatorView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:activityIndicatorView];
    
    //激活加载动画
    [activityIndicatorView startAnimating];
    
    __weak ShareViewController *theController = self;
    __block BOOL hasExistsUrl = NO;
    [self.extensionContext.inputItems enumerateObjectsUsingBlock:^(NSExtensionItem * _Nonnull extItem, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSLog(@"self.extensionContext.inputItems==:%@", extItem.attributedContentText.string);
        
        [extItem.attachments enumerateObjectsUsingBlock:^(NSItemProvider * _Nonnull itemProvider, NSUInteger idx, BOOL * _Nonnull stop) {
            
            
            NSLog(@"itemProvider=====:%@", itemProvider);
            
            if ([itemProvider hasItemConformingToTypeIdentifier:(NSString *)kCIAttributeIdentity]) {
                [itemProvider loadItemForTypeIdentifier:(NSString *)kCIAttributeIdentity options:nil completionHandler:^(id<NSSecureCoding>  _Nullable item, NSError * _Null_unspecified error) {
                    if (!error) {
                         //对itemProvider夹带着的URL进行解析
//                        NSURL *url = (NSURL *)item;
//                        [UIPasteboard generalPasteboard].URL = url;
//                        NSData *imageData = [NSData dataWithContentsOfURL:url];
//                        UIImage *image = [UIImage imageWithData:imageData];
                        NSLog(@"=image==:%@", item);
                    }
                }];
            }
            
            if ([itemProvider hasItemConformingToTypeIdentifier:@"public.url"])
            {
                [itemProvider loadItemForTypeIdentifier:@"public.url"
                                                options:nil
                                      completionHandler:^(id<NSSecureCoding>  _Nullable item, NSError * _Null_unspecified error) {
                                          
                                          if ([(NSObject *)item isKindOfClass:[NSURL class]])
                                          {
                                              NSLog(@"分享的URL = %@", item);
                                              NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.girlShare"];
                                              [userDefaults setValue:((NSURL *)item).absoluteString forKey:@"share-url"];
                                              //用于标记是新的分享
                                              [userDefaults setBool:YES forKey:@"has-new-share"];
                                              
                                              [activityIndicatorView stopAnimating];
                                              [theController.extensionContext completeRequestReturningItems:@[extItem] completionHandler:nil];
                                          }
                                          
                                          if ([(NSObject *)item isKindOfClass:[UIImage class]]) {
                                              
                                          }
                                          
                                          if ([(NSObject *)item isKindOfClass:[NSString class]] ) {
                                              NSLog(@"=============:%@", item);
                                          }
                                          
                                      }];
                
                hasExistsUrl = YES;
                *stop = YES;
            }
            
        }];
        
        if (hasExistsUrl)
        {
            *stop = YES;
        }
        
    }];
    
    if (!hasExistsUrl)
    {
        //直接退出
        [self.extensionContext completeRequestReturningItems:@[] completionHandler:nil];
    }
    
}

- (NSArray *)configurationItems {
    // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
    return @[];
}

@end
