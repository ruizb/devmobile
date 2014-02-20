//
//  Tweet.h
//  TP1
//
//  Created by Benoit Ruiz01 on 13/02/2014.
//  Copyright (c) 2014 Bobyland. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tweet : NSObject {
    NSString * contenu;
    double lat;
    double lon;
    NSDate * timecode;
}

@property NSString * contenu;
@property double lat;
@property double lon;
@property NSDate * timecode;

- (Tweet *) init :(NSString *) acontenu :(double) alat :(double) alon;
- (Tweet *) init :(NSString *) acontenu;

@end
