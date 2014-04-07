//
//  PSLibrary.m
//  Polytech Salon
//
//  Created by Fiorio Christophe on 09/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import "PSLibrary.h"
#import "NSMutableSet+PSSet.h"
#import "PSDocument.h"

@implementation PSLibrary

// description methods to output (NSLog) PSLibrary object
- (NSString *)description {
    NSMutableString* desc = [NSMutableString stringWithFormat:@"PSLibrary:\n"];
    int i=0;
    for(PSDocument* doc in self.docs){
        [desc appendFormat:@"document[%d]=%@\n",i++,doc];
    }
    return desc;
}

// *************************************************************************************
//
// methods managing property files
//

// read the property file and put data into a NSDictionnary
- (NSDictionary*) readPropertyFile{
    NSFileManager* filemgr;
    NSString* dataFile;
    NSString* docsDir;
    NSArray*  dirPaths;
    
    // get default file manager
    filemgr = [NSFileManager defaultManager];
    // Identify the documents directory
    
    // Creates a list of directory search paths,
    dirPaths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory,// Document directory of the IOS App
     NSUserDomainMask,   // The user’s home directory where files should go
     YES);               // tilde expanded for absolute path
    docsDir = dirPaths[0];
    // Build the path to the data file
    dataFile = [docsDir stringByAppendingPathComponent:@"Library property.plist"];
    // check to see if Data.plist exists in documents
    if (![filemgr fileExistsAtPath:dataFile]){
        // if not in documents, get property list from main bundle
        dataFile = [[NSBundle mainBundle] pathForResource:@"Library property" ofType:@"plist"];
    }
    return [[NSDictionary alloc] initWithContentsOfFile:dataFile];
}

// create a NSDictionnary from library data ready to be save into a property file
- (NSDictionary*) propertyDictionnary{
    NSMutableArray* pdictDocs = [NSMutableArray arrayWithCapacity:[self.docs count]];
    for(PSDocument* doc in self.docs){
        [pdictDocs addObject:[NSDictionary dictionaryWithObjects:@[doc.name,[doc.area name],[doc.type name]] forKeys:@[@"name",@"area",@"type"]]];
    }
    NSDictionary* pdict = [NSDictionary dictionaryWithObjects:@[[self.types allNames],[self.areas allNames],pdictDocs]
                                                      forKeys:@[@"types",@"areas",@"documents"]];
    return pdict;
}

// write a NSDictionnary pdict (usually created by propertyDictionnary method) to a file with filename name
- (void) writePropertyFile:(NSDictionary*)pdict toFile:(NSString*)fileName{
    [pdict writeToFile:fileName atomically:YES];
}

// save all data: call propertyDictionnary and writePropertyFile:toFile methods
- (void) saveData{
    NSFileManager* filemgr;
    NSString* dataFile;
    NSString* docsDir;
    NSArray*  dirPaths;
    NSDictionary* pdict=[self propertyDictionnary];
    
    // get default file manager
    filemgr = [NSFileManager defaultManager];
    // Identify the documents directory
    
    // Creates a list of directory search paths,
    dirPaths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory,// Document directory of the IOS App
     NSUserDomainMask,   // The user’s home directory where files should go
     YES);               // tilde expanded for absolute path
    docsDir = dirPaths[0];
    // Build the path to the data file
    dataFile = [docsDir stringByAppendingPathComponent:@"Library property.plist"];
    // check to see if Data.plist exists in documents
    if (![filemgr fileExistsAtPath:dataFile]){
        // if not in documents, get property list from main bundle
        dataFile = [[NSBundle mainBundle] pathForResource:@"Library property" ofType:@"plist"];
    }
    NSLog(@"file=%@",dataFile);
    [pdict writeToFile:dataFile atomically:YES];
}


// *************************************************************************************
//
// initializers
//


// initializer from property file. Should be the one used;
- (id)initWithPropertyList
{
    self = [super init];
    if(self){
        NSDictionary* dataDictionnary = [self readPropertyFile];
        
        NSMutableArray* tabAreas = [NSMutableArray arrayWithCapacity:[(dataDictionnary[@"areas"]) count]];
        for (int i=0; i<[(dataDictionnary[@"areas"]) count]; i++) {
            tabAreas[i] = [[PSArea alloc] initWithName:dataDictionnary[@"areas"][i]];
        }
        _areas = [[PSSetOfAreas alloc]initWithArray:tabAreas];
        
        NSMutableArray* tabTypes = [NSMutableArray arrayWithCapacity:[(dataDictionnary[@"types"]) count]];
        for (int i=0; i<[(dataDictionnary[@"types"]) count]; i++) {
            tabTypes[i] = [[PSArea alloc] initWithName:dataDictionnary[@"types"][i]];
        }
        _types = [[PSSetOfTypes alloc]initWithArray:tabTypes];
        
        NSMutableArray* tabDocs = [NSMutableArray arrayWithCapacity:[(dataDictionnary[@"documents"]) count]];
        for (int i=0; i<[(dataDictionnary[@"documents"]) count]; i++) {
            tabDocs[i] = [[PSDocument alloc] initWithName:(dataDictionnary[@"documents"][i])[@"name"]
                                                     type:[_types typeOfName:(dataDictionnary[@"documents"][i])[@"type"]]
                                                  andArea:[_areas areaOfName:(dataDictionnary[@"documents"][i])[@"area"]]];
        }
        _docs = [NSMutableSet setWithArray:tabDocs];
        
        NSMutableArray* tabPools = [NSMutableArray arrayWithCapacity:[(dataDictionnary[@"pools"]) count]];
        for (int i=0; i<[(dataDictionnary[@"pools"]) count]; i++) {
            tabPools[i] = [[PSPool alloc] initWithName:dataDictionnary[@"pools"][i][@"name"]];
            for (int j=0; j<[(dataDictionnary[@"pools"][i]) count]; j++) {
              int k = 0;
              PSDocument* tmp2 = tabDocs[k];
              while ((![(dataDictionnary[@"pools"][i][@"docs"][j]) isEqualToString:tmp2.name]) && (k<[tabDocs count])) {
                  k++;
                  tmp2 = tabDocs[k];
              }
              if (k<[tabDocs count]) {
                  [tabPools[i] addDoc:tmp2];
              }
            }
        }
        _pools = [[PSSetOfPools alloc]initWithArray:tabPools];
        
    }
    return self;
}

@end
