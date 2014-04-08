//
//  PSDataChecked.m
//  Polytech Salon
//
//  Created by Lacroute Henri on 07/04/14.
//  Copyright (c) 2014 BobyCompany. All rights reserved.
//

#import "PSDataChecked.h"

@implementation PSDataChecked

- (id)initWithAreas:(PSSetOfAreas *)aSetOfAreas {
    self = [super init];
    if (self) {
        NSArray* tmpAreas = [aSetOfAreas sortedArrayByName];
        
        NSMutableArray* checkedAreas = [[NSMutableArray alloc] init];
        
        for (int i=0; i<[tmpAreas count]; i++) {
            if([[tmpAreas[i] allDocumentsChecked] count] > 0)
                [checkedAreas addObject:tmpAreas[i]];
        }
        
        self->_areas = [NSArray arrayWithArray:checkedAreas];
        
        self->_docsByAreas = [NSMutableArray arrayWithCapacity:[self.areas count]];
        for (int i=0; i<[self.areas count]; i++) {
            PSArea* tmp = (self.areas)[i];
            [self.docsByAreas insertObject:[NSArray arrayWithArray:[tmp allDocumentsChecked]] atIndex:i];
        }
    }
    [aSetOfAreas addObserver:self];
    return self;
}

-(PSArea*) getAreaForSection:(NSInteger)aSection{
    return (self.areas)[aSection];
}
-(PSDocument*) getDocumentForSection:(NSInteger) aSection andForRow:(NSInteger)aRow{
    return (self.docsByAreas)[aSection][aRow];
}
-(PSType*) getTypeForSection:(NSInteger)aSection andForRow:(NSInteger)aRow{
    return [[self getDocumentForSection:aSection andForRow:aRow] type];
}

-(NSString*) getAreaNameForSection:(NSInteger)aSection{
    return [(PSArea*)[self getAreaForSection:aSection] name];
}
-(NSString*) getDocumentNameForSection:(NSInteger) aSection andForRow:(NSInteger)aRow{
    return [[self getDocumentForSection:aSection andForRow:aRow] name];
}
-(NSString*) getTypeNameForSection:(NSInteger)aSection andForRow:(NSInteger)aRow{
    return [[self getTypeForSection:aSection andForRow:aRow] name];
}

-(NSInteger) numberOfSections{
    return [self.areas count];
}
-(NSInteger) numberOfRowsForSection:(NSInteger)aSection{
    return [(self.areas)[aSection] numberOfCheckedDocuments];
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
