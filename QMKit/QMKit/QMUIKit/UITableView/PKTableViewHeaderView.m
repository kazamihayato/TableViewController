//
//  PKTableViewHeaderView.m
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import "PKTableViewHeaderView.h"

@implementation PKTableViewHeaderView
- (id) init {
    CGRect frame = CGRectMake(0.0f, 0.0f, 320.0f, 20.0f);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor        = [UIColor lightGrayColor];
        
        self.uiTitle                = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 0.0f, 320.0f/2, 20.0f)];
        [self addSubview:self.uiTitle];
        self.uiTitle.font           = [UIFont systemFontOfSize:12];
        self.uiTitle.textColor      = [UIColor blackColor];
    }
    return self;
}


+ (CGFloat) heightForView {
    return 20.0f;
}
@end
