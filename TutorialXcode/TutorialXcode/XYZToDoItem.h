//
//  XYZToDoItem.h
//  TutorialXcode
//
//  Created by ig_2014 on 25/02/2014.
//  Copyright (c) 2014 Boby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
