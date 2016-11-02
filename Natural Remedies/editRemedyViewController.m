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

- (void) saveButtonTapped: (id*)sender {
    
    NSString *type;
    
    if (self.remedyType.selectedSegmentIndex == 0 ) {
        type = @"Herb";
    }
    else if (self.remedyType.selectedSegmentIndex == 1 ) {
        type = @"Supplement";
    }
    else if (self.remedyType.selectedSegmentIndex == 2 ) {
        type = @"Yoga";
    }
    else if (self.remedyType.selectedSegmentIndex == 3 ) {
        type = @"Body and Movement";
    }
    
    
    //
    
    Remedy *newRemedy = [[Remedy alloc] initWithName:self.remedyName.text andDescription:self.remedyDescription.text andType: type  andURL:self.remedyURL.text];
    
    
    [self.remedyList addObject: newRemedy];
    
    NSLog(@"%@",self.remedyList);
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
