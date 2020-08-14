//
//  TabsView.h
//  WebTBrowser
//
//  Created by Hung Tran on 8/13/20.
//  Copyright © 2020 Tran Phuoc Hung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBrowerDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface TabsView : UIView<TabDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btn_close;
- (IBAction)close:(id)sender;
- (void) setActive:(bool) active;
@property (strong, nonatomic) IBOutlet UIView *contentview;
@property (weak, nonatomic) IBOutlet UILabel *lbl_titles;
@property (nonatomic,retain) id<MainControlDelegate> maindelegate;
@property NSInteger TabIndex;
@end

NS_ASSUME_NONNULL_END
