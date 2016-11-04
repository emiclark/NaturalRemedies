//
//  editAilmentViewController.m
//  Natural Remedies
//
//  Created by Emiko Clark on 10/24/16.
//  Copyright © 2016 Emiko Clark. All rights reserved.
//

#import "editAilmentViewController.h"

@interface editAilmentViewController ()

@end

@implementation editAilmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dao = [DAO sharedManager];
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonTapped:)];
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonTapped:)];
    
    self.navigationItem.rightBarButtonItems = @[saveButton, cancelButton];
}

- (void) viewWillAppear:(BOOL)animated {
    // check if edit or add mode by checking if ailment is NULL
    if (self.ailment == NULL) {
        // in add mode
        self.title = @"Add New Ailment";
    }
    else {
        //in edit mode
        self.ailmentNameLabel.text = self.ailment.ailmentName;
        self.ailmentDescriptionLabel.text = self.ailment.ailmentDescription;
    }
}

#pragma mark Buttons Tapped

-(void) saveButtonTapped: (id) sender {
    // in edit mode, update ailment
    if (self.isEditMode == YES) {
        self.ailment.ailmentName = self.ailmentNameLabel.text;
        self.ailment.ailmentDescription = self.ailmentDescriptionLabel.text;
        self.isEditMode = NO;
    }
    //in add mode, add ailment
    else {
        Ailment *addAilment = [[Ailment alloc] initWithName:self.ailmentNameLabel.text andDescription:self.ailmentDescriptionLabel.text];
        [self.dao.ailmentList addObject: addAilment];
    }
    
    //pop to root viewcontroller
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) cancelButtonTapped: (id) sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark Misc Methods

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
