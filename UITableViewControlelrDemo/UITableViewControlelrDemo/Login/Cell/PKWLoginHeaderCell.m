//
//  PKWLoginHeaderCell.m
//  PKW
//
//  Created by peikua on 16/5/23.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "PKWLoginHeaderCell.h"

@implementation PKWLoginHeaderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle      = UITableViewCellSelectionStyleNone;
        UIImageView * headerImgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 152*displayScale)];
        headerImgv.image         = [UIImage imageNamed:@"bg-logoin"];
        [self.contentView addSubview:headerImgv];
    }
    return self;
}

+(CGFloat)heightForCell
{
    return 152*displayScale;
}

@end
