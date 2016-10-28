//
//  editAilmentViewController.h
//  Natural Remedies
//
//  Created by Emiko Clark on 10/24/16.
//  Copyright © 2016 Emiko Clark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AilmentTableViewController.h"
#import "DAO.h"
#import "Ailment.h"

@class AilmentTableViewController;

@interface editAilmentViewController : UIViewController

@property (nonatomic, retain) DAO *dao;
@property (nonatomic,retain) AilmentTableViewController *ailmentTVC;

@property (weak, nonatomic) IBOutlet UITextField *ailmentNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *ailmentDescriptionLabel;

@end
