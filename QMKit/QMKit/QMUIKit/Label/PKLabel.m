//
//  PKLabel.m
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import "PKLabel.h"

@implementation PKLabel

-(id)initWithFrame:(CGRect)frame
              text:(NSString *)text
         textColor:(UIColor *)color
              font:(CGFloat)font
            isBold:(BOOL)isBold
     textAlignment:(NSTextAlignment)textAlignment
{
    self=[super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor  = [UIColor clearColor];
        self.text             = text;
        self.textColor        = color;
        self.font             = isBold?[UIFont boldSystemFontOfSize:font]:[UIFont systemFontOfSize:font];
        self.textAlignment    = textAlignment;
        self.numberOfLines    = 0;
        self.lineBreakMode    = NSLineBreakByWordWrapping;
    }
    return self;
}

@end
