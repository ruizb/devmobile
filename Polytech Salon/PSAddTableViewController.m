//
//  PSAddTableViewController.m
//  Polytech Salon
//
//  Created by Lacroute Henri on 08/04/14.
//  Copyright (c) 2014 BobyCompany. All rights reserved.
//

#import "PSAddTableViewController.h"
#import "PSAddCell.h"
#import "PSAppDelegate.h"
#import "PSDocument.h"
#import "PSPool.h"

@interface PSAddTableViewController ()

@end

@implementation PSAddTableViewController

@synthesize library=_library;

static NSArray* areaKeys=nil;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self->_library=[(PSAppDelegate*)[[UIApplication sharedApplication] delegate] library];
    self->_dataDocuments = [[PSDataDocuments alloc] initWithAreas:[self.library areas]];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.dataDocuments numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.dataDocuments numberOfRowsForSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PSAddCell";
    PSAddCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // Configure the cell...
    cell.nameLabel.text = [self.dataDocuments getDocumentNameForSection:indexPath.section andForRow:indexPath.row];
    cell.typeLabel.text = [self.dataDocuments getTypeNameForSection:indexPath.section andForRow:indexPath.row];
    cell.areaLabel.text = [self.dataDocuments getAreaNameForSection:indexPath.section];
    PSDocument* doc = [self.dataDocuments getDocumentForSection:indexPath.section andForRow:indexPath.row];
    if(doc.checkedPool)
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    else
        cell.accessoryType = UITableViewCellAccessoryNone;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    PSDocument* doc = [self.dataDocuments getDocumentForSection:indexPath.section andForRow:indexPath.row];
    doc.checkedPool = !doc.checkedPool;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addPool:(id)sender {
    NSString* nom = _poolName.text;
    PSPool* newPool = [[PSPool alloc] initWithName:nom];
    [newPool addDocs:[self.dataDocuments getDocumentsForPool]];
    
    [self.library.pools addPool:newPool];
    [self.library saveData];
    
    [self performSegueWithIdentifier:@"UnwindSegueIdentifier" sender:self];
}
@end
