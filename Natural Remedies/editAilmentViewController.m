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
    
    self.navigationItem.rightBarButtonItems = @[cancelButton, saveButton];
}

#pragma mark Buttons Tapped

-(void) saveButtonTapped: (id) sender {
    NSLog(@"saveButtonTapped");
    self.ailmentTVC = [[AilmentTableViewController alloc] init];
    
    // add new ailment and description to data array
    Ailment *ailment = [[Ailment alloc]initWithName:self.ailmentNameLabel.text andDescription:self.ailmentDescriptionLabel.text];
    [self.dao.ailmentList addObject:ailment];
    
    
    //pop to root viewcontroller
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) cancelButtonTapped: (id) sender {
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
