//
//  ViewController.m
//  WebTBrowser
//
//  Created by Hung Tran on 8/13/20.
//  Copyright © 2020 Tran Phuoc Hung. All rights reserved.
//

#import "ViewController.h"
#import "MainTWebViewController.h"
@interface ViewController ()

@end

@implementation ViewController
- (IBAction)open_webview:(id)sender {
    MainTWebViewController *controller = [[MainTWebViewController alloc] initWithNibName:@"MainTWebViewController" bundle:nil];
    [self presentViewController:controller animated:YES completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
