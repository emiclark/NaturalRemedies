//
//  RemedyListTableViewController.h
//  Natural Remedies
//
//  Created by Emiko Clark on 10/18/16.
//  Copyright © 2016 Emiko Clark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"
#import "editRemedyViewController.h"
#import "Remedy.h"
#import "DAO.h"

@class editRemedyViewController;

@interface RemedyListTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain) NSMutableArray <Remedy*> *remedyList;
@property (nonatomic, retain) DAO *dao;

@property (nonatomic, retain) editRemedyViewController *editRemedyVC;
@property (nonatomic, strong) IBOutlet UITableView *remedyTV;
@property (nonatomic, strong) WebViewController *webView;

- (void) addButtonTapped: (id) sender;
@end
