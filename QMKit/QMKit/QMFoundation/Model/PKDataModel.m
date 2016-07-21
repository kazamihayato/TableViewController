//
//  PKDataModel.m
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import "PKDataModel.h"

@implementation PKDataModel
@synthesize cellHeight = _cellHeight;
@synthesize cellType = _cellType;
@synthesize cellClass = _cellClass;
@synthesize delegate = _delegate;
@synthesize cellInstance = _cellInstance;
@synthesize cellTag   =_cellTag;

- (id) initWithDictionary:(NSDictionary *)dictionary {
    if (dictionary == nil || ![dictionary isKindOfClass:[NSDictionary class]]) {
        return nil;
        
    }
    
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (NSDictionary*) dictionaryValue {
    return [NSDictionary dictionary];
}

@end


@implementation PKListModel

- (id) initWithArray:(NSArray *)array {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (NSMutableArray*) items {
    if (_items == nil) {
        _items = [[NSMutableArray alloc] init];
    }
    
    return _items;
}

- (NSArray*) arrayValue {
    return [NSArray array];
}

@end