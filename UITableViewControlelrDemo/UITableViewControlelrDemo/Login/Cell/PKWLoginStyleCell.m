//
//  PKWLoginStyleCell.m
//  PKW
//
//  Created by peikua on 16/5/23.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "PKWLoginStyleCell.h"

#define LoginStyles [NSArray arrayWithObjects:@"账号登录",@"短信登录",nil]
#define LoginStyleBtnWidth (SCREEN_WIDTH-148*displayScale-109*displayScale)/2
@implementation PKWLoginStyleCell
{
    PKUIButton * _lastBtn;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle  = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        [LoginStyles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            
            PKUIButton*btn=[[PKUIButton alloc] initWithFrame:CGRectMake(74*displayScale+(109*displayScale+LoginStyleBtnWidth)*idx, 0, LoginStyleBtnWidth,45*displayScale) selected:@"loginType"];
            [btn setTitle:(NSString *)obj forState:UIControlStateNormal];
            [btn setTitleColor:PK_FONTCOLOR_C2 forState:UIControlStateNormal];
            btn.tag=idx;
            btn.titleLabel.font=[UIFont systemFontOfSize:14*displayScale] ;
            [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
            if (idx==0) {
                btn.selected=YES;
                _lastBtn=btn;
            }
            [self.contentView addSubview:btn];
            
        }];
        
    }
    return self;
}


- (void)setObject:(id)object
{
    PKDataModel * dataModel=(PKDataModel *)object;
    self.delegate=dataModel.delegate;
}


- (void)btnPressed:(PKUIButton *)btn
{
    btn.selected=YES;
    _lastBtn.selected=NO;
    _lastBtn=btn;
    if (self.delegate && [self.delegate respondsToSelector:@selector(didChangeLoginStyle:)]) {
        [self.delegate didChangeLoginStyle:btn.tag];
    }
    
}

+ (CGFloat)heightForCell
{
    return 45*displayScale;
}
- (void)dealloc
{
    self.delegate=nil;
}
@end
