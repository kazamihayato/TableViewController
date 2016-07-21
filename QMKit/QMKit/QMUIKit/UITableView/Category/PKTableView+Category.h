//
//  PKTableView+Category.h
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import "PKTableView.h"
#import "PKTableViewCell.h"

@interface PKTableView (Category)

@end

@interface PKTableView (ReloadCell)

-(void)reloadCell:(PKTableViewCell * )cell;

-(void)scrollToCellWithIndex:(NSInteger)index;

@end
