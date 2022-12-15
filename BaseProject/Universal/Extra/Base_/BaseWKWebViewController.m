//
//  BaseWKWebViewController.m
//  BaseProject
//
//  Created by dc on 2022/3/21.
//  Copyright © 2022 nanfeng. All rights reserved.
//

#import "BaseWKWebViewController.h"
#import <WebKit/WebKit.h>

@interface BaseWKWebViewController ()<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>

@property(nonatomic,strong)WKWebView * webView;

@property(nonatomic, strong)UIProgressView *progressView;

@end

@implementation BaseWKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
//    [configuration.userContentController addScriptMessageHandler:self name:@"nb_callTaoBaoByUrl"];
//    [configuration.userContentController addScriptMessageHandler:self name:@"getUserInfo"];
//    [configuration.userContentController addScriptMessageHandler:self name:@"startShare"];
//    [configuration.userContentController addScriptMessageHandler:self name:@"startPay"];
    _webView = [[WKWebView alloc]initWithFrame:self.view.bounds configuration:configuration];
    _webView.navigationDelegate = self;
    _webView.UIDelegate = self;
    _webView.allowsBackForwardNavigationGestures = NO;
    _webView.scrollView.showsVerticalScrollIndicator = NO;
    _webView.scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_webView];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.tfhlnet.com/file/testData.html"]]];
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.mas_equalTo(0);
        make.bottom.mas_equalTo(-49-SafeAreaBottomHeight);
    }];
    [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:NULL];

    //进度条
    _progressView = [[UIProgressView alloc] initWithFrame:CGRectZero];
    _progressView.progressTintColor = kColorWithHex(0x000000);
    _progressView.trackTintColor = [UIColor whiteColor];
    [self.view addSubview:_progressView];
    [_progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.mas_equalTo(0);
        make.height.mas_equalTo(2);
    }];

}
#pragma mark- WebViewDelegate
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    //self.errorView.hidden = NO;
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {

}

- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation{
//    _goBtn.enabled = webView.canGoForward;
//    _backBtn.enabled = webView.canGoBack;
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
//    _goBtn.enabled = webView.canGoForward;
//    _backBtn.enabled = webView.canGoBack;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        if (object == _webView) {
            [_progressView setProgress:_webView.estimatedProgress animated:YES];
            if(_webView.estimatedProgress >= 1.0f) {
                [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    [_progressView setAlpha:0.0f];
                } completion:^(BOOL finished) {
                    [_progressView setProgress:0.0f animated:NO];
                }];
            }
            else{
                [_progressView setAlpha:1.0f];
            }
        }
    }
}

//iOS端 wkwebview代理方法
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
   if ([navigationAction.request.URL.absoluteString isEqualToString:@"xc://scan"]) {
        //调用原生扫描二维码
        decisionHandler(WKNavigationActionPolicyCancel);
        return;
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}
#pragma mark- h5调用原生方法
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    if ([message.name isEqualToString:@"getUserInfo"]){
        //获取用户信息{"serverID":"HD001"}
        NSString *bodyStr = message.body;
        if (!kStringIsEmpty(bodyStr)) {
            NSDictionary *dic = [NSString dictionaryWithJsonString:bodyStr];
//            [self nb_getUserInfo:dic[@"serverID"]];
        }
        else{
//            [kKeyWindow showMessage:@"参数错误"];
        }
    }
    else if ([message.name isEqualToString:@"startShare"]){
      
    }
    else if ([message.name isEqualToString:@"startPay"]){
        
    }
}

@end
