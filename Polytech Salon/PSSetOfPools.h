//
//  PSSetOfPools.h
//  Polytech Salon
//
//  Created by Lacroute Henri on 07/04/14.
//  Copyright (c) 2014 BobyCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSSetIndexedByName.h"
#import "PSPool.h"

// *************************************************************************************
//
// class managing a set of pools
// pools are indexed by their names
// is observer of pool name property to change indexing accordingly to name changes
//
@interface PSSetOfPools : PSSetIndexedByName

// *************************************************************************************
// initializers

- (id) init;
- (id) initWithArray:(NSArray*)anArray;
- (id) initWithSet:(NSSet*)aSet;

// *************************************************************************************
// Add (PSPool*) in set

// add a PSPool into the set
- (void)addPool:(PSPool*) aPool;
// add a newly created PSPool of name aName into the set
// return the newly created PSPool
- (PSPool*) addPoolOfName:(NSString*)aPool;

// *************************************************************************************
// remove (PSPool*) in set

// remove PSPool with the given name of the set
// return PSPool removed
// Exception thrown: object of this name not present in set
- (PSPool*) removePoolOfName:(NSString*)aName;

// remove a given object of the set
// return PSPool removed
// Exception thrown: object of this name not present in set - thrown if PSPool with same name as the one in argument is not present in the set
// Exception thrown: object of this name present in set is not the one to remove - thrown if PSPool with same name as the one in argument is not the on given in argument
- (PSPool*)removePool:(PSPool*) aPool;

// *************************************************************************************
// contains

// check if a given PSPool belongs to the set
- (BOOL)containsPool:(PSPool*) aPool;
// check if a PSPool with aName belongs to the set
- (BOOL)containsPoolOfName:(NSString*)aName;

// *************************************************************************************
// get

// return PSType of name aName contained in the set ; return nil no PSType of the set has this name
- (PSPool*) poolOfName:(NSString*)aName;


@end
