//
//  Ailment.m
//  Natural Remedies
//
//  Created by Emiko Clark on 10/28/16.
//  Copyright © 2016 Emiko Clark. All rights reserved.
//

#import "Ailment.h"

@implementation Ailment

- (id) initWithName:(NSString*)ailmentName andDescription: (NSString*)ailmentDescription {
    self = [super init];
    if (self) {
        self.ailmentName = ailmentName;
        self.ailmentDescription = ailmentDescription;
        self.remedyList = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSString * ) description {
    return [NSString stringWithFormat:@"ailment: %@ - %@", self.ailmentName, self.ailmentDescription ];
}

@end
