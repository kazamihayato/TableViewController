//
//  PKTableViewDataConstructor.m
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import "PKTableViewDataConstructor.h"
#import "PKDataModel.h"
#import <objc/runtime.h>
#import "PKTableViewCell.h"

@implementation PKTableViewDataConstructor
- (id) init {
    self = [super init];
    if (self) {
        _indexOfHighlight = -1;
    }
    
    return self;
}

- (void) constructData {
    
}

- (void) updateHighlightCell:(CGPoint)offset {
    
}

-(NSInteger) indexByCellTag:(NSInteger)cellTag
{
    for (NSArray* array in self.items.arrayIndexPath) {
        for (NSInteger i=0;i<array.count; i++) {
            PKDataModel* item=(PKDataModel*)array[i];
            if (item.cellTag==cellTag) {
                return i;
            }
        }
    }
    return 0;
}


- (PKDataModel*) itemByCellType:(NSString *)cellType {
    if ([cellType length] == 0) {
        return nil;
    }
    for (NSArray* array in self.items.arrayIndexPath) {
        for (PKDataModel* item in array) {
            if ([item.cellType isEqualToString:cellType]) {
                return item;
            }
        }
    }
    return nil;
}

- (void) indexPathByCellType:(NSString *)cellType block:(void (^)(NSIndexPath *))block {
    if ([cellType length] == 0) {
        return;
    }
    __block BOOL found = NO;
    [self.items.arrayIndexPath enumerateObjectsUsingBlock:^(id obj, NSUInteger section, BOOL *stop) {
        NSArray* array = (NSArray*)obj;
        [array enumerateObjectsUsingBlock:^(id obj, NSUInteger row, BOOL *stop) {
            PKDataModel* item = (PKDataModel*)obj;
            if ([item.cellType isEqualToString:cellType]) {
                
                if (block) {
                    block([NSIndexPath indexPathForRow:row inSection:section]);
                }
                found = YES;
            }
            *stop = found;
        }];
        *stop = found;
    }];
}
-(void) refreshValueForCellType:(NSString *)cellType {
    PKDataModel* item = [self itemByCellType:cellType];
    if (item == nil) {
        return;
    }
    
    PKTableViewCell* cellInstance = (PKTableViewCell*)item.cellInstance;
    [cellInstance setObject:item];
}

- (void) refreshValueForCellType:(NSString *)cellType block:(void (^)(PKDataModel *))block {
    PKDataModel* item = [self itemByCellType:cellType];
    if (item == nil) {
        return;
    }
    if (block)
    {
        block(item);
        
        PKTableViewCell* cellInstance = (PKTableViewCell*)item.cellInstance;
        [cellInstance setObject:item];
    }
}


#pragma mark - setter/getter
- (PKIndexPathArray *) items {
    if (_items == nil) {
        _items = [[PKIndexPathArray alloc] init];
    }
    return _items;
}
@end

static char kAdapterArrayKeysObjectKey;

@implementation PKTableViewDataConstructor (Index)
@dynamic arrayKeys;

- (NSArray*) arrayKeys {
    return (NSArray *)objc_getAssociatedObject(self, &kAdapterArrayKeysObjectKey);
}

- (void) setArrayKeys:(NSArray *)arrayKeys {
    objc_setAssociatedObject(self, &kAdapterArrayKeysObjectKey, arrayKeys, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void) constructIndex {
    
}

@end
