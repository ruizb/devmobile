//
//  PSAddTableViewController.h
//  Polytech Salon
//
//  Created by Lacroute Henri on 08/04/14.
//  Copyright (c) 2014 BobyCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSLibrary.h"
#import "PSDataDocuments.h"

@interface PSAddTableViewController : UITableViewController

@property (nonatomic,strong,readonly) PSLibrary* library;
@property (nonatomic,strong,readonly) PSDataDocuments* dataDocuments;
@property (weak, nonatomic) IBOutlet UITextField *poolName;

- (IBAction)addPool:(id)sender;

@end
