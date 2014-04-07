//
//  PSLibrary.h
//  Polytech Salon
//
//  Created by Fiorio Christophe on 09/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSDocument.h"
#import "PSArea.h"
#import "PSType.h"
#import "PSPool.h"
#import "PSSetOfAreas.h"
#import "PSSetOfTypes.h"
#import "PSSetOfPools.h"
#import "NSMutableSet+PSSet.h"

@interface PSLibrary : NSObject

@property (nonatomic,readonly,strong) PSSetOfTypes* types;
@property (nonatomic,readonly,strong) PSSetOfAreas* areas;
@property (nonatomic,readonly,strong) NSMutableSet* docs;
@property (nonatomic,readonly,strong) PSSetOfPools* pools;

// *************************************************************************************

// initializer from property file. Should be the one used;
- (id) initWithPropertyList;

// *************************************************************************************
// methods managing property files

// read the property file and put data into a NSDictionnary
- (NSDictionary*) readPropertyFile;
// create a NSDictionnary from library data ready to be save into a property file
- (NSDictionary*) propertyDictionnary;
// write a NSDictionnary pdict (usually created by propertyDictionnary method) to a file with filename name
- (void) writePropertyFile:(NSDictionary*)pdict toFile:(NSString*)fileName;
// save all data: call propertyDictionnary and writePropertyFile:toFile methods
- (void) saveData;


@end
