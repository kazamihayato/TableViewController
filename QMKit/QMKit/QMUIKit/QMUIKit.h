//
//  QMUIKit.h
//  QMKit
//
//  Created by 庄BB的MacBook on 16/7/19.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#ifndef QMUIKit_h
#define QMUIKit_h

#import "PKUIColor.h"
#import "PKLabel.h"
#import "PKUIButton.h"


/**
 *  屏幕大小
 */
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


//字体
#define TABLECELLFONT [UIFont systemFontOfSize:12]//页面主字体
#define TABLECELLSMALLFONT [UIFont systemFontOfSize:10]//页面二级字体
#define NAVHEADFONT  [UIFont systemFontOfSize:17]//标题字体
#define BUTTONREGULARFONT   [UIFont systemFontOfSize:15]//按钮正常字体
#define BUTTONBIGFONT  [UIFont boldSystemFontOfSize:15]//按钮大号字体
#define BUTTONSMALLRFONT  [UIFont boldSystemFontOfSize:12]//按钮小号字体


/**
 *  所有字号大小
 */
#define PK_FONTSIZE_F1       [UIFont systemFontOfSize:17]
#define PK_FONTSIZE_F2       [UIFont systemFontOfSize:16]
#define PK_FONTSIZE_F3       [UIFont systemFontOfSize:14]
#define PK_FONTSIZE_F4       [UIFont systemFontOfSize:13]
#define PK_FONTSIZE_F5       [UIFont systemFontOfSize:12]
#define PK_FONTSIZE_F6       [UIFont systemFontOfSize:11]
#define PK_FONTSIZE_F7       [UIFont systemFontOfSize:10]
#define PK_FONTSIZE_F8       [UIFont systemFontOfSize:15]
#define PK_FONTSIZE_F9       [UIFont systemFontOfSize:24]
#define PK_FONTSIZE_F10      [UIFont systemFontOfSize:18]
#define PK_FONTSIZE_F11      [UIFont systemFontOfSize:25]
#define PK_FONTSIZE_F12      [UIFont systemFontOfSize:20]

#define FONT_SIZE(s)                 [UIFont systemFontOfSize:s]

#define FONT_BOLD_SIZE(s)            [UIFont boldSystemFontOfSize:s]

#define MAX_X(view) CGRectGetMaxX(view.frame)

#define MAX_Y(view) CGRectGetMaxY(view.frame)


CGFloat nativeScale(void);

#define displayScale    (nativeScale() / 2)

#define fontScale       ((ceil(displayScale)-1)*2)



#endif /* QMUIKit_h */
