//
//  PKWLoginActionCell.h
//  PKW
//
//  Created by peikua on 16/5/23.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "PKTableViewCell.h"

@protocol PKWLoginActionCellDelegate <NSObject>
- (void) actionDidClickButton:(NSInteger)tag;
@end


@interface PKWLoginActionCell : PKTableViewCell
@property(nonatomic,assign)id<PKWLoginActionCellDelegate>delegate;
@end
