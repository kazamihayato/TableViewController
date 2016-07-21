//
//  PKWThirdLoginCell.m
//  PKW
//
//  Created by peikua on 16/5/30.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "PKWThirdLoginCell.h"

@implementation PKWThirdLoginCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle      = UITableViewCellSelectionStyleNone;
        [self setBackgroundColor:[UIColor clearColor]];
        
        UIImageView * headerImgv = [[UIImageView alloc] initWithFrame:CGRectMake(48*displayScale, 0, SCREEN_WIDTH-96*displayScale, 12*displayScale)];
        headerImgv.image         = [UIImage imageNamed:@"bg-login-headline-way"];
        [self.contentView addSubview:headerImgv];
        
        UIButton*btn=[[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-45*displayScale)/2, MAX_Y(headerImgv)+18*displayScale, 45*displayScale, 45*displayScale)];
        btn.tag=102;
        [btn setBackgroundImage:[UIImage imageNamed:@"button-login-wechat"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
        
    }
    return self;
}

- (void)setObject:(id)object
{
    PKDataModel * dataModel=(PKDataModel *)object;
    self.delegate=dataModel.delegate;
}

-(void)btnPressed:(UIButton*)btn
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickThirdLoginButton:)]) {
        [self.delegate didClickThirdLoginButton:btn.tag-100];
    }
}
+(CGFloat)heightForCell
{
    return 80*displayScale;
}
-(void)dealloc
{
    self.delegate=nil;
}
@end
