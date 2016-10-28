//
//  DAO.h
//  Natural Remedies
//
//  Created by Emiko Clark on 10/28/16.
//  Copyright © 2016 Emiko Clark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ailment.h"
#import "Remedy.h"

@interface DAO : NSObject

@property (nonatomic, retain) NSMutableArray <Ailment *> *ailmentList;

+ (id) sharedManager;
- (void) methodToInstantiate;

@end
