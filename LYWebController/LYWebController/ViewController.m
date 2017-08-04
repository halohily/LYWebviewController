//
//  ViewController.m
//  LYWebController
//
//  Created by 刘毅 on 2017/8/3.
//  Copyright © 2017年 halohily. All rights reserved.
//

#import "ViewController.h"
#import "LYWebViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 100, self.view.frame.size.height/2 - 75, 200, 50)];
    [btn setTitle:@"进入webVC" forState:UIControlStateNormal];
//    116,146,113 简书色
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = UIColor(116, 146, 113);
    btn.layer.cornerRadius = 5.0;
    btn.layer.masksToBounds = YES;
    
    [btn addTarget:self action:@selector(goNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
//    http://www.jianshu.com/u/deeea9e09cbc?utm_medium=note-author-link&amp;utm_source=mobile"
//    简书文章中作者头像的链接
    
//    一段判断是否是头像链接的代码
    
//    NSURL *url = [NSURL URLWithString:@"http://www.jianshu.com/u/deeea9e09cbc?utm_medium=note-author-link&amp;utm_source=mobile"];
//    NSString *query = url.query;
//    NSLog(@"url query: %@",query);
////    utm_medium=note-author-link&amp;utm_source=mobile
//    if ([query containsString:@"utm_medium=note-author-link"]){
//        NSLog(@"is avator link");
//    }
//    else{
//        NSLog(@"not avator link");
//    }
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goNext
{
    LYWebViewController *LYWebVC = [[LYWebViewController alloc] init];
    [self.navigationController pushViewController:LYWebVC animated:YES];
}
@end
