//
//  PKWLoginFiledCell.h
//  PKW
//
//  Created by peikua on 16/5/23.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "PKTableViewCell.h"
typedef NS_ENUM(NSInteger, PKWLoginFieldStyle) {
    PKWLoginFieldNormal ,
    PKWLoginFieldVcode,
    PKWLoginFieldSecret,
};
typedef NS_OPTIONS(NSInteger,FieldBorderType) {
    BorderTypeNone   =        0,
    BorderTypeTop    = (1 << 0),
    BorderTypeBottom = (1 << 1),

};

@protocol PKWLoginFiledCellDelegate;

@interface PKWLoginFieldModel : PKDataModel
@property(nonatomic,strong) NSString           * imageName;
@property(nonatomic,strong) NSString           * title;
@property(nonatomic,strong) NSString           * placeHolder;
@property(nonatomic,assign) BOOL                 secureTextEntry;
@property(nonatomic,assign) PKWLoginFieldStyle   style;
@property(nonatomic,assign) UIKeyboardType       keyboradType;
@property(nonatomic,assign) BOOL                 needSeparateLine;
@property(nonatomic,assign) FieldBorderType      borderType;
@property(nonatomic,assign) NSInteger            limitDigit;
@end


@interface PKWLoginFiledCell : PKTableViewCell

@property(nonatomic,assign)id<PKWLoginFiledCellDelegate>delegate;

- (void) shakeTextEditAnimation;
- (void) becomeFirstResponder;
- (void) resignFirstResponder;
- (void) timerStart;
@end


@protocol PKWLoginFiledCellDelegate <NSObject>

@optional
- (void) sheetTableViewCell:(PKWLoginFiledCell *)cell didClickButton:(id)object;

- (void) sheetTableViewCell:(PKWLoginFiledCell *)cell textEditDidChangeValue:(NSString*)value;

@end