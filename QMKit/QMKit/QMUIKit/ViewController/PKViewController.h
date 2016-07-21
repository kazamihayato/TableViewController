//
//  PKViewController.h
//  BanggoPhone
//
//  Created by issuser on 14-6-23.
//  Copyright (c) 2014年 BG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKViewController : UIViewController <UIGestureRecognizerDelegate>

@property(nonatomic,assign)NSInteger page; //PageView的页数

@property (nonatomic,weak) NSURLSessionDataTask *task; //当前正在执行的任务

@property (nonatomic,assign) BOOL isConnectNetwork;
/**
 *
 *
 */
- (void)setLeftButton:(NSString*)buttonTitle titleImage:(NSString *)TitleImage action:(SEL)action; //需要自定义的使用

- (UIButton *)setRightButton:(NSString*)buttonTitle titleImage:(NSString *)TitleImage action:(SEL)action; //需要自定义的使用

- (void)setNavigationBarBackGroundWithImage:(UIImage *)image;

- (void)setNavigationBarBackGroundWithColor:(UIColor *)color;

- (void)leftReturn:(UIButton *)sender; //导航栏左边按钮 可重写事件 返回按钮

- (void)presentWithNCV:(UIViewController*)controller;

- (void)showAlert:(NSString *)message;

- (void)presentLoginViewController;

@end
