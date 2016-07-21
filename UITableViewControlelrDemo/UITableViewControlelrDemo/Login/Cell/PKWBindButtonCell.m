//
//  PKWBindButtonCell.m
//  PKW
//
//  Created by peikua on 16/5/26.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "PKWBindButtonCell.h"


#define CellHeight 40*displayScale

@implementation PKWBindButtonCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
        UIButton*bind=[UIButton buttonWithType:UIButtonTypeSystem];
        [bind setTitle:@"稍后绑定" forState:UIControlStateNormal];
        bind.titleLabel.font=[UIFont systemFontOfSize:15];
        bind.titleLabel.textAlignment=NSTextAlignmentLeft;
        bind.frame=CGRectMake((SCREEN_WIDTH-120)/2,8, 120, 20);
        [bind setTitleColor:PK_FONTCOLOR_C8 forState:UIControlStateNormal];
        [bind addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:bind];
    }
    return self;
}

-(void)setObject:(id)object
{
    PKDataModel*dataModel=(PKDataModel*)object;
    self.delegate=dataModel.delegate;
}
-(void)btnPressed:(UIButton*)btn
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickBindButoon)]) {
        [self.delegate didClickBindButoon];
    }
}
-(void)dealloc
{
    _delegate=nil;
}
@end
