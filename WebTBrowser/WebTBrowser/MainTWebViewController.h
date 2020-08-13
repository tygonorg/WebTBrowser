//
//  MainTWebViewController.h
//  WebTBrowser
//
//  Created by Hung Tran on 8/13/20.
//  Copyright © 2020 Tran Phuoc Hung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabsView.h"
NS_ASSUME_NONNULL_BEGIN

@interface MainTWebViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *ui_scroll;
@property (weak, nonatomic) IBOutlet UIView *ui_content;
- (IBAction)addTabs:(id)sender;

@end

NS_ASSUME_NONNULL_END
