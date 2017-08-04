//
//  UIWebView+Jianshu.h
//  LYWebController
//
//  Created by 刘毅 on 2017/8/3.
//  Copyright © 2017年 halohily. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIWebView (Jianshu)
//将此webview的UI设置为简书风格（和VC分离，此处可单独设置不同风格的UI）
- (void)setupJianshuUI;
- (NSString *)getPageTitle;

@end
