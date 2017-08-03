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
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(200, 200, 50, 50)];
    btn.titleLabel.text = @"点击";
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(goNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    NSURL *url = [NSURL URLWithString:@"http://www.jianshu.com/u/deeea9e09cbc?utm_medium=note-author-link&amp;utm_source=mobile"];
    NSString *query = url.query;
    NSLog(@"url query: %@",query);
//    utm_medium=note-author-link&amp;utm_source=mobile
    if ([query containsString:@"utm_medium=note-author-link"]){
        NSLog(@"is avator link");
    }
    else{
        NSLog(@"not avator link");
    }
    
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
