//
//  CFModelObserved.h
//  Observateur Design Pattern
//
//  Created by Fiorio Christophe on 11/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Observer.h"

@protocol ModelObserved <NSObject>
- (void)addObserver:(id<Observer>) observer;
- (void)removeObserver:(id<Observer>) observer;
- (void)postNotification;
- (void)postNotificationWithName:(NSString*)aName;
@optional
- (void)postNotification:(id)source;
- (void)postNotification:(id)source withName:(NSString*)aName;
@end
