//
//  PKWTimerButton.m
//  PKW
//
//  Created by peikua on 16/5/23.
//  Copyright © 2016年 peikua. All rights reserved.
//

#import "PKWTimerButton.h"
@implementation ValidTimer
{
    NSTimer * _timer;
}

-(void)startTimer:(void (^)(int second, BOOL))retunBlock
{
    _retunBlock =retunBlock;
    _isMoving   =YES;
    if (!_timer) {
        _timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerMoving) userInfo:nil repeats:YES];
    }
}
static int second=60;
-(void)timerMoving
{
    second--;
    NSLog(@"%d",second);
    if (second==0)
    {
        _isMoving=NO;
        [_timer invalidate];
        _timer   =nil;
        second   =60;
    }
    _retunBlock(second,_isMoving);
    
}
-(int)getSecond
{
    return second;
}
-(void)stopTimer
{
    [_timer invalidate];
    _isMoving  =NO;
    second     =60;
    _timer     =nil;
    _retunBlock=nil;
}

@end
@implementation PKWTimerButton
{
    UIColor    * _bgColor;
    ValidTimer * _validTimer;
}

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self)
    {
        _validTimer=[[ValidTimer alloc] init];
        
        [self setTitle:@"立即发送" forState:UIControlStateNormal];
        [self setTitleColor:PK_FONTCOLOR_C1 forState:UIControlStateNormal];
        [self setTitleColor:PK_FONTCOLOR_C2 forState:UIControlStateDisabled];
        self.titleLabel.font           = [UIFont systemFontOfSize:15*displayScale];
        self.contentHorizontalAlignment= UIControlContentHorizontalAlignmentRight;
    }
    return self;
}
-(void)startTimer
{
    self.enabled=NO;
    [self setTitle:@"60s" forState:UIControlStateDisabled];
    WEAK_SELF;
    [_validTimer startTimer:^(int second, BOOL isMoving)
     {
         STRONG_SELF;
         [self setTitle:[NSString stringWithFormat:@"%ds",second] forState:UIControlStateDisabled];
         
         if (!isMoving) {
             self.enabled=YES;
             [self setTitle:@"重新发送" forState:UIControlStateNormal];
         }
     }];
    
}

-(void)stopTimer
{
    [_validTimer stopTimer];
}

@end
