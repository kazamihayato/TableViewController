//
//  PKTableViewController.m
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import "PKTableViewController.h"

@interface PKTableViewController ()<PKTableViewAdaptorDelegate>

@property(nonatomic,assign)CGRect frame;


- (void) initialize;
- (void) createTableView;
- (void) createTableAdaptor;
@end


@implementation PKTableViewController

-(instancetype)initWithTableViewFrame:(CGRect)frame
{
    self=[super init];
    if (self) {
        _frame=frame;
    }
    return self;
}
-(instancetype)init
{
    return [self initWithTableViewFrame:CGRectMake(0.0f, 0.0f, SCREEN_WIDTH, SCREEN_HEIGHT)];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initialize];
}

- (void) constructData {
    
}

- (void)initialize
{
    [self createTableAdaptor];
    
    [self constructData];
    
    [self createTableView];
    

}
- (void)createTableView
{
    _uiTableView = [[PKTableView alloc] initWithFrame:_frame];
    [_uiTableView setBackgroundColor:[UIColor clearColor]];
    [_uiTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _uiTableView.showsHorizontalScrollIndicator = NO;
    _uiTableView.showsVerticalScrollIndicator = NO;
    _uiTableView.dataSource = _adaptor;
    _uiTableView.delegate   = _adaptor;
    _adaptor.uiTableView = _uiTableView;
    [self.view addSubview:_uiTableView];
    [_uiTableView reloadData];
    
    self.tableViewStyle = PKTableViewStyleNormal;
}
- (void) createTableAdaptor {
    
    _adaptor = [[PKTableViewAdaptor alloc] init];
    _adaptor.delegate = self;
}
- (void) setTableViewStyle:(PKTableViewStyle)tableViewStyle
{
    _tableViewStyle = tableViewStyle;
    if (_tableViewStyle == PKTableViewStyleGroup)
    {
        self.uiTableView.contentInset = UIEdgeInsetsMake(20.0f, 0.0f, 20.0f, 0.0f);
    } else {
        
        self.uiTableView.contentInset = UIEdgeInsetsZero;
    }
}


- (void) reloadTableViewData {
    [self.uiTableView reloadData];
    
}

- (void) dealloc {
    _adaptor.delegate = nil;
    
}
@end
