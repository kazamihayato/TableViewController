//
//  PKWThirdLoginCell.h
//  PKW
//
//  Created by peikua on 16/5/30.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "PKTableViewCell.h"

@protocol PKWThirdLoginCellDelegate <NSObject>

-(void)didClickThirdLoginButton:(NSInteger)tag;

@end


@interface PKWThirdLoginCell : PKTableViewCell

@property(nonatomic,assign)id<PKWThirdLoginCellDelegate>delegate;

@end
