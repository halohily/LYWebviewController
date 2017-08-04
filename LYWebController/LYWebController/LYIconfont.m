//
//  LYIconfont.m
//  LYIconfont
//
//  Created by 刘毅 on 2017/8/4.
//  Copyright © 2017年 halohily.com. All rights reserved.
//

#import "LYIconfont.h"

@implementation LYIconfont

+ (UIButton *)LYIconfontButtonWithFrame:(CGRect)frame code:(NSString *)code color:(UIColor *)color size:(CGFloat)size
{
    UIButton *LYButton = [[UIButton alloc] init];
    LYButton.frame = frame;
    [LYButton setTitle:code forState:UIControlStateNormal];
    CGFloat maxSize = frame.size.height < frame.size.width ? frame.size.height : frame.size.width;
    if (size <= maxSize){
        LYButton.titleLabel.font = [UIFont fontWithName:@"iconfont" size:size];
    } else {
        LYButton.titleLabel.font = [UIFont fontWithName:@"iconfont" size:maxSize];
    }
    LYButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [LYButton setTitleColor:color forState:UIControlStateNormal];
    return LYButton;
}

+ (UILabel *)LYIconfontLabelWithFrame:(CGRect)frame code:(NSString *)code color:(UIColor *)color size:(CGFloat)size
{
    UILabel *LYLabel = [[UILabel alloc] init];
    LYLabel.frame = frame;
    CGFloat maxSize = frame.size.height < frame.size.width ? frame.size.height : frame.size.width;
    if (size <= maxSize){
        LYLabel.font = [UIFont fontWithName:@"iconfont" size:size];
    } else {
        LYLabel.font = [UIFont fontWithName:@"iconfont" size:maxSize];
    }
    LYLabel.text = code;
    LYLabel.textColor = color;
    LYLabel.textAlignment = NSTextAlignmentCenter;
    return LYLabel;
}

@end
