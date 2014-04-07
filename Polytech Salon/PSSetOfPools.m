//
//  PSSetOfPools.m
//  Polytech Salon
//
//  Created by Lacroute Henri on 07/04/14.
//  Copyright (c) 2014 BobyCompany. All rights reserved.
//

#import "PSSetOfPools.h"
#import "PSPool.h"

// *************************************************************************************
//
// class managing a set of pools
// pools are indexed by their names
// is objserver of pool name property to change indexing accordingly to name changes
//
@implementation PSSetOfPools

- (NSString *)description {
    return [NSString stringWithFormat: @"PSSetOfPools: %@", self.dico];
}

// *************************************************************************************
// initializers

- (id)init
{
    self = [super init];
    return self;
}
- (id)initWithArray:(NSArray *)anArray
{
    self = [super initWithArray:anArray];
    return self;
}
- (id)initWithSet:(NSSet *)aSet
{
    self = [super initWithSet:aSet];
    return self;
}

// *************************************************************************************
// Add (PSPool*) in set

// add a PSPool into the set
- (void)addPool:(PSPool*) aPool{
    [super addObject:aPool forName:[aPool name]];
}

// add a newly created PSPool of name aName into the set
// return the newly created PSPool
- (PSPool*) addPoolOfName:(NSString*)aName{
    PSPool* pool=[[PSPool alloc] initWithName:aName];
    [super addObject:pool forName:aName];
    return pool;
}


// *************************************************************************************
// remove (PSPool*) in set


// remove PSPool with the given name of the set
// return PSPool removed
// Exception thrown: object of this name not present in set
- (PSPool*) removePoolOfName:(NSString*)aName{
    PSPool* pool = [super removeObjectForName:aName];
    return pool;
}

// remove a given object of the set
// return PSPool removed
// Exception thrown: object of this name not present in set - thrown if PSPool with same name as the one in argument is not present in the set
// Exception thrown: object of this name present in set is not the one to remove - thrown if PSPool with same name as the one in argument is not the on given in argument
- (PSPool*)removePool:(PSPool*) aPool{
    return [super removeObject:aPool forName:[aPool name]];
}

// *************************************************************************************
// contains

// check if a given PSPool belongs to the set
- (BOOL)containsPool:(PSPool *)aPool{
    return [super containsObject:aPool forName:[aPool name]];
}

// check if a PSPool with aName belongs to the set
- (BOOL)containsPoolOfName:(NSString*)aName{
    return ([super objectForName:aName]!=nil);
}


// *************************************************************************************
// get

// return PSType of name aName contained in the set ; return nil no PSType of the set has this name
- (PSPool*) poolOfName:(NSString*)aName{
    return [super objectForName:aName];
}

@end
