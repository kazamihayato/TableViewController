//
//  QMUIKit.m
//  QMKit
//
//  Created by 庄BB的MacBook on 16/7/19.
//  Copyright © 2016年 BBFC. All rights reserved.
//

#import <Foundation/Foundation.h>
CGFloat nativeScale(void) {
    static CGFloat scale = 0.0f;
    if (scale == 0.0f) {
        CGFloat width = SCREEN_WIDTH;
        scale = width / 375.0f;
    }
    return scale * 2;
}