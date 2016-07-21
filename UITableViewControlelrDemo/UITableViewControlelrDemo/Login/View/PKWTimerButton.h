//
//  PKWTimerButton.h
//  PKW
//
//  Created by peikua on 16/5/23.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ValidTimer : NSObject


@property(nonatomic,assign)BOOL isMoving;
@property(nonatomic,copy)void(^retunBlock)(int second,BOOL isMoving);

-(void)startTimer:(void(^)(int second,BOOL isMoving))retunBlock;

-(BOOL)isMoving;

-(void)stopTimer;
@end



@interface PKWTimerButton : UIButton
-(void)startTimer;

-(void)stopTimer;
@end
