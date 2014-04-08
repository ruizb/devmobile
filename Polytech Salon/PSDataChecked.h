//
//  PSDataChecked.h
//  Polytech Salon
//
//  Created by Lacroute Henri on 07/04/14.
//  Copyright (c) 2014 BobyCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSArea.h"
#import "PSDocument.h"
#import "PSType.h"
#import "PSSetOfAreas.h"
#import "Observer.h"

@interface PSDataChecked : NSObject<Observer>

@property (nonatomic,strong) NSArray* areas;
@property (nonatomic,strong) NSMutableArray* docsByAreas;

-(id) initWithAreas:(PSSetOfAreas*)aSetOfAreas;

-(PSArea*) getAreaForSection:(NSInteger)aSection;
-(PSDocument*) getDocumentForSection:(NSInteger) aSection andForRow:(NSInteger)aRow;
-(PSType*) getTypeForSection:(NSInteger)aSection andForRow:(NSInteger)aRow;

-(NSString*) getAreaNameForSection:(NSInteger)aSection;
-(NSString*) getDocumentNameForSection:(NSInteger) aSection andForRow:(NSInteger)aRow;
-(NSString*) getTypeNameForSection:(NSInteger)aSection andForRow:(NSInteger)aRow;

-(NSInteger) numberOfSections;
-(NSInteger) numberOfRowsForSection:(NSInteger)aSection;

@end
