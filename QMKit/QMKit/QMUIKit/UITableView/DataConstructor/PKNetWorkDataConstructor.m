//
//  PKNetWorkDataConstructor.m
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import "PKNetWorkDataConstructor.h"

@interface PKNetWorkDataConstructor ()
@property (nonatomic, strong) Class delegateClass;
@end

Class object_getClass(id object);

@implementation PKNetWorkDataConstructor
-(void) setDelegate:(id<PKNetworkDataConstructorDelegate>)delegate {
    _delegate = delegate;
    if (_delegate) {
        self.delegateClass = object_getClass(_delegate);
    } else {
        self.delegateClass = nil;
    }
}

- (BOOL) isDelegateValid {
    return (_delegate && object_getClass(_delegate) == _delegateClass);
}


- (void) loadData {
    
}

- (void) loadMore {
    
}

- (void) dealloc
{
    _delegate = nil;
    self.delegateClass = nil;
}
@end


