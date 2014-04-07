//
//  PSPoolTableViewController.h
//  Polytech Salon
//
//  Created by Lacroute Henri on 07/04/14.
//  Copyright (c) 2014 BobyCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSLibrary.h"
#import "PSDataPools.h"

@interface PSPoolTableViewController : UITableViewController

@property (nonatomic,strong,readonly) PSLibrary* library;
@property (nonatomic,strong,readonly) PSDataPools* dataPools;

@end
