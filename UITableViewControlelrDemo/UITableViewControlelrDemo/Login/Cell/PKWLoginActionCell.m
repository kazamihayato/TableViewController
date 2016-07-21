//
//  PKWLoginActionCell.m
//  PKW
//
//  Created by peikua on 16/5/23.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "PKWLoginActionCell.h"

@implementation PKWLoginActionCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
        
        //注册按钮
        UIButton*forget=[UIButton buttonWithType:UIButtonTypeSystem];
        [forget setTitle:@"忘记密码?" forState:UIControlStateNormal];
        [forget setTitleColor:PK_FONTCOLOR_C4 forState:UIControlStateNormal];
        forget.titleLabel.font=PK_FONTSIZE_F4;
        forget.frame=CGRectMake(15*displayScale,0, 70, 20*displayScale);
        forget.tag=100;
        [forget addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:forget];
        
        //忘记密码
        UIButton*regist=[UIButton buttonWithType:UIButtonTypeSystem];
        [regist setTitle:@"快速注册" forState:UIControlStateNormal];
        [regist setTitleColor:PK_FONTCOLOR_C1 forState:UIControlStateNormal];
        regist.titleLabel.font=PK_FONTSIZE_F4;
        regist.tag=101;
        regist.frame=CGRectMake(SCREEN_WIDTH-15*displayScale-70,0, 70, 20*displayScale);
        [regist addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:regist];
        
    }
    return self;
}
-(void)setObject:(id)object
{
    PKDataModel *dataModel=(PKDataModel *)object;
    self.delegate=dataModel.delegate;
}

-(void)btnPressed:(UIButton*)btn
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(actionDidClickButton:)])
    {
        [_delegate actionDidClickButton:btn.tag-100];
    }
}

+(CGFloat)heightForCell
{
    return 40*displayScale;
}

-(void)dealloc
{
    _delegate=nil;
}
@end
