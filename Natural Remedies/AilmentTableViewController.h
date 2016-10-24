//
//  AilmentTableViewController.h
//  Natural Remedies
//
//  Created by Emiko Clark on 10/14/16.
//  Copyright © 2016 Emiko Clark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RemedyListTableViewController.h"

@interface AilmentTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *ailmentArray;
@property (nonatomic, strong) NSMutableArray *ailmentDescriptionArray;

@property (nonatomic, strong) RemedyListTableViewController *remedyListVC;

@property (strong, nonatomic) IBOutlet UITableView *ailmentTableView;



@end
