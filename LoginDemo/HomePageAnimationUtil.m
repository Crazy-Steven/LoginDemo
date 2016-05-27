//
//  HomePageAnimationUtil.m
//  LoginDemo
//
//  Created by 郭艾超 on 16/5/8.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import "HomePageAnimationUtil.h"
static CGFloat const kBottomLineWith = 284;
@implementation HomePageAnimationUtil
+ (void)titleLabelAnimationWithLabel:(UILabel *)label withView:(UIView *)view
{
    [UIView animateWithDuration:1.5 animations:^{
        label.transform = CGAffineTransformIdentity;
    }];
}

+ (void)textFieldBottomLineAnimationWithConstraint:(NSLayoutConstraint *)constraint withView:(UIView *)view
{
    constraint.constant = kBottomLineWith;
    [UIView animateWithDuration:1.5 animations:^{
        [view layoutIfNeeded];
    }];
}

+ (void)phoneIconAnimationWithLabel:(UIImageView *)imageView withView:(UIView *)view
{
    [UIView animateWithDuration:1.5 animations:^{
        imageView.transform = CGAffineTransformIdentity;
    }];
}

+ (void)tipsLabelMaskAnimation:(UIView *)view withBeginTime:(NSTimeInterval)beginTime withDurationTime:(NSTimeInterval)time
{
    CGPathRef beginPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 0, CGRectGetHeight(view.bounds))].CGPath;
    CGPathRef endPath = [UIBezierPath bezierPathWithRect:(CGRect){0,0,CGRectGetWidth(view.bounds),CGRectGetHeight(view.bounds)}].CGPath;
    
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.path = beginPath;
    
    view.layer.mask = layer;
    
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.duration = time;
    animation.beginTime = CACurrentMediaTime() + beginTime;
    animation.fromValue = (id)layer.path;
    animation.toValue = (__bridge id)endPath;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [layer addAnimation:animation forKey:@"shapeLayerPath"];
}

+ (void)registerButtonWithAnimation:(UIButton *)button withView:(UIView *)view andProgress:(CGFloat)progress withDurationTime:(NSTimeInterval)time
{
    static CAShapeLayer * layer = nil;
    if (!button.layer.mask) {
        layer = [CAShapeLayer layer];
        layer.path = [UIBezierPath bezierPathWithRect:(CGRect){0,0,CGRectGetWidth(button.bounds) * progress,CGRectGetHeight(button.bounds)}].CGPath;
        layer.fillColor = [UIColor whiteColor].CGColor;
        button.layer.mask = layer;
    }else
    {
        CGPathRef path = [UIBezierPath bezierPathWithRect:(CGRect){0,0,CGRectGetWidth(button.bounds) * progress, CGRectGetHeight(button.bounds)}].CGPath;
        CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"path"];
        animation.duration = time;
        animation.fromValue = (id)layer.path;
        animation.toValue = (__bridge id)path;
        animation.removedOnCompletion = YES;
        [layer addAnimation:animation forKey:@"shapeLayerPath"];
        layer.path = path;
    }
}
@end
