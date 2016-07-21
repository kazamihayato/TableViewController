//
//  PKWLoginFiledCell.m
//  PKW
//
//  Created by peikua on 16/5/23.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "PKWLoginFiledCell.h"
#import "PKTextField.h"
#import "PKWTimerButton.h"
#import "UIView+Animation.h"

#define CellHeight 49*displayScale

@implementation PKWLoginFieldModel

@end


@interface PKWLoginFiledCell ()<UITextFieldDelegate>
@property(nonatomic,strong)UIImageView    * titleIcon;
@property(nonatomic,strong)PKLabel        * titleLabel;
@property(nonatomic,strong)PKTextField    * textField;
@property(nonatomic,strong)PKWTimerButton * timerButton;
@property(nonatomic,strong)PKUIButton     * secretButton;
@property(nonatomic,strong)CALayer        * separateLine;
@property(nonatomic,strong)CALayer        * lineUpper;
@property(nonatomic,strong)CALayer        * lineLower;
@property(nonatomic,assign)NSInteger        limitDigit;
@end


@implementation PKWLoginFiledCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle  = UITableViewCellSelectionStyleNone;
        self.backgroundColor = DEFAULT_WHITE;
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notifierDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
        
        _titleIcon=[[UIImageView alloc] initWithFrame:CGRectMake(16*displayScale,(CellHeight-15*displayScale)/2, 14*displayScale, 15*displayScale)];
        [self.contentView addSubview:_titleIcon];
        
        _titleLabel=[[PKLabel alloc] initWithFrame:CGRectMake(MAX_X(_titleIcon)+12*displayScale, (CellHeight-20)/2, 50*displayScale, 20)
                                              text:@""
                                         textColor:PK_FONTCOLOR_C2
                                              font:16*displayScale
                                            isBold:NO
                                     textAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:_titleLabel];
        
        _textField=[[PKTextField alloc] initWithFrame:CGRectMake(MAX_X(_titleLabel)+20*displayScale, (CellHeight-20)/2, 185*displayScale, 20)];
        [_textField setClearButtonMode:UITextFieldViewModeWhileEditing];
        [self.contentView addSubview:_textField];
    }
    return self;
}

- (void)setObject:(id)object
{
    if (self.item != object && object !=nil) {
        self.item = object;
        self.item.cellInstance = self;
    }
    PKWLoginFieldModel * dataModel = (PKWLoginFieldModel*)self.item;
    _titleIcon.image               = [UIImage imageNamed:dataModel.imageName];
    _titleLabel.text               = dataModel.title;
    _textField.placeholder         = dataModel.placeHolder;
    _textField.secureTextEntry     = dataModel.secureTextEntry;
    _textField.keyboardType        = dataModel.keyboradType;
    self.delegate                  = dataModel.delegate;
    switch (dataModel.style) {
        case PKWLoginFieldVcode: {
            if (!_timerButton) {
                _timerButton=[[PKWTimerButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60*displayScale-18*displayScale, (CellHeight-20)/2, 60*displayScale, 20)];
                [_timerButton addTarget:self action:@selector(timerAction) forControlEvents:UIControlEventTouchUpInside];
                [self.contentView addSubview:_timerButton];
            }
            break;
        }
        case PKWLoginFieldSecret: {
            
            if (!_secretButton) {
                _secretButton=[[PKUIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-36*displayScale, 18*displayScale, 20*displayScale, 12*displayScale) selected:@"button-login-eye"];
                [_secretButton addTarget:self action:@selector(secretPressed) forControlEvents:UIControlEventTouchUpInside];
                [self.contentView addSubview:_secretButton];
            }
            break;
        }
            default:
            break;
    }
    if (dataModel.limitDigit>0) {
        _textField.delegate        = self;
        _limitDigit                = dataModel.limitDigit;
    }
    
    if (dataModel.needSeparateLine) {
        if (!_separateLine) {
            _separateLine=[CALayer layer];
            _separateLine.frame=CGRectMake(16*displayScale,CellHeight, SCREEN_WIDTH-32*displayScale, 0.5);
            _separateLine.backgroundColor=PK_LINECOLOR_L1.CGColor;
            [self.layer addSublayer:_separateLine];
        }
    }
    
    if (dataModel.borderType & BorderTypeTop){
        if (!self.lineUpper) {
            self.lineUpper = [CALayer layer];
            self.lineUpper.frame = CGRectMake(0.0f, 0.0f, SCREEN_WIDTH, 0.5f);
            self.lineUpper.backgroundColor = LIGHT_GRAY.CGColor;
            [self.layer addSublayer:self.lineUpper];
        }
            
    }
    if (dataModel.borderType & BorderTypeBottom) {
        if (!self.lineLower) {
            self.lineLower = [CALayer layer];
            self.lineLower.frame = CGRectMake(0.0f, CellHeight, SCREEN_WIDTH, 0.5f);
            self.lineLower.backgroundColor = LIGHT_GRAY.CGColor;
            [self.layer addSublayer:self.lineLower];
        }
    }
}

-(void)timerAction
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(sheetTableViewCell:didClickButton:)])
    {
        [self.delegate sheetTableViewCell:self didClickButton:_timerButton];
    }
}

-(void)secretPressed
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(sheetTableViewCell:didClickButton:)])
    {
        _textField.secureTextEntry=!_textField.secureTextEntry;
        _secretButton.selected=!_secretButton.selected;
        [self.delegate sheetTableViewCell:self didClickButton:_timerButton];
    }
}
- (void) shakeTextEditAnimation
{
    [_textField shakeAnimation];
}
- (void) becomeFirstResponder
{
    [_textField becomeFirstResponder];
}
- (void) resignFirstResponder
{
    [_textField resignFirstResponder];
}
- (void) timerStart
{
     [_timerButton startTimer];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField==_textField) {
        if (_limitDigit>0 ) {
            
            NSInteger existedLength = textField.text.length;
            NSInteger selectedLength = range.length;
            NSInteger replaceLength = string.length;
            if (existedLength - selectedLength + replaceLength > _limitDigit) {
                return NO;
            }
//            if (_isNumber) {
//                return [TextFieldLimitTool validateNumber:string];
//            }
        }
//        if (_isDecimal) {
//            return [TextFieldLimitTool validateCashWith:textField Range:range Cash:string];
//        }
        
        
        return YES;
        
    }
    return YES;
}
-(void)notifierDidChange:(NSNotification *)notification
{
    PKTextField * fieldNotification=(PKTextField *)notification.object;
    if (_textField==fieldNotification) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(sheetTableViewCell:textEditDidChangeValue:)])
        {
            [self.delegate sheetTableViewCell:self textEditDidChangeValue:_textField.text];
        }
    }
}

+(CGFloat)heightForCell
{
    return CellHeight;
}


-(void)dealloc
{

    [[NSNotificationCenter defaultCenter]removeObserver:self];
    self.delegate=nil;
    if(_timerButton)
    {
        [_timerButton stopTimer];
    }
}

@end
