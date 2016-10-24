//
//  RemedyListTableViewController.h
//  Natural Remedies
//
//  Created by Emiko Clark on 10/18/16.
//  Copyright © 2016 Emiko Clark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"

@interface RemedyListTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray *remedyArray;
@property (nonatomic, strong) NSArray *remedyDescriptionArray;
@property (nonatomic, strong) NSArray *urlArray;
@property (nonatomic, strong) NSString *remedyViewTitle;


@property (nonatomic, strong) IBOutlet UITableView *remedyTV;
@property (nonatomic, strong) WebViewController *webView;

@end
