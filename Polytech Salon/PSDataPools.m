//
//  PSDataPools.m
//  Polytech Salon
//
//  Created by Lacroute Henri on 07/04/14.
//  Copyright (c) 2014 BobyCompany. All rights reserved.
//

#import "PSDataPools.h"

@implementation PSDataPools

- (id)initWithPools:(PSSetOfPools*)aSetOfPools
{
    self = [super init];
    if (self) {
        self->_pools = [aSetOfPools allObjects];
        self->_docsByPools = [NSMutableArray arrayWithCapacity:[self.pools count]];
        for (int i=0; i<[self.pools count]; i++) {
            [self.docsByPools insertObject:[NSArray arrayWithArray:[(self.pools)[i] allDocumentsSortedByName]] atIndex:i];
        }
    }
    [aSetOfPools addObserver:self];
    return self;
}

-(PSPool*) getPoolForSection:(NSInteger)aSection
{
    return (self.pools)[aSection];
}
-(NSMutableSet*) getDocumentsListForSection:(NSInteger)aSection
{
    return [(self.pools)[aSection] getDocsList];
}

-(NSString*) getPoolNameForSection:(NSInteger)aSection{
    return [(PSPool*)[self getPoolForSection:aSection] name];
}

-(NSInteger) numberOfSections{
    return [self.pools count];
}

// *************************************************************************************
// Data Model Observer

- (void)changeIn:(id)source{
    NSLog(@"added new object %@",source);
}
- (void)changeIn:(id)source withName:(NSString*)aName{
    NSLog(@"added with name %@ new object %@",aName,source);
}

@end
