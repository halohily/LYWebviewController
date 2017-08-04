//
//  UIWebView+Jianshu.m
//  LYWebController
//
//  Created by 刘毅 on 2017/8/3.
//  Copyright © 2017年 halohily. All rights reserved.
//

#import "UIWebView+Jianshu.h"

@implementation UIWebView (Jianshu)

- (void)setupJianshuUI
{
    self.backgroundColor = [UIColor whiteColor];
}

- (NSString *)getPageTitle
{
    return [self stringByEvaluatingJavaScriptFromString:@"document.title"];
}

- (void)scrollToCommentField
{
    [self stringByEvaluatingJavaScriptFromString:@""];
}
@end
