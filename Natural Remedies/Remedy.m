//
//  Remedy.m
//  Natural Remedies
//
//  Created by Emiko Clark on 10/28/16.
//  Copyright © 2016 Emiko Clark. All rights reserved.
//

#import "Remedy.h"

@implementation Remedy

- (id)initWithName: (NSString *)remedyName andDescription: (NSString *)remedyDescription andType: (NSString*) remedyType andURL: (NSString*)remedyURL {
    self=[super init];
    if (self) {
        self.remedyName = remedyName;
        self.remedyDescription = remedyDescription;
        self.remedyType = remedyType;
        self.remedyURL = remedyURL;
    }
    return  self;
}

- (NSString *) description {
    return [NSString stringWithFormat:@"remedy: %@ - %@, %@, %@",self.remedyName, self.remedyDescription, self.remedyType, self.remedyURL];
}

@end
