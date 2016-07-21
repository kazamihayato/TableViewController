//
//  PKTableViewCell.h
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKDataModel.h"
@interface PKTableViewCell : UITableViewCell
/*!
 @property
 @abstract      DataModel对象
 */
@property (nonatomic, strong) PKDataModel* item;

/*!
 @property
 @abstract      设置Cell的高度。通过object来动态设置Cell的高度。
 */
+ (CGFloat) tableView:(UITableView*)tableView rowHeightForObject:(id)object;

/*!
 @property
 @abstract      赋值object
 */
- (void) setObject:(id)object;

/*!
 @property
 @abstract      Cell的标识
 */
+ (NSString*) cellIdentifier;

/*!
 @property
 @abstract      Cell的高度
 */
+ (CGFloat) heightForCell;
@end
