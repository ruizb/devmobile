//
//  CFDefaultModelDelegateObserved.m
//  Observateur Design Pattern
//
//  Created by Fiorio Christophe on 11/03/2014.
//  Copyright (c) 2014 Fiorio Christophe. All rights reserved.
//

#import "DefaultModelDelegateObserved.h"

@implementation DefaultModelDelegateObserved

@synthesize delegate=_delegate;

- (id)init
{
    self = [super init];
    if (self) {
        _delegate = [[DefaultModelObserved alloc] init];
    }
    return self;
}

- (void)addObserver:(id<Observer>) observer{
    [self.delegate addObserver:observer];
}
- (void)removeObserver:(id<Observer>) observer{
    [self.delegate removeObserver:observer];
}
- (void)postNotification{
    [self.delegate postNotification:self];
}
- (void)postNotificationWithName:(NSString*)aName{
    [self.delegate postNotification:self withName:aName];
}

@end
