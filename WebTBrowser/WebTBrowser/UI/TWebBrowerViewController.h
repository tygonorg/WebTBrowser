//
//  TWebBrowerViewController.h
//  WebTBrowser
//
//  Created by Tran Hung on 8/13/20.
//  Copyright © 2020 Tran Phuoc Hung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "TBrowerDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface TWebBrowerViewController : UIViewController<WKNavigationDelegate>
@property (weak, nonatomic) IBOutlet WKWebView *uiwebview;
@property (nonatomic,retain) id<TabDelegate> tabdelegate;
@property (nonatomic,retain) id<MainControlDelegate> maindelegate;
@property NSInteger TabIndex;
@property NSString *currentUrl;
@end

NS_ASSUME_NONNULL_END
