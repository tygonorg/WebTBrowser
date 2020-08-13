//
//  MainTWebViewController.m
//  WebTBrowser
//
//  Created by Hung Tran on 8/13/20.
//  Copyright © 2020 Tran Phuoc Hung. All rights reserved.
//

#import "MainTWebViewController.h"
#import "TabsConfig.h"
@interface MainTWebViewController ()
{
    NSMutableArray *lst;
    CGFloat H;
    CGFloat W;
}
@end

@implementation MainTWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    lst = [[NSMutableArray alloc] init];
    H = self.ui_scroll.frame.size.height;
    W = self.ui_scroll.frame.size.width;
    self.ui_scroll.contentSize = CGSizeMake(W,H);
    // Do any additional setup after loading the view from its nib.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
//-(CGFloat) getW{
//    CGFloat w = SPACE_OF_TAB;
//    for (TabsView *object in lst) {
//        w = w + WID
//    }
//    return w;
//}

- (IBAction)addTabs:(id)sender {
  
    //if(lst.count == 0){
    TabsView *tabview = [[TabsView alloc] initWithFrame:CGRectMake((lst.count+1)*SPACE_OF_TAB+(lst.count)*TAB_WIDTH , 0, TAB_WIDTH, 50)];
    [lst addObject:tabview];
    [self.ui_scroll addSubview:tabview];
    W = self.ui_scroll.frame.size.width>(lst.count+1)*SPACE_OF_TAB+(lst.count)*TAB_WIDTH?self.ui_scroll.frame.size.width:(lst.count+1)*SPACE_OF_TAB+(lst.count)*TAB_WIDTH;
      self.ui_scroll.contentSize = CGSizeMake(W,H);
    NSLog(@"OFFSET %f",(W - SPACE_OF_TAB - TAB_WIDTH )<=0?0:(W - SPACE_OF_TAB - TAB_WIDTH));
    [self.ui_scroll setContentOffset:CGPointMake((W - (lst.count+1)*SPACE_OF_TAB - (lst.count)*TAB_WIDTH )<=0?0:(W - SPACE_OF_TAB - TAB_WIDTH) , 0)];
    [self.ui_scroll layoutIfNeeded];
    
    //    } else {
    //        TabsView *tabview = [[TabsView alloc] initWithFrame:CGRectMake(SPACE_OF_TAB+ (lst.count)*TAB_WIDTH + SPACE_OF_TAB , 0, TAB_WIDTH, 50)];
    //        [lst addObject:tabview];
    //        [self.ui_scroll addSubview:tabview];
    //    }
}
@end
