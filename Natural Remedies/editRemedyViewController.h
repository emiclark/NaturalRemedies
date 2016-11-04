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

@property (nonatomic, retain) DAO *dao;
@property (nonatomic, retain)  NSMutableArray <Remedy*> *remedyList;
@property (nonatomic, retain) Remedy *remedy;
@property (nonatomic) BOOL isEditMode;

@property (nonatomic, strong) IBOutlet UITextField *remedyName;
@property (nonatomic, strong) IBOutlet UITextField *remedyDescription;
@property (nonatomic, strong) IBOutlet UITextField *remedyURL;
@property (nonatomic)         IBOutlet UISegmentedControl *remedyTypeSC;

- (void) saveButtonTapped: (id*)sender;
- (void) cancelButtonTapped: (id*)sender;
@end
