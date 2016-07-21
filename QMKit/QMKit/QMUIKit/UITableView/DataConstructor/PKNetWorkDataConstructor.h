//
//  PKNetWorkDataConstructor.h
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import "PKTableViewDataConstructor.h"

@protocol PKNetworkDataConstructorDelegate;


@interface PKNetWorkDataConstructor : PKTableViewDataConstructor
@property(nonatomic,assign) id<PKNetworkDataConstructorDelegate>delegate;
@property(nonatomic,copy  ) NSString * createTime;
@property(nonatomic,assign) BOOL hasNext;
- (void) loadData;
- (void) loadMore;
- (BOOL) isDelegateValid;
@end


@protocol PKNetworkDataConstructorDelegate <NSObject>
@optional
- (void) networkDataContructorStartLoading:(PKNetWorkDataConstructor*)dataConstructor;

- (void) networkDataContructor:(PKNetWorkDataConstructor*)dataConstructor didFinishWithData:(id)data;

- (void) networkDataContructorDidFailedWithError:(NSString*)error;
@end