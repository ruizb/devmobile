//
//  PSSendTableViewController.h
//  Polytech Salon
//
//  Created by Lacroute Henri on 07/04/14.
//  Copyright (c) 2014 BobyCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "PSLibrary.h"
#import "PSDataChecked.h"

@interface PSSendTableViewController : UITableViewController <MFMailComposeViewControllerDelegate>

@property (nonatomic,strong,readonly) PSLibrary* library;
@property (nonatomic,strong,readonly) PSDataChecked* dataDocuments;
- (IBAction)showEmail:(id)sender;

@end
