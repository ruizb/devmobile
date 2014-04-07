//
//  PSDataPools.h
//  Polytech Salon
//
//  Created by Lacroute Henri on 07/04/14.
//  Copyright (c) 2014 BobyCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSPool.h"
#import "PSDocument.h"
#import "PSSetOfPools.h"
#import "Observer.h"

@interface PSDataPools : NSObject<Observer>

@property (nonatomic,strong) NSArray* pools;
@property (nonatomic,strong) NSMutableArray* docsByPools;

-(id) initWithPools:(PSSetOfPools*)aSetOfPools;

-(PSPool*) getPoolForSection:(NSInteger)aSection;
-(NSMutableSet*) getDocumentsListForSection:(NSInteger)aSection;

-(NSString*) getPoolNameForSection:(NSInteger)aSection;

-(NSInteger) numberOfSections;

@end
