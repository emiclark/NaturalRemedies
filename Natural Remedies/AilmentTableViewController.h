//
//  AilmentTableViewController.h
//  Natural Remedies
//
//  Created by Emiko Clark on 10/14/16.
//  Copyright © 2016 Emiko Clark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RemedyListTableViewController.h"
#import "editAilmentViewController.h"
#import "DAO.h"

@class editAilmentViewController;

@interface AilmentTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) DAO *dao;
@property (nonatomic, strong) RemedyListTableViewController *remedyListVC;
@property (nonatomic, strong) editAilmentViewController *editAilmentVC;
@property (strong, nonatomic) IBOutlet UITableView *ailmentTableView;

- (void ) addButtonTapped: (id) sender;


@end
