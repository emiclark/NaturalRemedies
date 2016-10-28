//
//  AilmentTableViewController.m
//  Natural Remedies
//
//  Created by Emiko Clark on 10/14/16.
//  Copyright © 2016 Emiko Clark. All rights reserved.
//

#import "AilmentTableViewController.h"
#import "BulletedTableViewCell.h"

@interface AilmentTableViewController ()

@end

@implementation AilmentTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dao = [DAO sharedManager];
    
    [self.ailmentTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [self.ailmentTableView setSeparatorColor:[UIColor lightGrayColor]];
    
    //register TableViewCell xib file and cell identifier for custom cell reuse
    [self.ailmentTableView registerNib:[UINib nibWithNibName:@"BulletedTableViewCell" bundle:nil] forCellReuseIdentifier:@"myCell"];

    NSLog(@"%@",self.dao.ailmentList);
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonTapped:)];
     self.navigationItem.rightBarButtonItems = @[addButton, self.editButtonItem];
}

- (void) viewWillAppear:(BOOL)animated {
    [self.ailmentTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Buttons Tapped

- (void ) addButtonTapped: (id) sender {
    NSLog(@"addButtonTapped ");
    self.editAilmentVC = [[editAilmentViewController alloc] initWithNibName:@"editAilmentViewController" bundle:nil];
    
    self.editAilmentVC.title = @"Add New Ailment";
    [self.navigationController pushViewController:self.editAilmentVC animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (self.dao.ailmentList.count);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //create the cell from xib file
    BulletedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath ];
    
    //format and display information for the cell
    cell.nameLabel.text = [self.dao.ailmentList objectAtIndex:indexPath.row].ailmentName;
    cell.descriptionLabel.text = [self.dao.ailmentList objectAtIndex:indexPath.row].ailmentDescription;
    return cell;
        
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // create view controller object for remedy view controller
    self.remedyListVC = [[RemedyListTableViewController alloc] initWithNibName:@"RemedyListTableViewController" bundle:nil];
    self.remedyListVC.title = self.dao.ailmentList[indexPath.row].ailmentName;
    self.remedyListVC.remedyList = self.dao.ailmentList[indexPath.row].remedyList;
    
    // Push the view controller.
    [self.navigationController pushViewController: self.remedyListVC animated:YES];
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
