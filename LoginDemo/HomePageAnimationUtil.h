//
//  HomePageAnimationUtil.h
//  LoginDemo
//
//  Created by 郭艾超 on 16/5/8.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface HomePageAnimationUtil : NSObject
+ (void)titleLabelAnimationWithLabel:(UILabel *)label withView:(UIView *)view;

+ (void)textFieldBottomLineAnimationWithConstraint:(NSLayoutConstraint *)constraint withView:(UIView *)view;

+ (void)phoneIconAnimationWithLabel:(UIImageView *)imageView withView:(UIView *)view;

+ (void)tipsLabelMaskAnimation:(UIView *)view withBeginTime:(NSTimeInterval)beginTime withDurationTime:(NSTimeInterval)time;

+ (void)registerButtonWithAnimation:(UIButton *)button withView:(UIView *)view andProgress:(CGFloat)progress withDurationTime:(NSTimeInterval)time;
@end
