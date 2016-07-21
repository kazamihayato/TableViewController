//
//  PKWLoginConstructor.m
//  PKW
//
//  Created by peikua on 16/5/23.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "PKWLoginConstructor.h"
#import "PKWLoginHeaderCell.h"
#import "PKWLoginStyleCell.h"
#import "PKWLoginFiledCell.h"
#import "PKWLoginActionCell.h"
#import "PKOneButtonCell.h"
#import "PKWThirdLoginCell.h"

@implementation PKWLoginConstructor
- (void)constructData
{
    //每次重新装填数据需要RemoveAll
    [self.items removeAllObjects];
    
    //每一个Cell都由ViewModel来创建
    PKDataModel * itemHeader = [[PKDataModel alloc] init];
    
    //ViewModel的Cell类型
    itemHeader.cellClass     = [PKWLoginHeaderCell class];
    
    //ViewModel的CelllType(在TableViewDataSource方法中，赋值identify)
    itemHeader.cellType      = @"cell.type.header";
    
    //ViewModel的Cell高度
    itemHeader.cellHeight    = [NSNumber numberWithFloat:[PKWLoginHeaderCell heightForCell]];
    
    //把ViewModel加入构造器的数组中
    [self.items addObject:itemHeader];
    
    PKDataModel * itemLoginStyle = [[PKDataModel alloc] init];
    itemLoginStyle.cellClass     = [PKWLoginStyleCell class];
    itemLoginStyle.cellType      = @"cell.type.loginStyle";
    itemLoginStyle.cellHeight    = [NSNumber numberWithFloat:[PKWLoginStyleCell heightForCell]];
    itemLoginStyle.delegate      = self.viewControllerDelegate;
    [self.items addObject:itemLoginStyle];
    
    
    if (self.loginStyle==0) {
        
        NSString * cellType[2]={@"cell.type.account",@"cell.type.password"};
        NSString * titles[2]={@"账号",@"密码"};
        NSString * titleIcons[2]={@"icon_account",@"icon_password"};
        NSString * placeHolders[2]={@"手机号/邮箱",@"请输入密码"};
        
        for(NSInteger i=0;i<2;i++)
        {
            PKWLoginFieldModel * itemField = [[PKWLoginFieldModel alloc] init];
            itemField.cellType             = cellType[i];
            itemField.cellHeight           = [NSNumber numberWithFloat:[PKWLoginFiledCell heightForCell]];
            itemField.cellClass            = [PKWLoginFiledCell class];
            itemField.title                = titles[i];
            itemField.imageName            = titleIcons[i];
            itemField.placeHolder          = placeHolders[i];
            itemField.keyboradType         = UIKeyboardTypeDefault;
            itemField.delegate             = self.viewControllerDelegate;
            if (i==0) {
                itemField.style            = PKWLoginFieldNormal;
                itemField.needSeparateLine = YES;
            }
            else
            {
                itemField.style            = PKWLoginFieldSecret;
                itemField.secureTextEntry  = YES;
                itemField.limitDigit       = 12;
            }
            [self.items addObject:itemField];
            
        }
    }
    else
    {
        NSString * cellType[2]={@"cell.type.number",@"cell.type.vcode"};
        NSString * titles[2]={@"账号",@"验证码"};
        NSString * titleIcons[2]={@"icon_account",@"icon_code"};
        NSString * placeHolders[2]={@"已注册的手机号",@"短信验证码"};
        
        for(NSInteger i=0;i<2;i++)
        {
            PKWLoginFieldModel * itemField = [[PKWLoginFieldModel alloc] init];
            itemField.cellType             = cellType[i];
            itemField.cellHeight           = [NSNumber numberWithFloat:[PKWLoginFiledCell heightForCell]];
            itemField.cellClass            = [PKWLoginFiledCell class];
            itemField.title                = titles[i];
            itemField.imageName            = titleIcons[i];
            itemField.placeHolder          = placeHolders[i];
            itemField.keyboradType         = UIKeyboardTypeNumberPad;
            itemField.delegate             = self.viewControllerDelegate;
            if (i==0) {
                itemField.style            = PKWLoginFieldNormal;
                itemField.needSeparateLine = YES;
                itemField.limitDigit       = 11;
            }
            else
            {
                itemField.style=PKWLoginFieldVcode;
                itemField.limitDigit       = 4;
            }
            [self.items addObject:itemField];
        }
    }
    
    PKOneButtonCellModel*itemButton = [[PKOneButtonCellModel alloc] init];
    itemButton.cellClass            = [PKOneButtonCell class];
    itemButton.cellType             = @"cell.type.button";
    itemButton.cellHeight           = [NSNumber numberWithFloat:[PKOneButtonCell heightForCell]];
    itemButton.delegate             = self.viewControllerDelegate;
    itemButton.btnColor             = PK_FONTCOLOR_C1;
    itemButton.title                = @"登录";
    [self.items addObject:itemButton];
    

    PKDataModel * itemAction = [[PKDataModel alloc] init];
    itemAction.cellClass     = [PKWLoginActionCell class];
    itemAction.cellType      = @"cell.type.action";
    itemAction.cellHeight    = [NSNumber numberWithFloat:[PKWLoginActionCell heightForCell]];
    itemAction.delegate      = self.viewControllerDelegate;
    [self.items addObject:itemAction];
    
#if TARGET_IPHONE_SIMULATOR
    
    
#elif TARGET_OS_IPHONE
    if ([WXApi isWXAppInstalled]) {
        PKDataModel * itemThird = [[PKDataModel alloc] init];
        itemThird.cellClass     = [PKWThirdLoginCell class];
        itemThird.cellType      = @"cell.type.third";
        itemThird.cellHeight    = [NSNumber numberWithFloat:[PKWThirdLoginCell heightForCell]];
        itemThird.delegate      = self.viewControllerDelegate;
        [self.items addObject:itemThird];
    }
#endif
    
    
}
@end
