//
//  PSSendTableViewController.h
//  Polytech Salon
//
//  Created by Lacroute Henri on 07/04/14.
//  Copyright (c) 2014 BobyCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSLibrary.h"
#import "PSDataChecked.h"

@interface PSSendTableViewController : UITableViewController

@property (nonatomic,strong,readonly) PSLibrary* library;
@property (nonatomic,strong,readonly) PSDataChecked* dataDocuments;

@end
