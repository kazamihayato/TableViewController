//
//  PKUIButton.m
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import "PKUIButton.h"
#import "PKUIColor.h"

@interface PKUIButton()

@property(nonatomic,strong)UIColor * disableColor;

@end

@implementation PKUIButton


-(instancetype)init

{
    self=[super init];
    if (self) {
        self.disableColor                   = HAIButtonDisable;
    }
    return self;
}


-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.disableColor                   = HAIButtonDisable;
    }
    return self;
}
-(void)setNeedCorner:(BOOL)needCorner
{
    if (needCorner)
    {
        self.layer.masksToBounds  = YES;
        self.layer.cornerRadius   = 2.5f;
    }
}


-(void)setButtonStyle:(PKButtonStyle)buttonStyle
{
    switch (buttonStyle) {
        case PKButtonStyleFilled:
        {
            [self setBackgroundColor:self.bgColor];
            [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.layer.borderColor = [UIColor clearColor].CGColor;
            self.layer.borderWidth = 0.0f;
        }
            break;
        case PKButtonStyleBorder:
        {
            [self setTitleColor:_bgColor forState:UIControlStateNormal];
            
            self.layer.borderColor   = _bgColor.CGColor;
            self.layer.borderWidth   = 0.75f;
        }
            break;
        default:
            break;
    }
}

-(void)setHighlighted:(BOOL)highlighted
{
    
}

-(void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    if (enabled)
    {
        self.buttonStyle=_buttonStyle;
    }
    else
    {
        if (self.buttonStyle == PKButtonStyleFilled)
        {
            [self setBackgroundColor:self.disableColor];
            
        } else {
            [self setBackgroundColor:[UIColor clearColor]];
            
        }
    }
}

-(instancetype)initWithFrame:(CGRect)frame
                hightLighted:(NSString *)imageName
{
    self=[super initWithFrame:frame];
    if (self) {
        [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:[imageName stringByAppendingString:@"_h"]] forState:UIControlStateHighlighted];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame selected:(NSString *)imageName
{
    self=[super initWithFrame:frame];
    if (self) {
        [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:[imageName stringByAppendingString:@"_s"]] forState:UIControlStateSelected];
    }
    return self;
}

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
                        title:(NSString *)title {
    self = [super initWithFrame:frame];
    if (self) {
        if (title) {
            [self setTitle:title forState:UIControlStateNormal];
            [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
        if (titleColor) {
            [self setTitleColor:titleColor forState:UIControlStateNormal];
        }
        if (font) {
            self.titleLabel.font = font;
        }
        if (target && action) {
            [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        }
        if (cornerRadius != 0) {
            self.layer.cornerRadius = cornerRadius;
            self.layer.masksToBounds = YES;
        }
        if (borderColor) {
            self.layer.borderWidth = borderWidth;
            self.layer.borderColor = borderColor.CGColor;
        }
        if (bgImage) {
            [self setBackgroundImage:bgImage forState:UIControlStateNormal];
        }
        if (selectImage) {
            [self setBackgroundImage:selectImage forState:UIControlStateSelected];
        }
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
                   titleColor:(UIColor *)titleColor
                    titleFont:(UIFont *)font
                       target:(id)target
                       action:(SEL)action
                 cornerRadius:(CGFloat)cornerRadius
                  borderColor:(UIColor *)borderColor
                  borderWidth:(CGFloat)borderWidth
                        title:(NSString *)title {
    return [self initWithFrame:frame titleColor:titleColor titleFont:font target:target action:action cornerRadius:cornerRadius borderColor:borderColor borderWidth:borderWidth backgroundImage:nil selectImage:nil title:title];
}

- (instancetype)initWithFrame:(CGRect)frame
                    titleColor:(UIColor *)titleColor
                     titleFont:(UIFont *)font
                        target:(id)target
                       action:(SEL)action
                        title:(NSString *)title {
    return [self initWithFrame:frame titleColor:titleColor titleFont:font target:target action:action cornerRadius:0 borderColor:nil borderWidth:0 title:title];
}

@end
