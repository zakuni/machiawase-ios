	//
//  MAWSTableViewController.m
//  machiawase-ios
//
//  Created by 小沢 邦雄 on 2013/02/24.
//  Copyright (c) 2013年 zakuni. All rights reserved.
//

#import "MAWSTableViewController.h"
#import "MAWSMachiawase.h"

@interface MAWSTableViewController ()

@end

@implementation MAWSTableViewController

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 40.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (footerView == nil) {
        footerView = [[UIView alloc] init];

        UIButton* rendezvousButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        rendezvousButton.frame = CGRectMake(8, 10, 304, 42);
        [rendezvousButton setTitle:@"rendezvous" forState:UIControlStateNormal];
        [rendezvousButton addTarget:self action:@selector(buttonPushed:) forControlEvents:UIControlEventTouchUpInside];

        [footerView addSubview:rendezvousButton];
    }
    
    return footerView;
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//
//    // Configure the cell.
//    UILabel *label;
//    label = (UILabel *)[cell viewWithTag:1];
//    label.text = [NSString stringWithFormat:@"Place %d:", indexPath.row + 1];
//    
//    UITextField *textField = (UITextField *)[cell viewWithTag:2];
//    textField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//    textField.returnKeyType = UIReturnKeyGo;
//    [textField addTarget:self
//                  action:@selector(buttonPushed:)
//        forControlEvents:UIControlEventEditingDidEndOnExit];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        if ([indexPath section] == 0) {
            UITextField *playerTextField = [[UITextField alloc] initWithFrame:CGRectMake(110, 10, 185, 30)];
            playerTextField.adjustsFontSizeToFitWidth = YES;
            playerTextField.textColor = [UIColor blackColor];
            if ([indexPath row] == 0) {
                playerTextField.placeholder = @"example@gmail.com";
                playerTextField.keyboardType = UIKeyboardTypeEmailAddress;
                playerTextField.returnKeyType = UIReturnKeyNext;
            }
            else {
                playerTextField.placeholder = @"Required";
                playerTextField.keyboardType = UIKeyboardTypeDefault;
                playerTextField.returnKeyType = UIReturnKeyDone;
                playerTextField.secureTextEntry = YES;
            }
            playerTextField.backgroundColor = [UIColor whiteColor];
            playerTextField.autocorrectionType = UITextAutocorrectionTypeNo; // no auto correction support
            playerTextField.autocapitalizationType = UITextAutocapitalizationTypeNone; // no auto capitalization support
            playerTextField.textAlignment = UITextAlignmentLeft;
            playerTextField.tag = 0;
            //playerTextField.delegate = self;
            
            playerTextField.clearButtonMode = UITextFieldViewModeNever; // no clear 'x' button to the right
            [playerTextField setEnabled: YES];
            
            [cell.contentView addSubview:playerTextField];
        }
    }
    
    if ([indexPath section] == 0) { // Email & Password Section
        if ([indexPath row] == 0) { // Email
            cell.textLabel.text = @"Email";
        }
        else {
            cell.textLabel.text = @"Password";
        }
    }
    else { // Login button section
        cell.textLabel.text = @"Log in";
    }
    
    return cell;
}

- (void)moveToNextField:(UITextField *)textField
{
    if (textField.tag == 0) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        
        UITextField *nextField = (UITextField *)[cell viewWithTag:2];
        [nextField becomeFirstResponder];
    }
    else
    {
        [self.view endEditing:YES];
        [self buttonPushed:nil];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (IBAction)buttonPushed:(UIButton *)sender {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    UITableViewCell *cell = [self.placeTableView cellForRowAtIndexPath:indexPath];
    UITextField *textField = (UITextField *)[cell viewWithTag:2];
    NSString *place1 = textField.text;
    
    indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    cell = [self.placeTableView cellForRowAtIndexPath:indexPath];
    textField = (UITextField *)[cell viewWithTag:2];
    NSString *place2 = textField.text;
    
    NSLog(@"%@", place1);
    NSLog(@"%@", place2);
    MAWSMachiawase *machiawase = [[MAWSMachiawase alloc]init];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//    [_indicatorView startAnimating];
    [machiawase rendezvous:place1 with:place2 delegate:self];
}

- (void)didReceiveResult:(NSDictionary *)result
{
    NSLog(@"%@", result);
    rendezvousResult = result;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self performSegueWithIdentifier:@"map" sender:self];
    
//    [_indicatorView stopAnimating];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MAWSMapViewController *mapViewController = [segue destinationViewController];
    mapViewController.rendezvousPlace = rendezvousResult;
}
@end
