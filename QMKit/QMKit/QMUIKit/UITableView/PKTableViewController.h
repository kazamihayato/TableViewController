//
//  PKTableViewController.h
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import "PKViewController.h"
#import "PKTableViewAdaptor.h"
#import "PKTableView.h"
typedef NS_ENUM(NSUInteger, PKTableViewStyle)
{
    PKTableViewStyleNormal,
    PKTableViewStyleGroup,
};

@interface PKTableViewController : PKViewController <UITableViewDataSource, UITableViewDelegate>
{
    BOOL _isLoading;
}
@property (nonatomic, strong) PKTableView * uiTableView;
@property (nonatomic, strong) PKTableViewAdaptor * adaptor;
@property (nonatomic, assign) PKTableViewStyle tableViewStyle;

- (instancetype)initWithTableViewFrame:(CGRect)frame;

- (void) constructData;

- (void) reloadTableViewData;

@end
