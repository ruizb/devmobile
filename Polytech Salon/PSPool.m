//
//  PSPool.m
//  Polytech Salon
//
//  Created by Fiorio Christophe on 09/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import "PSPool.h"

@implementation PSPool

- (id)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        _name = [name copy];
        _docsList=[NSMutableSet setWithCapacity:10];

    }
    return self;
}

- (void) addDoc:(PSDocument *)doc{
    [self.docsList addObject:doc];
}
- (void) addDocs:(NSArray*)docs{
    for(int i=0; i<[docs count]; i++) {
        [self addDoc:docs[i]];
    }
}
- (void) delDoc:(PSDocument *)doc{
    [self.docsList removeObject:doc];
}
- (NSArray*) getDocsList {
    return [self.docsList allObjects];
}

@end