//
//  Tweet.m
//  TP1
//
//  Created by Benoit Ruiz01 on 13/02/2014.
//  Copyright (c) 2014 Bobyland. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

@synthesize contenu=_contenu;
@synthesize lat;
@synthesize lon;
@synthesize timecode;

- (Tweet *) init :(NSString *) acontenu :(double) alat :(double) alon {
    self.contenu = acontenu;
    self.lat = alat;
    self.lon = alon;
    self.timecode = [NSDate init];
    return self;
}

- (Tweet *) init :(NSString *) acontenu {
    self.contenu = acontenu;
    self.lat = 0;
    self.lon = 0;
    self.timecode = [NSDate init];
    return self;
}

@end
