//
//  ViewController.m
//  TP1
//
//  Created by Benoit Ruiz01 on 13/02/2014.
//  Copyright (c) 2014 Bobyland. All rights reserved.
//

#import "ViewController.h"
#import "Tweet.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    Tweet * t = [[Tweet alloc] init :@"Test" :0 :0];
    [self toto:t.timecode];
    
    
}
- (IBAction)toto:(id)sender {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
