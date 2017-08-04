//
//  LYIconfont.h
//  LYIconfont
//
//  Created by 刘毅 on 2017/8/4.
//  Copyright © 2017年 halohily.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LYIconfont : NSObject
//获取一个按钮类型的iconfont图标，当设置的size超过frame时，取frame的长宽最小值
+ (UIButton *)LYIconfontButtonWithFrame:(CGRect)frame code:(NSString *)code color:(UIColor *)color size:(CGFloat)size;
//获取一个label类型的iconfont图标，当设置的size超过frame时，取frame的长宽最小值
+ (UILabel *)LYIconfontLabelWithFrame:(CGRect)frame code:(NSString *)code color:(UIColor *)color size:(CGFloat)size;

@end
