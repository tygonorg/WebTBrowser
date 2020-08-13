//
//  TabsView.h
//  WebTBrowser
//
//  Created by Hung Tran on 8/13/20.
//  Copyright © 2020 Tran Phuoc Hung. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TabsView : UIView
@property (weak, nonatomic) IBOutlet UIButton *btn_close;
- (IBAction)close:(id)sender;
- (void) install;
@property (strong, nonatomic) IBOutlet UIView *contentview;

@end

NS_ASSUME_NONNULL_END
