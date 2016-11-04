//
//  Remedy.h
//  Natural Remedies
//
//  Created by Emiko Clark on 10/28/16.
//  Copyright © 2016 Emiko Clark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Remedy : NSObject
@property (nonatomic, retain) NSString *remedyName;
@property (nonatomic, retain) NSString *remedyDescription;
@property (nonatomic, retain) NSString *remedyType;
@property (nonatomic, retain) NSString *remedyURL;


- (id)initWithName: (NSString *)remedyName andDescription: (NSString *)remedyDescription andType: (NSString*) remedyType andURL: (NSString*)remedyURL;
@end
