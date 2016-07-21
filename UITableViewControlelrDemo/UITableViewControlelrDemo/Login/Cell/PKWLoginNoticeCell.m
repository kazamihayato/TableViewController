//
//  PKWLoginNoticeCell.m
//  PKW
//
//  Created by peikua on 16/5/27.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "PKWLoginNoticeCell.h"

#define CellHeight 44*displayScale


@implementation PKWLoginNoticeModel

@end


@interface PKWLoginNoticeCell ()
@property(nonatomic,strong)PKLabel * content;
@end

@implementation PKWLoginNoticeCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
        _content=[[PKLabel alloc] initWithFrame:CGRectMake(16*displayScale,(CellHeight-20*displayScale)/2, 200, 20)
                                           text:@""
                                      textColor:PK_FONTCOLOR_C4
                                           font:12
                                         isBold:NO
                                  textAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:_content];
    }
    return self;
}
-(void)setObject:(id)object
{
    PKWLoginNoticeModel * dataModel=(PKWLoginNoticeModel *)object;
    _content.text=dataModel.text;
    
}

+(CGFloat)heightForCell
{
    return 44*displayScale;
}

@end
