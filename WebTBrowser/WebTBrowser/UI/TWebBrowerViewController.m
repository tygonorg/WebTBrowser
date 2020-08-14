//
//  TWebBrowerViewController.m
//  WebTBrowser
//
//  Created by Tran Hung on 8/13/20.
//  Copyright © 2020 Tran Phuoc Hung. All rights reserved.
//

#import "TWebBrowerViewController.h"

@interface TWebBrowerViewController ()

@end

@implementation TWebBrowerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:theConfiguration];
    self.uiwebview.navigationDelegate = self;
    NSURL *nsurl=[NSURL URLWithString:@"https://www.google.com/"];
    NSURLRequest *nsrquest=[NSURLRequest requestWithURL:nsurl];
    [self.uiwebview loadRequest:nsrquest];
    // Do any additional setup after loading the view from its nib.
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    if(self.tabdelegate!=nil){
        [self.tabdelegate SetTitle:webView.title];
    }
    if(self.maindelegate!=nil){
        [self.maindelegate setUrl:webView.URL.absoluteString];
    }
}
- (void) changeTab:(NSInteger) tabIndex{
    
}
@end
