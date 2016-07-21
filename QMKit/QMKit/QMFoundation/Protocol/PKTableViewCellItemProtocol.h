//
//  PKTableViewCellItemProtocol.h
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PKTableViewCellItemProtocol <NSObject>
@property (nonatomic, strong) Class cellClass;      //Cell的类
@property (nonatomic, strong) NSString* cellType;   //Cell的Identify
@property (nonatomic, assign) NSInteger cellTag;    //重复Cell的Tag值
@property (nonatomic, strong) NSNumber* cellHeight; //Cell高度
@property (nonatomic, assign) id delegate;          //Cell的回调
@property (nonatomic, assign) id cellInstance;      //Cell的实例化
@end
