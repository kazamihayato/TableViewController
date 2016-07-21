//
//  PKDataModel.h
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PKTableViewCellItemProtocol.h"


@interface PKDataModel : NSObject<PKTableViewCellItemProtocol>
@end


@interface PKListModel : PKDataModel
@property (nonatomic, strong) NSMutableArray* items;
@property (nonatomic, assign) NSInteger total;
@end