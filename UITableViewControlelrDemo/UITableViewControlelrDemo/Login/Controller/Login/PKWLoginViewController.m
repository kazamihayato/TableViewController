//
//  PKWLoginViewController.m
//  PKW
//
//  Created by peikua on 16/5/23.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "PKWLoginViewController.h"
#import "PKWLoginConstructor.h"
#import "PKWLoginStyleCell.h"
#import "PKWLoginActionCell.h"
#import "PKWLoginFiledCell.h"
#import "PKOneButtonCell.h"
#import "PKWThirdLoginCell.h"
#import "NSString+Predicate.h"



@implementation PKWLoginModel
- (NSDictionary*)accountLoginDictionaryValue
{
    return @{@"account" :self.account,
             @"password":self.password};
}

- (NSDictionary*)vcodeLoginDictionaryValue
{
    return @{@"number":self.phomeNumber,
             @"vcode" :self.vcode};
}
@end


@interface PKWLoginViewController ()<PKWLoginStyleCellDelegate,PKWLoginActionCellDelegate,PKWLoginFiledCellDelegate,PKButtonTableViewCellDelegate,PKWThirdLoginCellDelegate>

@property(nonatomic,strong)PKWLoginModel       * loginModel;
@property(nonatomic,strong)PKWLoginConstructor * dataConstructor;
@property(nonatomic,assign)NSInteger             loginStyle;//0为账号登陆、1为短信登陆（项目中使用枚举）

@end


@implementation PKWLoginViewController

-(instancetype)init
{
    self=[super init];
    if (self) {
        _loginModel            = [[PKWLoginModel alloc] init];
        _loginStyle            = 0;//默认为账号登陆
    }
    return self;
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"登录";
    self.uiTableView.bounces=NO;
}
-(void)constructData
{
    if (!_dataConstructor) {
        _dataConstructor=[[PKWLoginConstructor alloc] init];
        _dataConstructor.viewControllerDelegate=self;
    }
    //数据构造器填装Cell的数据
    [_dataConstructor constructData];
    //重写的DataSource赋值构造器得到的Cell数据（数组）
    self.adaptor.items=_dataConstructor.items;
    [self reloadTableViewData];
}

//以下只处理Cell的点击事件
#pragma CellDelegate
#pragma mark-更换登录方式
-(void)didChangeLoginStyle:(NSInteger)style
{
//    _loginManager.loginType=style;
    _dataConstructor.loginStyle=style;
    _loginStyle=style;
    [_dataConstructor constructData];
    self.adaptor.items=_dataConstructor.items;
    [self reloadTableViewData];
}

-(void)sheetTableViewCell:(PKWLoginFiledCell *)cell textEditDidChangeValue:(NSString *)value
{
    NSString * cellType=cell.item.cellType;
    if ([cellType isEqualToString:@"cell.type.account"]) {
        _loginModel.account=value;
    }
    else if ([cellType isEqualToString:@"cell.type.password"]) {
        _loginModel.password=value;
    }
    else if ([cellType isEqualToString:@"cell.type.number"]) {
        
        _loginModel.phomeNumber=value;
        
    }
    else if ([cellType isEqualToString:@"cell.type.vcode"]) {
        
        _loginModel.vcode=value;
        
    }
}

#pragma mark-发送验证码
-(void)sheetTableViewCell:(PKWLoginFiledCell *)cell didClickButton:(id)object
{
    NSString * cellType=cell.item.cellType;
    if ([cellType isEqualToString:@"cell.type.vcode"]) {
        if (![_loginModel.phomeNumber isValidMobileNumber])
        {
            PKWLoginFieldModel*dataModel=(PKWLoginFieldModel*)[self.dataConstructor itemByCellType:@"cell.type.number"];
            [((PKWLoginFiledCell*)dataModel.cellInstance) shakeTextEditAnimation];
            NSLog(@"请输入正确的手机号");
        }
        else
        {
            PKWLoginFieldModel*dataModel=(PKWLoginFieldModel*)[self.dataConstructor itemByCellType:@"cell.type.vcode"];
            [((PKWLoginFiledCell*)dataModel.cellInstance) timerStart];
            NSLog(@"验证码已发");
        }
    }
}
#pragma mark-忘记密码/快速注册跳转
-(void)actionDidClickButton:(NSInteger)tag
{
    switch (tag) {
        case 0:
        {
            NSLog(@"跳转至忘记密码页");
        }
            break;
        case 1:
        {
            NSLog(@"跳转至忘记注册页");
        }
            break;
        default:
            break;
    }
}

#pragma mark-第三方登录
-(void)didClickThirdLoginButton:(NSInteger)tag
{
//    展示界面，不写具体逻辑了
//    _loginManager.loginType=tag;
//    [self startLogin];
}

- (void)didClickButtonTableViewCell:(PKOneButtonCell *)cell
{
    NSString * cellType=nil;
    BOOL shake=NO;
    NSString * error=nil;

    if (_loginStyle==0)
    {
        if (![_loginModel.account isValidMobileNumber] && ![_loginModel.account isValidEmail])
        {
            cellType=@"cell.type.account";
            shake=YES;
            error=@"请输入正确的手机号或邮箱";
        }
        else if(_loginModel.password.length<6 || _loginModel.password.length>12)
        {
            cellType=@"cell.type.password";
            shake=YES;
            error=@"密码请输入6-12位字母和数字组合";
        }
    }
    else
    {
        if (![_loginModel.phomeNumber isValidMobileNumber])
        {
            cellType=@"cell.type.number";
            error=@"请输入正确的手机号";
            shake=YES;
        }
        else if (![_loginModel.vcode isValidVerifyCode])
        {
            cellType=@"cell.type.vcode";
            error=@"请输入正确的验证码";
            shake=YES;
        }
    }
    if (shake  && cellType !=nil)
    {
        PKWLoginFieldModel*dataModel=(PKWLoginFieldModel*)[self.dataConstructor itemByCellType:cellType];
        [((PKWLoginFiledCell*)dataModel.cellInstance) shakeTextEditAnimation];
    }
    if (error.length>0) {
        NSLog(@"%@",error);
        return;
    }
//    _loginManager.parameter= _loginManager.loginType==Account?[_loginModel accountLoginDictionaryValue]:[_loginModel vcodeLoginDictionaryValue];
//    [self startLogin];
}


-(void)startLogin
{
//    [_loginManager startLoginWithSuccess:^(id objModel) {
//        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            
//            
//            NSDictionary*dic=(NSDictionary*)objModel;
//            if ([[dic objectForKey:@"hasBindMobile"] boolValue])
//            {
//                [self dismissViewControllerAnimated:YES completion:nil];
//            }
//            else {
//                
//                [self.navigationController pushViewController:[[PKWMobileBindController alloc] init] animated:YES];
//            }
//        });
//        
//        
//        
//    } failure:^(NSError *error) {
//      
//    }];
}

@end
