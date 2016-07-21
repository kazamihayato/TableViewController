//
//  PKViewController.m
//  BanggoPhone
//
//  Created by issuser on 14-6-23.
//  Copyright (c) 2014年 BG. All rights reserved.
//

#import "PKViewController.h"



@interface UINavigationController (UINavigationControllerCategory)
@end
@implementation UINavigationController (UINavigationControllerCategory)
- (BOOL)shouldAutorotate
{
    return NO;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
@end
#pragma -- mark PKViewController

@interface PKViewController ()

@end


@implementation PKViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    //self.navigationController.view.backgroundColor = [UIColor whiteColor];
    if (self.parentViewController.childViewControllers.count>1) {
        [self setLeftButton:nil Image:nil];
    }
    else{
        if (self.presentingViewController) {
            [self setLeftButton:nil Image:@"search-back"];
        }
    }
    self.view.backgroundColor=PK_BGCOLOR_BG1;
    self.navigationController.navigationBar.titleTextAttributes = [self getNavigationTitleTextAttributes];
}

- (void)showAlert:(NSString *)message{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示"
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil, nil];
    [alert show];
}


- (NSDictionary*) getNavigationTitleTextAttributes
{
    
    return @{NSForegroundColorAttributeName:PK_FONTCOLOR_C2, NSFontAttributeName:FONT_SIZE(17)};
}



- (void) backButtonAction:(id)sender {
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}


#pragma mark - back button

//自定义natigationitem标题
//-(void)setTitle:(NSString *)title{
//    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
//    customLab.backgroundColor=[UIColor clearColor];
//    [customLab setTextColor:[UIColor blackColor]];
//    customLab.textAlignment=NSTextAlignmentCenter;
//    customLab.numberOfLines = 2;
//    [customLab setText:title];
//    customLab.font = NAVHEADFONT;
//    if ([title isEqualToString:@"banggo"]) {
//        customLab.font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
//    }
//    self.navigationItem.titleView=customLab;
//}


//导航栏左边按钮
-(void)setLeftButton:(NSString *)title Image:(NSString *)image{
    UIButton *btnBack=[[UIButton alloc]init];
    btnBack.backgroundColor=[UIColor clearColor];
    btnBack.frame=CGRectMake(0, 0, 60, 44);
    [btnBack setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    if (title) {
        btnBack.titleEdgeInsets=UIEdgeInsetsMake(0, 0, 0, 0);
        [btnBack setTitle:title forState:UIControlStateNormal];
        btnBack.titleLabel.font=BUTTONBIGFONT;
        [btnBack setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else{
        btnBack.imageEdgeInsets=UIEdgeInsetsMake(0, -15, 0, 0);
        
        if (image) {
            [btnBack setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        }
        else{
            [btnBack setImage:[UIImage imageNamed:@"search-back"] forState:UIControlStateNormal];
        }
    }
    [btnBack addTarget:self action:@selector(leftReturn:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:btnBack];
    

        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                           initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                           target:nil action:nil];
        negativeSpacer.width = -15;
        self.navigationItem.leftBarButtonItems = @[negativeSpacer, backItem];

    
}
//导航栏左边按钮事件
-(void)leftReturn:(UIButton *)sender{
    
//    HideCurrentKeyboard;隐藏键盘
    if (![self isMemberOfClass:[PKViewController class]])
    {
        if (self.parentViewController.childViewControllers.count>1) {
             [self.navigationController popViewControllerAnimated:YES];
        }
        else{
            if (self.presentingViewController) {
                [self dismissViewControllerAnimated:YES completion:nil];
               
            }
        }
    }
}

#pragma mark - nav buttonitem
- (void)setLeftButton:(NSString*)buttonTitle titleImage:(NSString *)TitleImage action:(SEL)action
{
    
    CGSize size = [buttonTitle sizeWithFont:BUTTONBIGFONT];
	UIImage* image = [UIImage imageNamed:TitleImage];
	UIImage* highlightedImage = [UIImage imageNamed:TitleImage];
	UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
	button.titleLabel.font = BUTTONBIGFONT;
	[button setFrame:CGRectMake(0, 0, MAX((size.width+30),40), MAX(30,size.height))];
	[button setBackgroundImage:[highlightedImage stretchableImageWithLeftCapWidth:20 topCapHeight:15] forState:UIControlStateHighlighted];
	[button setBackgroundImage:[image stretchableImageWithLeftCapWidth:20 topCapHeight:15] forState:UIControlStateNormal];
	[button setTitle:buttonTitle forState:UIControlStateNormal];
	[button setTitle:buttonTitle forState:UIControlStateHighlighted];
	[button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    

        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                           initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                           target:nil action:nil];
        negativeSpacer.width = -10;
        self.navigationItem.leftBarButtonItems = @[negativeSpacer, backItem];

}

- (UIButton *)setRightButton:(NSString*)buttonTitle titleImage:(NSString *)TitleImage action:(SEL)action
{
     CGSize size = [buttonTitle sizeWithFont:BUTTONBIGFONT];
    UIImage* image = [UIImage imageNamed:TitleImage];
//    UIImage* highlightedImage = [UIImage imageNamed:TitleImage];
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = BUTTONREGULARFONT;
   [button setFrame:CGRectMake(0, 0, MAX((size.width+30),40), MAX(30,size.height))];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:[image stretchableImageWithLeftCapWidth:20 topCapHeight:15] forState:UIControlStateNormal];
    [button setTitle:buttonTitle forState:UIControlStateNormal];
    [button setTitle:buttonTitle forState:UIControlStateHighlighted];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:button];

    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -10;    
    self.navigationItem.rightBarButtonItems = @[negativeSpacer, backItem];
    return button;
}

- (void)setNavigationBarBackGroundWithImage:(UIImage *)image{
    [self.navigationController.navigationBar setBackgroundImage:image forBarPosition:UIBarPositionAny
                                                     barMetrics:UIBarMetricsDefault];
}



- (void)setLeftNavigationItemWithCustomView:(UIView*)cusView
{
    UIBarButtonItem *m_buttonItem = [[UIBarButtonItem alloc] initWithCustomView:cusView];
    self.navigationItem.leftBarButtonItem = m_buttonItem;
}

- (void)setRightNavigationItemWithCustomView:(UIView*)cusView
{
    UIBarButtonItem *m_buttonItem = [[UIBarButtonItem alloc] initWithCustomView:cusView];
    self.navigationItem.rightBarButtonItem = m_buttonItem;
}
//- (void)presentLoginViewController
//{
//    if (![PKWUserManager isUserLogin]){
//        
//        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:[[PKWLoginViewController alloc]init]];
//        [self presentViewController:nav animated:YES completion:nil];
//    }
//}


-(void)presentWithNCV:(UIViewController*)controller{
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:controller];
    if (self.navigationController) {
        [self.navigationController presentViewController:nav animated:YES completion:nil];
    }else{
        [self presentViewController:nav animated:YES completion:nil];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
