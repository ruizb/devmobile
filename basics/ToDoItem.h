//
//  ToDoItem.h
//  basics
//
//  Created by ruizb on 20/02/2014.
//  Copyright (c) 2014 ruizb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
