//
//  MainTWebViewController.m
//  WebTBrowser
//
//  Created by Hung Tran on 8/13/20.
//  Copyright © 2020 Tran Phuoc Hung. All rights reserved.
//

#import "MainTWebViewController.h"
#import "TabsConfig.h"
#import "TWebBrowerViewController.h"
@interface MainTWebViewController ()
{
    NSMutableArray *lst;
    NSMutableArray *lstweb;
    CGFloat H;
    CGFloat W;
    NSInteger currentTab;
}
@end

@implementation MainTWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    lst = [[NSMutableArray alloc] init];
    lstweb = [[NSMutableArray alloc] init];
    H = self.ui_scroll.frame.size.height;
    W = self.ui_scroll.frame.size.width;
    self.ui_scroll.contentSize = CGSizeMake(W,H);
    currentTab = 0;
    [self addTabs:self];
    [self changeTab:currentTab];
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
- (void) UpdateTabs{
    for (int i=0; i<lst.count; i++) {
        TabsView *tabview = [lst objectAtIndex:i];
        if(i==currentTab){
            [tabview setActive:TRUE];
        } else {
            [tabview setActive:FALSE];
        }
        tabview.TabIndex = i;
        tabview.frame = CGRectMake((i+1)*SPACE_OF_TAB+(i)*TAB_WIDTH, 0, tabview.frame.size.width, tabview.frame.size.height);
        TWebBrowerViewController *webview = [lstweb objectAtIndex:i];

        webview.TabIndex = i;
    }
    W = (lst.count)*SPACE_OF_TAB+(lst.count)*TAB_WIDTH;
    self.ui_scroll.contentSize = CGSizeMake(W,H);
//    [self.ui_scroll setContentOffset:CGPointMake(W<self.ui_scroll.bounds.size.width?0: self.ui_scroll.contentSize.width - self.ui_scroll.bounds.size.width+self.ui_scroll.contentInset.right , 0)];
       [self.ui_scroll layoutIfNeeded];
    [self changeTab:currentTab];
}

- (IBAction)addTabs:(id)sender {
    
    //if(lst.count == 0){
    TabsView *tabview = [[TabsView alloc] initWithFrame:CGRectMake((lst.count+1)*SPACE_OF_TAB+(lst.count)*TAB_WIDTH , 0, TAB_WIDTH, H)];
    tabview.maindelegate = self;
    tabview.TabIndex = lst.count;
    
   
    tabview.lbl_titles.text = [NSString stringWithFormat:@"Tab %lu",(unsigned long)lst.count];
    [self.ui_scroll addSubview:tabview];
    W = (lst.count+1)*SPACE_OF_TAB+(lst.count+1)*TAB_WIDTH;
    NSLog(@"W: %f",W);
    
    self.ui_scroll.contentSize = CGSizeMake(W,H);
    //[self.ui_scroll scrollRectToVisible:CGRectMake(W, 0, 1, 1) animated:YES];
    [self.ui_scroll setContentOffset:CGPointMake(W<self.ui_scroll.bounds.size.width?0: self.ui_scroll.contentSize.width - self.ui_scroll.bounds.size.width+self.ui_scroll.contentInset.right , 0)];
//    [self.ui_scroll layoutIfNeeded];
    
    TWebBrowerViewController *webview = [[TWebBrowerViewController alloc] initWithNibName:@"TWebBrowerViewController" bundle:nil] ;
    webview.tabdelegate =tabview;
    webview.maindelegate = self;
    webview.TabIndex = lst.count;
    
    [webview willMoveToParentViewController:self];

    [self.ui_content addSubview:webview.view];

    [self addChildViewController:webview];
    [webview didMoveToParentViewController:self];
    for (TabsView *item in lst) {
        [item setActive:NO];
    }
    [tabview setActive:TRUE];
    currentTab = lst.count;
     [lst addObject:tabview];
     [lstweb addObject:webview];
}
#pragma mark MainControlDelegate
- (void) setUrl:(NSString*) url{
    self.txt_url.text = url;
}
- (void) closeTab:(NSInteger) tabIndex{
    TabsView *tabview = [lst objectAtIndex:tabIndex];
    // close lastest tab
    if(tabIndex == (lst.count-1)){
        currentTab = tabIndex -1;
    }
    if(tabIndex!= currentTab){
        currentTab = currentTab -1;
    }
     [tabview removeFromSuperview];
    TWebBrowerViewController *webview = [lstweb objectAtIndex:tabIndex];
    [webview.view removeFromSuperview];
    [webview removeFromParentViewController];
    [lst removeObjectAtIndex:tabIndex];
    [lstweb removeObjectAtIndex:tabIndex];
     [self UpdateTabs];
   // [webview dismissViewControllerAnimated:true completion:nil];
}
- (void) changeTab:(NSInteger) tabIndex{
    NSLog(@"Change tab : %ld",(long)tabIndex);
    currentTab = tabIndex;
    for (int i=0; i<lst.count; i++) {
        TabsView *tabview = [lst objectAtIndex:i];
               if(i==currentTab){
                   [tabview setActive:TRUE];
                   
               } else {
                   [tabview setActive:FALSE];
                   TWebBrowerViewController *webview = [lstweb objectAtIndex:i];
                   [self.ui_content sendSubviewToBack:webview.view];
               }
       
    }
   
}
@end
