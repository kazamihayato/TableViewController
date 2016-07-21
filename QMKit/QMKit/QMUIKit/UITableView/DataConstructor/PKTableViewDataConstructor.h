//
//  PKTableViewDataConstructor.h
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PKIndexPathArray.h"

@class PKDataModel;

@interface PKTableViewDataConstructor : NSObject

@property(nonatomic,strong)PKIndexPathArray * items;
@property (nonatomic, assign) NSInteger indexOfHighlight;
@property (nonatomic, assign) UIViewController* viewControllerDelegate;
- (void) constructData;
- (void) updateHighlightCell:(CGPoint)offset;
- (PKDataModel*) itemByCellType:(NSString*)cellType;

- (NSInteger) indexByCellTag:(NSInteger)cellTag;

- (id) valueForCellType:(NSString*)cellType;

- (void) indexPathByCellType:(NSString*)cellType block:(void (^)(NSIndexPath* indexPath))block;

- (void) refreshValueForCellType:(NSString*)cellType;
- (void) refreshValueForCellType:(NSString *)cellType block:(void (^)(PKDataModel* item))block;

@end

@interface PKTableViewDataConstructor (Index)
@property (nonatomic, strong) NSArray* arrayKeys;
- (void) constructIndex;
@end