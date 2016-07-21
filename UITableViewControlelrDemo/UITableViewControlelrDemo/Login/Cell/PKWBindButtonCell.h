//
//  PKWBindButtonCell.h
//  PKW
//
//  Created by peikua on 16/5/26.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "PKTableViewCell.h"



@protocol PKWBindButtonCellDelegate <NSObject>

-(void)didClickBindButoon;

@end


@interface PKWBindButtonCell : PKTableViewCell
@property(nonatomic,assign)id<PKWBindButtonCellDelegate>delegate;
@end
