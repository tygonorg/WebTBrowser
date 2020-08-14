//
//  TBrowerDelegate.h
//  WebTBrowser
//
//  Created by Tran Hung on 8/13/20.
//  Copyright © 2020 Tran Phuoc Hung. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol TabDelegate <NSObject>
- (void) SetTitle:(NSString*) title;
@end
@protocol MainControlDelegate <NSObject>
- (void) setUrl:(NSString*) url;
- (void) closeTab:(NSInteger) tabIndex;
- (void) changeTab:(NSInteger) tabIndex;

@end
NS_ASSUME_NONNULL_END
