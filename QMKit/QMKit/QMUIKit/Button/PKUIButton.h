//
//  PKUIButton.h
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PKButtonStyle) {
    PKButtonStyleFilled ,//填充
    PKButtonStyleBorder,//边框
};

@interface PKUIButton : UIButton

@property (nonatomic, strong) UIColor * bgColor;
@property (nonatomic, assign) PKButtonStyle buttonStyle;
@property (nonatomic, assign) BOOL needCorner;

-(instancetype)initWithFrame:(CGRect)frame
                hightLighted:(NSString*)imageName;

-(instancetype)initWithFrame:(CGRect)frame
                    selected:(NSString*)imageName;

/** 指定初始化，因为 Xcode 对中文字符串支持的 bug 所以把 title 放在最后 */
- (instancetype)initWithFrame:(CGRect)frame
                   titleColor:(UIColor *)titleColor
                    titleFont:(UIFont *)font
                       target:(id)target
                       action:(SEL)action
                 cornerRadius:(CGFloat)cornerRadius
                  borderColor:(UIColor *)borderColor
                  borderWidth:(CGFloat)borderWidth
              backgroundImage:(UIImage *)bgImage
                  selectImage:(UIImage *)selectImage
                        title:(NSString *)title;

/** 修改 layer */
- (instancetype)initWithFrame:(CGRect)frame
                   titleColor:(UIColor *)titleColor
                    titleFont:(UIFont *)font
                       target:(id)target
                       action:(SEL)action
                 cornerRadius:(CGFloat)cornerRadius
                  borderColor:(UIColor *)borderColor
                  borderWidth:(CGFloat)borderWidth
                        title:(NSString *)title;

/** 普通button */
- (instancetype)initWithFrame:(CGRect)frame
                   titleColor:(UIColor *)titleColor
                    titleFont:(UIFont *)font
                       target:(id)target
                       action:(SEL)action
                        title:(NSString *)title;

@end
