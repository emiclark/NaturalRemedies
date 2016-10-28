//
//  Remedy.h
//  Natural Remedies
//
//  Created by Emiko Clark on 10/28/16.
//  Copyright © 2016 Emiko Clark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Remedy : NSObject
@property (nonatomic, weak) NSString *remedyName;
@property (nonatomic, weak) NSString *remedyDescription;
@property (nonatomic, weak) NSString *remedyType;
@property (nonatomic, weak) NSString *remedyURL;


- (id)initWithName: (NSString *)remedyName andDescription: (NSString *)remedyDescription andType: (NSString*) remedyType andURL: (NSString*)remedyURL;
@end
