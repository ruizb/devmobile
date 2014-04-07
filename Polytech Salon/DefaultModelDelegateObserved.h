//
//  CFDefaultModelDelegateObserved.h
//  Observateur Design Pattern
//
//  Created by Fiorio Christophe on 11/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DefaultModelObserved.h"

@interface DefaultModelDelegateObserved : NSObject <ModelObserved>

@property (nonatomic,strong) DefaultModelObserved* delegate;

- (id) init;
- (void)addObserver:(id<Observer>) observer;
- (void)removeObserver:(id<Observer>) observer;
- (void)postNotification;
- (void)postNotificationWithName:(NSString*)aName;

@end
