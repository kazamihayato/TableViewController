//
//  PKTableView+Category.m
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import "PKTableView+Category.h"

@implementation PKTableView (Category)

@end

@implementation PKTableView (ReloadCell)

- (void) reloadCell:(PKTableViewCell *)cell
{
    NSIndexPath* indexPath = [self indexPathForCell:cell];
    if (indexPath != nil) {
        [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
}

-(void)scrollToCellWithIndex:(NSInteger)index
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    if (indexPath != nil) {
        [self scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}
@end