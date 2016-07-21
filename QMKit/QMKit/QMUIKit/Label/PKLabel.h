//
//  PKLabel.h
//  haitao
//
//  Created by peikua on 16/4/19.
//  Copyright © 2016年 上海市配夸网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKLabel : UILabel
-(id)initWithFrame:(CGRect)frame
              text:(NSString*)text
         textColor:(UIColor*)color
              font:(CGFloat)font
            isBold:(BOOL)isBold
     textAlignment:(NSTextAlignment)textAlignment;
@end
