//
//  PKOneButtonCell.m
//  PKW
//
//  Created by peikua on 16/5/23.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "PKOneButtonCell.h"


@implementation PKOneButtonCellModel
-(instancetype)init
{
    self=[super init];
    if (self) {
        self.style=PKButtonStyleFilled;
        self.enable=YES;
    }
    return self;
}


@end

#define CELL_HEIGHT     84.0f * displayScale
@implementation PKOneButtonCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        _button=[[PKUIButton alloc] initWithFrame:CGRectMake(16*displayScale, 20*displayScale, SCREEN_WIDTH-32*displayScale, 44*displayScale)];
        _button.needCorner=YES;
        [self.contentView addSubview:_button];
        [_button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
-(void)setObject:(id)object
{
    if (self.item != object && object != nil) {
        self.item = object;
    }
    PKOneButtonCellModel *dataModel=(PKOneButtonCellModel*)self.item;
    if ([dataModel.title length]>0) {
        [_button setTitle:dataModel.title forState:UIControlStateNormal];
    }
    if (dataModel.fontSize>0) {
        _button.titleLabel.font=[UIFont systemFontOfSize:dataModel.fontSize];
    }
    if (dataModel.backgroundColor) {
        [self setBackgroundColor:dataModel.backgroundColor];
    }
    if (dataModel.btnColor) {
        _button.bgColor=dataModel.btnColor;
    }
    _button.buttonStyle=dataModel.style;
    _button.enabled=dataModel.enable;
    dataModel.cellInstance=self;
    self.delegate=dataModel.delegate;
}
- (void) buttonAction:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickButtonTableViewCell:)])
    {
        [self.delegate didClickButtonTableViewCell:self];
    }
}
+ (CGFloat) heightForCell {
    return CELL_HEIGHT;
}

-(void)dealloc
{
    _delegate=nil;
}
@end
