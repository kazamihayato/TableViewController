//
//  PKUIColor.h
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#ifndef PKUIColor_h
#define PKUIColor_h

#define RGB(r,g,b) RGBA(r,g,b,1.0f)

#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define ColorWithRHedix(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define HAIButtonDisable    ColorWithRHedix(0xDFDFDF)

#define kDEFAULT_EUDE_FONT @"Helvetica-Bold"
/**
 *  所有字体颜色C
 */
#define PK_FONTCOLOR_C1      ColorWithRHedix(0xff4a53)
#define PK_FONTCOLOR_C2      ColorWithRHedix(0x1c1c1c)
#define PK_FONTCOLOR_C3      ColorWithRHedix(0x999999)
#define PK_FONTCOLOR_C4      ColorWithRHedix(0x666666)
#define PK_FONTCOLOR_C5      ColorWithRHedix(0x898989)
#define PK_FONTCOLOR_C6      ColorWithRHedix(0xc9c9c9)
#define PK_FONTCOLOR_C7      ColorWithRHedix(0xbebebe)
#define PK_FONTCOLOR_C8      ColorWithRHedix(0x3a3a3a)
#define PK_FONTCOLOR_C9      ColorWithRHedix(0xbcbcbc)
#define PK_FONTCOLOR_C10     ColorWithRHedix(0x757575)
#define PK_FONTCOLOR_C11     ColorWithRHedix(0xffffff)
#define PK_FONTCOLOR_C12     ColorWithRHedix(0xfe6c73)
#define PK_FONTCOLOR_C13     ColorWithRHedix(0xa3adb4)
#define PK_FONTCOLOR_C14     ColorWithRHedix(0x9f7c21)
#define PK_FONTCOLOR_C15     ColorWithRHedix(0xcccccc)
#define PK_FONTCOLOR_C16     ColorWithRHedix(0x6ee849)
#define PK_FONTCOLOR_C17     ColorWithRHedix(0xf6ad3b)
#define PK_FONTCOLOR_C18     ColorWithRHedix(0x3f8adb)
/**
 *  线框色L
 */
#define PK_LINECOLOR_L1      ColorWithRHedix(0xdfdfdf)

/**
 *  背景色BG
 */
#define PK_BGCOLOR_BG1        ColorWithRHedix(0xf6f6f7)
#define PK_BGCOLOR_BG2        ColorWithRHedix(0xffffff)
#define PK_BGCOLOR_BG3        ColorWithRHedix(0x000000)
#define PK_BGCOLOR_BG4        ColorWithRHedix(0xcbcbcb)
#define PK_REDCOLOR_BG5       RGB(254.0, 74.0,83.0)
#define PK_GREENCOLOR         RGB(62, 138, 221)

/**
 *  按钮色BT
 */
#define PK_BTCOLOR_BT1        ColorWithRHedix(0xff4a53)

#define DEFAULT_WHITE [UIColor whiteColor]

#define DARK_GRAY     [UIColor darkGrayColor]

#define HAIPink       RGB(240.0f, 60.0f,140.0f)

#define LIGHT_GRAY    RGB(220.0f,220.0f,220.0f)

#define LINE_RED       RGBA(254.0,74.0,83.0,0.5)
#endif /* PKUIColor_h */
