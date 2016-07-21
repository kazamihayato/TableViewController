//
//  PKIndexPathArray.h
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PKIndexPathArray : NSObject
@property (nonatomic, strong, readonly) NSMutableArray* arrayIndexPath;
@property (nonatomic, strong) NSMutableArray* item;

- (void) addObject:(id)object;
- (void) addObjects:(NSArray*)array;
- (void) addObjectsAtNewSection:(NSArray *)array;
- (void) addObjects:(NSArray *)array inSection:(NSInteger)section;

- (void) removeAllObjects;

- (NSUInteger) count;
- (NSUInteger) countAtSection:(NSInteger)section;

- (id) objectAtIndexPath:(NSIndexPath*)indexPath;
- (NSArray*) arrayInSection:(NSInteger)section;
@end
