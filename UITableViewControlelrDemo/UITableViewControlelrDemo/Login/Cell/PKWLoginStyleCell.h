//
//  PKWLoginStyleCell.h
//  PKW
//
//  Created by peikua on 16/5/23.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "PKTableViewCell.h"

@protocol PKWLoginStyleCellDelegate <NSObject>

-(void)didChangeLoginStyle:(NSInteger)style;

@end


@interface PKWLoginStyleCell : PKTableViewCell

@property(nonatomic,assign)id<PKWLoginStyleCellDelegate>delegate;

@end
