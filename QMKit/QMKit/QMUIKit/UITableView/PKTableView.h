//
//  PKTableView.h
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PKTableViewDataSource <NSObject,UITableViewDataSource>

@optional
- (BOOL) tableView:(UITableView *)tableView enableGroupModeAtSection:(NSInteger)section;

@end

@interface PKTableView : UITableView
@property(nonatomic,assign) id<PKTableViewDataSource>dataSource;
@end
