//
//  ViewController.m
//  LoginDemo
//
//  Created by 郭艾超 on 16/5/8.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import "ViewController.h"
#import "HomePageAnimationUtil.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *topTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomTitleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textFieldBottomLineConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *phoneIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *topTipsLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomTipsView;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@end

@implementation ViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.phoneNumberTextField.rac_textSignal subscribeNext:^(id x) {
        if (self.phoneNumberTextField.text.length == 11) {
            self.registerButton.userInteractionEnabled = YES;
        }else {
            self.registerButton.userInteractionEnabled = NO;
        }
        CGFloat progress = self.phoneNumberTextField.text.length / 11.0;
        [HomePageAnimationUtil registerButtonWithAnimation:_registerButton withView:self.view andProgress:progress withDurationTime:0.25];

    }];
    _topTitleLabel.transform = CGAffineTransformMakeTranslation(0, -200);
    _bottomTitleLabel.transform = CGAffineTransformMakeTranslation(0, -200);
    _textFieldBottomLineConstraint.constant = 0;
    _phoneIconImageView.transform = CGAffineTransformMakeTranslation(-200, 0);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [HomePageAnimationUtil titleLabelAnimationWithLabel:_topTitleLabel withView:self.view];
    [HomePageAnimationUtil titleLabelAnimationWithLabel:_bottomTitleLabel withView:self.view];
    
    [HomePageAnimationUtil textFieldBottomLineAnimationWithConstraint:_textFieldBottomLineConstraint withView:self.view];
    
    [HomePageAnimationUtil phoneIconAnimationWithLabel:_phoneIconImageView withView:self.view];
    
    [HomePageAnimationUtil tipsLabelMaskAnimation:_topTipsLabel withBeginTime:0.f withDurationTime:1.5f];
    [HomePageAnimationUtil tipsLabelMaskAnimation:_bottomTipsView withBeginTime:1.5f withDurationTime:1.5f];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - keyboard
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
