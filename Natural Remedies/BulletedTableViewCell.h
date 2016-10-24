//
//  BulletedTableViewCell.h
//  Natural Remedies
//
//  Created by Emiko Clark on 10/21/16.
//  Copyright © 2016 Emiko Clark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BulletedTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bullet;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end
