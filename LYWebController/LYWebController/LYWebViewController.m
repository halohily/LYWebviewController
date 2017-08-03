//
//  LYWebViewController.m
//  LYWebController
//
//  Created by 刘毅 on 2017/8/3.
//  Copyright © 2017年 halohily. All rights reserved.
//

#import "LYWebViewController.h"
#import "UIWebView+Jianshu.h"
#import "AvatorViewController.h"
@interface LYWebViewController ()<UIWebViewDelegate>
{
    NSUInteger pages;
}
//首页的URL
@property (copy) NSURL *URL;
//VC的webview
@property (nonatomic, strong) UIWebView *webview;
//导航栏的返回按钮
@property (nonatomic, strong) UIBarButtonItem *backBtn;
//导航栏的关闭按钮
@property (nonatomic, strong) UIBarButtonItem *closeBtn;

//标记webview一次载入后左侧按钮是否设置完成（因为若为简书效果，本站域名不显示关闭按钮的话，需要根据域名host判断，而每次会有两条request，后一条request为cookies）
@property (nonatomic, assign) BOOL leftBtnSetted;

@end

@implementation LYWebViewController

- (instancetype)initWithURL:(NSURL *)URL
{
    self = [super init];
    self.URL = URL;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewSubs];
//    [self.webview loadRequest:[NSURLRequest requestWithURL:self.URL]];
//    因为模仿简书风格，所以url默认为简书的一篇文章。否则使用注释掉的上一句代码，使用vc初始化时的url
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.jianshu.com/p/a7b0d6c630d3"]]];
    

    // Do any additional setup after loading the view.
}

#pragma mark VC setup
- (void)setupViewSubs
{
//    页面计数器初始化为1
    pages = 1;
    UIWebView *myWebview = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:myWebview];
//    设置webview的个性化UI
    [myWebview setupJianshuUI];
    myWebview.delegate = self;
//    手动设置webview页码计数方式，默认为不计数
    myWebview.paginationMode = UIWebPaginationModeTopToBottom;
    self.webview = myWebview;
    [self showLeftBarButtonItemByRequest:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//导航栏左侧按钮的显示设置
- (void)showLeftBarButtonItemByRequest:(nullable NSURLRequest *)request
{
    if(self.leftBtnSetted)
    {
        return;
    }
//    若为简书域名，则只显示返回按钮
    if ([request.URL.host isEqualToString:@"www.jianshu.com"])
    {
        self.navigationItem.leftBarButtonItems = @[self.backBtn];
        return;
    }
    if (self.webview.canGoBack)
    {
//        若为可返回状态，则显示返回、关闭两个按钮
        self.navigationItem.leftBarButtonItems = @[self.backBtn,self.closeBtn];
    }
    else
    {
//        否则只显示返回按钮
        self.navigationItem.leftBarButtonItems = @[self.backBtn];
    }
    self.leftBtnSetted = YES;
}

#pragma mark private methods
//导航栏返回按钮点击事件
- (void)backBtnClicked
{
//    若为不可返回状态，返回按钮事件为页面退出
    if (!self.webview.canGoBack)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
//    可返回状态下，网页返回到前一页
    self.leftBtnSetted = NO;
    [self.webview goBack];
    pages-=2;
}
/*
导航栏关闭按钮点击事件
因为UIWebview没有提供返回首页的方法，所以这里采用记录页数然后手动返回的方式
连续调用n次goBack方法，运行效果和直接返回到首页肉眼无差，非常神奇，有待探究   TODO：：：why
*/
- (void)closeBtnClicked
{
    for(int i = 0; i < pages; i++)
    {
        if (self.webview.canGoBack)
        {
            [self.webview goBack];
        }
    }
    self.navigationItem.leftBarButtonItems = @[self.backBtn];
}

#pragma mark lazy load
- (UIBarButtonItem *)backBtn
{
    if (!_backBtn)
    {
        UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(backBtnClicked)];
        _backBtn = back;
    }
    return _backBtn;
}

- (UIBarButtonItem *)closeBtn
{
    if (!_closeBtn)
    {
        UIBarButtonItem *close = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(closeBtnClicked)];
        _closeBtn = close;
    }
    return _closeBtn;
}
#pragma mark webview delegate
//webview每次load一个url之前调用，返回是否确定load此链接。在此处利用url的host、query等信息，可作特殊操作处理，比如，跳转至原生页面等
//此方法在调用goBack方法时也会触发
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"the url:::%@",request.URL);
//    页面计数增加
    pages++;
//    设置导航栏左侧按钮
    [self showLeftBarButtonItemByRequest:request];
    
    NSURL *destinationURL = request.URL;
    NSString *URLQuery = destinationURL.query;
//    简书点击文章中头像时跳转至原生页面。此处利用头像链接中的一个参数作判断
    if ([URLQuery containsString:@"utm_medium=note-author-link"])
    {
        NSLog(@"我跳转到个人主页啦");
        AvatorViewController *avatorVC = [[AvatorViewController alloc] init];
        [self.navigationController pushViewController:avatorVC animated:YES];
        return NO;
    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}
//webview页面载入完成时触发。调用goBack也会触发
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *host = webView.request.URL.host;
    //    若为第三方页面，显示title
    if (![host isEqualToString:@"www.jianshu.com"])
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.navigationItem.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
        });
    }
    //    若为简书域名下的页面，不显示title
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.navigationItem.title = NULL;
        });
    }
    
}
@end
