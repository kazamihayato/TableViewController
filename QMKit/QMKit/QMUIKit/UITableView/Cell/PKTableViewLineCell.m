//
//  PKTableViewLineCell.m
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import "PKTableViewLineCell.h"
#define CELL_HEIGHT     40.0f
@implementation PKTableViewLineCell
- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        
        
        self.clipsToBounds = NO;
        self.contentView.clipsToBounds = NO;
        if ([self.contentView.superview isKindOfClass:[NSClassFromString(@"UITableViewCellScrollView") class]]) {
            self.contentView.superview.clipsToBounds = NO;
        }
        
        self.lineUpper = [CALayer layer];
        self.lineUpper.frame = CGRectMake(0.0f, 0.0f, SCREEN_WIDTH, 0.5f);
        self.lineUpper.backgroundColor = LIGHT_GRAY.CGColor;
        [self.layer addSublayer:self.lineUpper];
        
        self.lineLower = [CALayer layer];
        self.lineLower.frame = CGRectMake(0.0f, CELL_HEIGHT, SCREEN_WIDTH, 0.5f);
        self.lineLower.backgroundColor = LIGHT_GRAY.CGColor;
        [self.layer addSublayer:self.lineLower];
        
    }
    return self;
}


#pragma mark - layout
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat line = 0.5f;
    
    self.lineUpper.frame = CGRectMake(0.0f, 0.0f, SCREEN_WIDTH, line);
    self.lineLower.frame = CGRectMake(0.0f, self.frame.size.height,SCREEN_WIDTH, line);
    
}
@end
