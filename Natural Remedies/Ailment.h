//
//  Ailment.h
//  Natural Remedies
//
//  Created by Emiko Clark on 10/28/16.
//  Copyright © 2016 Emiko Clark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Remedy.h"

@interface Ailment : NSObject

@property (nonatomic, weak) NSString *ailmentName;
@property (nonatomic, weak) NSString *ailmentDescription;
@property (nonatomic, retain) NSMutableArray <Remedy *> *remedyList;

- (id) initWithName:(NSString*)ailmentName andDescription: (NSString*)ailmentDescription;
@end
