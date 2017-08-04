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

+ (UIView *)getToolBarCustomViewWithCode:(NSString *)code Title:(NSString *)title
{
    UILabel *customBtn = [LYIconfont LYIconfontLabelWithFrame:CGRectMake(0, 0, 20, 20) code:code color:NavGary size:18.0];
    UILabel *customLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 22, 20, 8)];
    customLabel.textColor = NavGary;
    customLabel.textAlignment = NSTextAlignmentCenter;
    customLabel.text = title;
    customLabel.font = [UIFont systemFontOfSize:8.0];
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 30)];
    [customView addSubview:customBtn];
    [customView addSubview:customLabel];
    return customView;
}
@end
