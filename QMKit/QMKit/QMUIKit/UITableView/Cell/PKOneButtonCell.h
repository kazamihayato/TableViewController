//
//  PKOneButtonCell.h
//  PKW
//
//  Created by peikua on 16/5/23.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "PKTableViewCell.h"


@interface PKOneButtonCellModel : PKDataModel
@property (nonatomic, strong) NSString* title;
@property (nonatomic, assign) CGFloat fontSize;
@property (nonatomic, assign) PKButtonStyle style;
@property (nonatomic, assign) BOOL enable;
@property (nonatomic, strong) UIColor * backgroundColor;
@property (nonatomic, strong) UIColor * btnColor;
@end

@protocol PKButtonTableViewCellDelegate;

@interface PKOneButtonCell : PKTableViewCell
@property(nonatomic,assign)id<PKButtonTableViewCellDelegate>delegate;
@property(nonatomic,strong)PKUIButton * button;
@end


@protocol PKButtonTableViewCellDelegate <NSObject>

- (void) didClickButtonTableViewCell:(PKOneButtonCell*)cell;

@end