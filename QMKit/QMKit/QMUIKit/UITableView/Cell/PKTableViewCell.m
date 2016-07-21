//
//  PKTableViewCell.m
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import "PKTableViewCell.h"

@implementation PKTableViewCell
#pragma mark - height
+ (CGFloat)tableView:(UITableView *)tableView rowHeightForObject:(id)object{
    CGFloat height = 0;
    
    if ([object conformsToProtocol:@protocol(PKTableViewCellItemProtocol)]) {
        if ([object respondsToSelector:@selector(cellHeight)]) {
            if ([object cellHeight]) {
                height = [[object cellHeight] floatValue];
            }
        }
    }
    
    return height;
}

- (void) setObject:(id)object {
    if (self.item != object && object != nil) {
        self.item = object;
        self.item.cellInstance = self;
    }
}


+ (NSString*) cellIdentifier {
    return @"theDefaultCell";
}

+ (CGFloat) heightForCell {
    return 32.0f;
}
@end
