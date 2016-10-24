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
    
    self.ailmentArray = [[NSMutableArray alloc] initWithObjects:@"Stress Reduction", @"Focus and Study", @"Relaxation and Sleep", nil];
    
    self.ailmentDescriptionArray = [[NSMutableArray alloc] initWithObjects:@"Adaptogens", @"Cognitive support, memory retention", @"Quieting racing thoughts, Insomnia", nil];
    
    [self.ailmentTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [self.ailmentTableView setSeparatorColor:[UIColor lightGrayColor]];
    
    //register TableViewCell xib file and cell identifier for custom cell reuse
    [self.ailmentTableView registerNib:[UINib nibWithNibName:@"BulletedTableViewCell" bundle:nil] forCellReuseIdentifier:@"myCell"];

    
    NSLog(@"%@ - %@",self.ailmentArray, self.ailmentDescriptionArray);
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (self.ailmentArray.count);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //create the cell from xib file
    BulletedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath ];
    
    //format and display information for the cell
    cell.nameLabel.text = [self.ailmentArray objectAtIndex:indexPath.row];
    cell.descriptionLabel.text = [self.ailmentDescriptionArray objectAtIndex:indexPath.row];
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
    
    NSLog(@"%@ - %@",[self.ailmentArray objectAtIndex:indexPath.row], [self.ailmentDescriptionArray objectAtIndex: indexPath.row]);
    
    
    // create view controller object for remedy view controller
    self.remedyListVC = [[RemedyListTableViewController alloc] initWithNibName:@"RemedyListTableViewController" bundle:nil];
    self.remedyListVC.title = self.ailmentArray[indexPath.row];
    
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
