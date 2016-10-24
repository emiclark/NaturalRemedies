//
//  WebViewController.m
//  Natural Remedies
//
//  Created by Emiko Clark on 10/21/16.
//  Copyright © 2016 Emiko Clark. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.frame];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidAppear:(BOOL)animated{
    // get the size of the device
    [super viewDidAppear:animated];
    
    // set size so that content will fit the screen
    CGRect viewframe = self.view.frame;
    self.webView.frame = viewframe;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
