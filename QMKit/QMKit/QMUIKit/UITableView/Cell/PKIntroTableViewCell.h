//
//  PKIntroTableViewCell.h
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import "PKTableViewLineCell.h"
#import "PKDataModel.h"

typedef NS_ENUM(NSUInteger, PKIntroTableViewCellStyle) {
    PKIntroTableViewCellLabelStyle,
    PKIntroTableViewCellIndicatorStyle,
};

@interface PKIntroDataModel : PKDataModel
@property(nonatomic,strong) NSString * title;
@property(nonatomic,strong) id value;
@property(nonatomic,strong) UIColor *valueColor;
@property(nonatomic,assign) PKIntroTableViewCellStyle cellStyle;
@end

@protocol PKIntroTableViewCellDelegate;
#define INTRO_SHEET_TABLE_VIEW_CELL         @"YcxIntroSheetTableViewCell"

@interface PKIntroTableViewCell : PKTableViewLineCell
@property(nonatomic,strong)PKIntroDataModel * model;
@property(nonatomic,assign)id<PKIntroTableViewCellDelegate>delegate;
@end

@protocol PKIntroTableViewCellDelegate <NSObject>
- (void) introTableViewCell:(PKIntroTableViewCell*)cell didClickButton:(id)object;

@end