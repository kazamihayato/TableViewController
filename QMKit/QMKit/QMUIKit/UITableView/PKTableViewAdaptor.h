//
//  PKTableViewAdaptor.h
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PKTableView.h"
#import "PKTableViewCell.h"
#import "PKIndexPathArray.h"
#import "PKTableViewCellItemProtocol.h"

@protocol PKTableViewAdaptorDelegate;

@interface PKTableViewAdaptor : NSObject<PKTableViewDataSource,UITableViewDelegate>

@property (nonatomic, assign) PKTableView* uiTableView;
@property (nonatomic, strong) PKIndexPathArray* items;
@property (nonatomic, assign) id<PKTableViewAdaptorDelegate> delegate;
@property (nonatomic, assign) BOOL canEdit;
@property (nonatomic, assign) BOOL canMove;


- (PKTableViewCell *) generateCellForObject:(id<PKTableViewCellItemProtocol>)object
                                   indexPath:(NSIndexPath *)indexPath
                                  identifier:(NSString *)identifier;

- (NSString*) tableViewClassName;

- (void)tableViewDidScroll:(UITableView *)tableView;
- (void)tableViewDidEndDragging:(UITableView *)tableView;
- (void)tableViewWillBeginDragging:(UITableView *)tableView;

@end


@protocol PKTableViewAdaptorDelegate <NSObject>

- (void) tableView:(UITableView *)tableView didSelectObject:(id<PKTableViewCellItemProtocol>)object rowAtIndexPath:(NSIndexPath *)indexPath;
@optional
- (BOOL) tableView:(UITableView *)tableView enableGroupModeAtSection:(NSInteger)section;
- (BOOL) tableView:(UITableView *)tableView canEditObject:(id<PKTableViewCellItemProtocol>)object forRowAtIndexPath:(NSIndexPath *)indexPath;
- (BOOL) tableView:(UITableView *)tableView canMoveObject:(id<PKTableViewCellItemProtocol>)object forRowAtIndexPath:(NSIndexPath *)indexPath;
- (void) tableView:(UITableView *)tableView commitDeletingObject:(id<PKTableViewCellItemProtocol>)object forRowAtIndexPath:(NSIndexPath *)indexPath;
- (void) tableView:(UITableView *)tableView willDisplayObject:(id<PKTableViewCellItemProtocol>)object forRowAtIndexPath:(NSIndexPath *)indexPath;

- (void) tableViewDidScroll:(UITableView *)tableView;
- (void) tableViewWillBeginDragging:(UITableView *)tableView;
- (void) tableViewDidEndDragging:(UITableView *)tableView;
- (void) tableViewScrollBottom:(UITableView*)tableView;

@end


@interface PKTableViewAdaptor (Index)
@property (nonatomic, strong) NSArray* arrayKeys;
@property (nonatomic, copy) Class headerClass;
@end