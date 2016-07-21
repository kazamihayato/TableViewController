//
//  PKTableViewAdaptor.m
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import "PKTableViewAdaptor.h"
#import <objc/runtime.h>
#import "PKTableViewHeaderView.h"

@interface PKTableViewAdaptor ()

-(NSInteger) numberOfSections;

//获取indexpath位置上cell的数据模型
- (id<PKTableViewCellItemProtocol>) objectForRowAtIndexPath:(NSIndexPath *)indexPath;

//获取cell数据模型item对应的cell的类对象
- (Class) cellClassForObject:(id<PKTableViewCellItemProtocol>)object;

- (NSString *) identifierForCellAtIndexPath:(NSIndexPath *)indexPath;

- (NSString *) cellTypeAtIndexPath:(NSIndexPath *)indexPath;

@end

@implementation PKTableViewAdaptor
- (id) init {
    self = [super init];
    if (self) {
        self.canMove = NO;
        self.canEdit = NO;
    }
    
    return self;
}
- (NSString*) tableViewClassName {
    return @"PKTableView";
}
- (PKTableViewCell *) generateCellForObject:(id<PKTableViewCellItemProtocol>)object
                                   indexPath:(NSIndexPath *)indexPath
                                  identifier:(NSString *)identifier {
    PKTableViewCell * cell = nil;
    
    if (object) {
        Class cellClass = [self cellClassForObject:object];
        
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell setObject:object];
    }
    return cell;
}
- (NSInteger) numberOfSections {
   
    return [_items count];
}
- (CGFloat) heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat rowHeight       = 0;
    
    UITableView * tableView = _uiTableView;
    id object               = [self objectForRowAtIndexPath:indexPath];
    
    Class cellClass         = [self cellClassForIndexPath:indexPath];
    rowHeight               = [cellClass tableView:tableView rowHeightForObject:object];
    
    return rowHeight;
}
- (id<PKTableViewCellItemProtocol>) objectForRowAtIndexPath:(NSIndexPath *)indexPath {
    id object   = nil;
    object      = [self.items objectAtIndexPath:indexPath];
    return object;
}

- (Class) cellClassForObject:(id<PKTableViewCellItemProtocol>)object{
    Class cellClass = nil;
    
    if (object) {
        if ([object respondsToSelector:@selector(cellClass)]) {
            cellClass = [object cellClass];
        }
    }
    
    return cellClass;
}

- (Class)cellClassForIndexPath:(NSIndexPath *)indexPath{
    Class cellClass = nil;
    id<PKTableViewCellItemProtocol> object = [self objectForRowAtIndexPath:indexPath];
    
    cellClass = [self cellClassForObject:object];
    
    return cellClass;
}

- (NSString *)identifierForCellAtIndexPath:(NSIndexPath *)indexPath {
    NSString * identifier = nil;
    identifier = [self cellTypeAtIndexPath:indexPath];
    return identifier;
}

- (NSString *)cellTypeAtIndexPath:(NSIndexPath *)indexPath{
    NSString * cellType = nil;
    
    id<PKTableViewCellItemProtocol> object = [self objectForRowAtIndexPath:indexPath];
    if (object) {
        cellType = [object cellType];
    }
    
    return cellType;
}
#pragma mark - UI TableView DataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return [self numberOfSections];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items countAtSection:section];
}

//这里重写了TableView的代理方法
- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //先将ViewModel取出
    id<PKTableViewCellItemProtocol> object = [self objectForRowAtIndexPath:indexPath];
    
    //取出ViewModel中的CellType
    NSString * identifier  = [self identifierForCellAtIndexPath:indexPath];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    //这里与平时写的TableView大相径庭
    if (cell == nil) {
        //初始化cell
        cell = [self generateCellForObject:object indexPath:indexPath identifier:identifier];
    }

    //更新数据
    if ([cell isKindOfClass:[PKTableViewCell class]]) {
        [(PKTableViewCell *)cell setObject:object];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height      = 0;
    
    if (_uiTableView == nil) {
        _uiTableView = (PKTableView*)tableView;
    }
    height = [self heightForRowAtIndexPath:indexPath];
    return height;
}

- (BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id<PKTableViewCellItemProtocol> object = [self objectForRowAtIndexPath:indexPath];
    if (_delegate && [_delegate respondsToSelector:@selector(tableView:canEditObject:forRowAtIndexPath:)]) {
        return [_delegate tableView:tableView canEditObject:object forRowAtIndexPath:indexPath];
    }
    
    return NO;
}

- (BOOL) tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id<PKTableViewCellItemProtocol> object = [self objectForRowAtIndexPath:indexPath];
    if (_delegate && [_delegate respondsToSelector:@selector(tableView:canMoveObject:forRowAtIndexPath:)]) {
        return [_delegate tableView:tableView canMoveObject:object forRowAtIndexPath:indexPath];
    }
    
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id<PKTableViewCellItemProtocol> object = [self objectForRowAtIndexPath:indexPath];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if (_delegate && [_delegate respondsToSelector:@selector(tableView:commitDeletingObject:forRowAtIndexPath:)]) {
            [_delegate tableView:tableView commitDeletingObject:object forRowAtIndexPath:indexPath];
        }
    }
}

- (BOOL) tableView:(UITableView *)tableView enableGroupModeAtSection:(NSInteger)section {
    
    if (_delegate && [_delegate respondsToSelector:@selector(tableView:enableGroupModeAtSection:)]) {
        return [_delegate tableView:tableView enableGroupModeAtSection:section];
    }
    
    return NO;
}


#pragma mark - UI TableView Delegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    id<PKTableViewCellItemProtocol> object = [self objectForRowAtIndexPath:indexPath];
    if (_delegate && [_delegate respondsToSelector:@selector(tableView:didSelectObject:rowAtIndexPath:)]) {
        [_delegate tableView:tableView didSelectObject:object rowAtIndexPath:indexPath];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<PKTableViewCellItemProtocol> object = [self objectForRowAtIndexPath:indexPath];
    if (_delegate && [_delegate respondsToSelector:@selector(tableView:willDisplayObject:forRowAtIndexPath:)]) {
        [_delegate tableView:tableView willDisplayObject:object forRowAtIndexPath:indexPath];
    }
}

#pragma mark - UI ScrollView Delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    if ([self respondsToSelector:@selector(tableViewWillBeginDragging:)]) {
        [self performSelector:@selector(tableViewWillBeginDragging:) withObject:scrollView];
    }
    
    if (_delegate && [_delegate respondsToSelector:@selector(tableViewWillBeginDragging:)]) {
        [_delegate tableViewWillBeginDragging:(UITableView*)scrollView];
    }
}

- (void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    if ([self respondsToSelector:@selector(tableViewDidEndDragging:)]) {
        [self performSelector:@selector(tableViewDidEndDragging:) withObject:scrollView];
    }
    
    if (_delegate && [_delegate respondsToSelector:@selector(tableViewDidEndDragging:)]) {
        [_delegate tableViewDidEndDragging:(UITableView*)scrollView];
    }
}


- (void)scrollViewDidScroll:(UIScrollView*)scrollView {
    
    if ([self respondsToSelector:@selector(tableViewDidScroll:)]) {
        [self performSelector:@selector(tableViewDidScroll:) withObject:scrollView];
    }
    
    if (_delegate && [_delegate respondsToSelector:@selector(tableViewDidScroll:)]) {
        [_delegate tableViewDidScroll:(UITableView*)scrollView];
    }
    
    CGRect frame = scrollView.frame;
    CGPoint offset = scrollView.contentOffset;
    CGSize size = scrollView.contentSize;
    
    if (size.height <= offset.y + frame.size.height - 30.0f) {
        if (_delegate && [_delegate respondsToSelector:@selector(tableViewScrollBottom:)]) {
            [_delegate tableViewScrollBottom:(UITableView*)scrollView];
        }
    }
}

@end

static char kAdapterArrayKeysObjectKey;
static char kAdapterHeaderClassObjectKey;
@implementation PKTableViewAdaptor (Index)

@dynamic arrayKeys;
@dynamic headerClass;


- (NSArray*) arrayKeys {
    return (NSArray *)objc_getAssociatedObject(self, &kAdapterArrayKeysObjectKey);
}

- (void) setArrayKeys:(NSArray *)arrayKeys {
    objc_setAssociatedObject(self, &kAdapterArrayKeysObjectKey, arrayKeys, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (Class) headerClass {
    return (Class)objc_getAssociatedObject(self, &kAdapterHeaderClassObjectKey);
}

- (void) setHeaderClass:(Class)headerClass {
    objc_setAssociatedObject(self, &kAdapterHeaderClassObjectKey, headerClass, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


#pragma mark - UI TableView DataSource
- (NSArray*) sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.arrayKeys;
}

- (NSInteger) tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    NSInteger count = 0;
    
    for (NSString* character in self.arrayKeys) {
        if ([character isEqualToString:title]) {
            return count;
        }
        count++;
    }
    return count;
}


#pragma mark - UITableViewDelegate
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    CGFloat height = 0.0f;
    if ([self.arrayKeys count] > 0) {
        if (self.headerClass) {
            height = [self.headerClass heightForView];
        } else {
            height = [PKTableViewHeaderView heightForView];
        }
    }
    return height;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    PKTableViewHeaderView* headerView = nil;
    if (self.headerClass) {
        headerView = [[self.headerClass alloc] init];
    } else {
        headerView = [[PKTableViewHeaderView alloc] init];
    }
    headerView.uiTitle.text = self.arrayKeys[section];
    
    return headerView;
}

@end