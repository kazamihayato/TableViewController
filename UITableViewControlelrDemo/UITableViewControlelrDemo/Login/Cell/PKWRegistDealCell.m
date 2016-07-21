//
//  PKWRegistDealCell.m
//  PKW
//
//  Created by peikua on 16/5/25.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "PKWRegistDealCell.h"

@implementation PKWRegistDealCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        PKLabel *label = [[PKLabel alloc]initWithFrame:CGRectMake(16*displayScale, 10, 75, 20*displayScale) text:@"已阅读并同意" textColor:PK_FONTCOLOR_C4 font:12 isBold:NO textAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:label];
        
        UIButton*registDeal=[UIButton buttonWithType:UIButtonTypeSystem];
        [registDeal setTitle:@"《配夸服务协议》" forState:UIControlStateNormal];
        registDeal.titleLabel.font=[UIFont systemFontOfSize:12];
        registDeal.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        registDeal.frame=CGRectMake(MAX_X(label),10, 120, 20*displayScale);
        [registDeal setTitleColor:PK_FONTCOLOR_C1 forState:UIControlStateNormal];
        [registDeal addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:registDeal];
    }
    return self;
}


-(void)setObject:(id)object{
    if (self.item != object && object != nil) {
        self.item = object;
        self.item.cellInstance = self;
    }
    self.delegate=self.item.delegate;
    
}

-(void)btnPressed:(UIButton*)btn
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(viewDidClickDeal:)])
    {
        [_delegate viewDidClickDeal:btn];
    }
}

+(CGFloat)heightForCell
{
    return 30*displayScale;
}
-(void)dealloc
{
    _delegate=nil;
}
@end
