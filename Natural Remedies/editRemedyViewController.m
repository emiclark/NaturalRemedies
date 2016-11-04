//
//  editRemedyViewController.m
//  Natural Remedies
//
//  Created by Emiko Clark on 11/1/16.
//  Copyright © 2016 Emiko Clark. All rights reserved.
//

#import "editRemedyViewController.h"

@interface editRemedyViewController ()

@end

@implementation editRemedyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dao = [DAO sharedManager];
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonTapped:)];
    UIBarButtonItem * cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonTapped:)];
    
    self.navigationItem.rightBarButtonItems = @[saveButton, cancelButton];
    
    // Do any additional setup after loading the view from its nib.
}

- (void) viewWillAppear:(BOOL)animated {
    
    // in add mode
    if (self.remedy == NULL) {
        self.title = @"Add New Remedy";
    }
    //in edit mode
    else {
        self.remedyName.text = self.remedy.remedyName;
        self.remedyDescription.text = self.remedy.remedyDescription;
        self.remedyURL.text = self.remedy.remedyURL;
        
        if ([self.remedy.remedyType isEqual:@"Herb"]) {
            self.remedyTypeSC.selectedSegmentIndex = 0;
        }
        else if ([self.remedy.remedyType isEqual:@"Supplement"]) {
            self.remedyTypeSC.selectedSegmentIndex = 1;
        }
        else if ([self.remedy.remedyType isEqual:@"Meditation"]) {
            self.remedyTypeSC.selectedSegmentIndex = 2;
        }
        else if ([self.remedy.remedyType isEqual:@"Body"]) {
            self.remedyTypeSC.selectedSegmentIndex = 3;
        }
    }
    
}

- (void) saveButtonTapped: (id*)sender {
    
    // check remedyType
    NSString *type;
    
    if (self.remedyTypeSC.selectedSegmentIndex == 0 ) {
        type = @"Herb";
    } else if (self.remedyTypeSC.selectedSegmentIndex == 1 ) {
        type = @"Supplement";
    } else if (self.remedyTypeSC.selectedSegmentIndex == 2 ) {
        type = @"Meditation";
    } else if (self.remedyTypeSC.selectedSegmentIndex == 3 ) {
        type = @"Body";
    }
    // in edit mode: update remedy
    if (self.isEditMode == YES) {
        self.remedy.remedyName = self.remedyName.text;
        self.remedy.remedyDescription = self.remedyDescription.text;
        self.remedy.remedyType = type;
        self.remedy.remedyURL = self.remedyURL.text;
        self.isEditMode = NO;
    }
    // in add mode: add new remedy
    else {
        Remedy *newRemedy = [[Remedy alloc] initWithName:self.remedyName.text andDescription:self.remedyDescription.text andType:type andURL: self.remedyURL.text];
        [self.remedyList addObject:newRemedy];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) cancelButtonTapped: (id*)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
