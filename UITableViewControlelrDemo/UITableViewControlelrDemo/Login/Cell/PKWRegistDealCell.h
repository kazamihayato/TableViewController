//
//  PKWRegistDealCell.h
//  PKW
//
//  Created by peikua on 16/5/25.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "PKTableViewCell.h"

@protocol PKWRegistDealDelegate;

@interface PKWRegistDealCell : PKTableViewCell
@property(nonatomic,assign)id<PKWRegistDealDelegate>delegate;
@end


@protocol PKWRegistDealDelegate <NSObject>

- (void) viewDidClickDeal:(UIButton*)btn;

@end