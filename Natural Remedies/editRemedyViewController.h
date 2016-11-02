//
//  editRemedyViewController.h
//  Natural Remedies
//
//  Created by Emiko Clark on 11/1/16.
//  Copyright © 2016 Emiko Clark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RemedyListTableViewController.h"
#import "DAO.h"

@interface editRemedyViewController : UIViewController

@property  (retain, nonatomic) DAO *dao;
@property (weak, nonatomic)  NSMutableArray <Remedy*> *remedyList;

@property (weak, nonatomic) IBOutlet UITextField *remedyName;
@property (weak, nonatomic) IBOutlet UITextField *remedyDescription;
@property (weak, nonatomic) IBOutlet UITextField *remedyURL;
@property (weak, nonatomic) IBOutlet UISegmentedControl *remedyType;


- (void) saveButtonTapped: (id*)sender;
- (void) cancelButtonTapped: (id*)sender;
@end
