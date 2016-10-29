//
//  RemedyListTableViewController.m
//  Natural Remedies
//
//  Created by Emiko Clark on 10/18/16.
//  Copyright © 2016 Emiko Clark. All rights reserved.
//

#import "RemedyListTableViewController.h"
#import "BulletedTableViewCell.h"

@interface RemedyListTableViewController ()

@end

@implementation RemedyListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dao = [DAO sharedManager];
    
    //register TableViewCell xib file and cell identifier for custom cell reuse
    [self.remedyTV registerNib:[UINib nibWithNibName:@"BulletedTableViewCell" bundle:nil] forCellReuseIdentifier:@"myCell"];
    
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0f green:243/255.0f blue:249/255.0f alpha:1.0];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonTapped:)];
     self.navigationItem.rightBarButtonItems = @[addButton, self.editButtonItem];
}

- (void) addButtonTapped: (id) sender {
    NSLog(@"addButtonTapped");
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
    return self.remedyList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BulletedTableViewCell *cell = (BulletedTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.nameLabel.text = self.remedyList[indexPath.row].remedyName;
    cell.descriptionLabel.text = [self.remedyList objectAtIndex:indexPath.row].remedyDescription;
    
    if ([self.remedyList[indexPath.row].remedyType isEqualToString:@"Meditation"]) {
        cell.bullet.image = [UIImage imageNamed: @"meditation.png"];
    }
    else if ([self.remedyList[indexPath.row].remedyType isEqualToString:@"Yoga"]) {
        cell.bullet.image = [UIImage imageNamed:@"yoga.png"];
    }
    else if ([self.remedyList[indexPath.row].remedyType isEqualToString:@"Herb"]) {
        cell.bullet.image = [UIImage imageNamed:@"herb.png"];
    }
    else if ([self.remedyList[indexPath.row].remedyType isEqualToString:@"Supplement"]) {
        cell.bullet.image = [UIImage imageNamed:@"capsule.png"];
    }
    

    return cell;
}

 
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.remedyList removeObjectAtIndex: indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    [tableView reloadData];
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    Remedy *objectToMove = [self.remedyList objectAtIndex:fromIndexPath.row];
    [self.remedyList removeObjectAtIndex:fromIndexPath.row];
    [self.remedyList insertObject:objectToMove atIndex:toIndexPath.row];
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Create the next view controller.
    WebViewController *webVC = [[WebViewController alloc] initWithNibName:@"WebViewController" bundle:nil];
    
    // Pass the selected object to the new view controller.
    webVC.url = [NSURL URLWithString: self.remedyList[indexPath.row].remedyURL];
    webVC.title = self.remedyList[indexPath.row].remedyName;
    
    // Push the view controller.
    [self.navigationController pushViewController:webVC animated:YES];
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

