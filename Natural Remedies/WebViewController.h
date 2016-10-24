//
//  WebViewController.h
//  Natural Remedies
//
//  Created by Emiko Clark on 10/21/16.
//  Copyright © 2016 Emiko Clark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebKit/Webkit.h"

@interface WebViewController : UIViewController <WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) NSURL *url;

@end
