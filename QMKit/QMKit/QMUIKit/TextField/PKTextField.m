//
//  PKTextField.m
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import "PKTextField.h"

@implementation PKTextField
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self setFont:FONT_SIZE(16*displayScale)];
        [self setTintColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0]];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void) drawPlaceholderInRect:(CGRect)rect {
    NSDictionary *attributes = @{ NSFontAttributeName: [UIFont systemFontOfSize:16*displayScale], NSForegroundColorAttributeName :PK_FONTCOLOR_C3};
    [self.placeholder drawInRect:CGRectInset(rect, 0, 0) withAttributes:attributes];
}

@end
