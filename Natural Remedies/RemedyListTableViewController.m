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
    
    self.remedyArray = [[NSArray alloc] initWithObjects:@"Meditation", @"Yoga Breathing", @"Passion Flower", @"GABA", nil];
    
    self.remedyDescriptionArray = [[NSArray alloc] initWithObjects:@"Meditation", @"Yoga", @"Herb", @"Supplement", nil];
    
    self.urlArray = [[NSArray alloc] initWithObjects:@"https://www.gaiam.com/discover/313/article/calming-mind-meditation-exercise/", @"http://www.mindbodygreen.com/0-18608/11-yoga-poses-to-calm-your-mind-invigorate-your-body.html", @"https://en.wikipedia.org/wiki/Passiflora", @"http://www.webmd.com/vitamins-and-supplements/gaba-uses-and-risks", nil];

    //register TableViewCell xib file and cell identifier for custom cell reuse
    [self.remedyTV registerNib:[UINib nibWithNibName:@"BulletedTableViewCell" bundle:nil] forCellReuseIdentifier:@"myCell"];
    
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0f green:243/255.0f blue:249/255.0f alpha:1.0];
    
    
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
    return self.remedyArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BulletedTableViewCell *cell = (BulletedTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.nameLabel.text = self.remedyArray[indexPath.row];
    cell.descriptionLabel.text = [self.remedyDescriptionArray objectAtIndex:indexPath.row];
    if ([self.remedyDescriptionArray[indexPath.row] isEqualToString:@"Meditation"]) {
        cell.bullet.image = [UIImage imageNamed: @"meditation.png"];
    }
    else if ([self.remedyDescriptionArray[indexPath.row] isEqualToString:@"Yoga"]) {
        cell.bullet.image = [UIImage imageNamed:@"yoga.png"];
    }
    else if ([self.remedyDescriptionArray[indexPath.row] isEqualToString:@"Herb"]) {
        cell.bullet.image = [UIImage imageNamed:@"herb.png"];
    }
    else if ([self.remedyDescriptionArray[indexPath.row] isEqualToString:@"Supplement"]) {
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
    
    // Create the next view controller.
    WebViewController *webVC = [[WebViewController alloc] initWithNibName:@"WebViewController" bundle:nil];
    
    // Pass the selected object to the new view controller.
    webVC.url = [NSURL URLWithString: self.urlArray[indexPath.row]];
    webVC.title = self.remedyArray[indexPath.row];
    
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

