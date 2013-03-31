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
        rendezvousButton.frame = CGRectMake(9, 10, 302, 42);
        [rendezvousButton setTitle:@"Footer" forState:UIControlStateNormal];
        [rendezvousButton addTarget:self action:@selector(buttonPushed:) forControlEvents:UIControlEventTouchUpInside];

        [footerView addSubview:rendezvousButton];
        return footerView;
    }
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
    static NSString *CellIdentifier = @"EditableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    // Configure the cell.
    UILabel *label;
    label = (UILabel *)[cell viewWithTag:1];
    label.text = [NSString stringWithFormat:@"Place %d:", indexPath.row + 1];
    
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
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//    [_indicatorView stopAnimating];
//    _rendezvousPlace = result;
//    _mapView.hidden = NO;
//    
//    CLLocationCoordinate2D coordinate;
//    coordinate.latitude = [_rendezvousPlace[@"latitude"] doubleValue];
//    coordinate.longitude = [_rendezvousPlace[@"longitude"] doubleValue];
//    [_mapView setCenterCoordinate:coordinate];
//    
//    // アノテーションを地図へ追加
//    MAWSAnnotation *annotation = [[MAWSAnnotation alloc] initWithCoordinate:coordinate];
//    annotation.title = _rendezvousPlace[@"address"];
//    [_mapView addAnnotation:annotation];
//    
//    MKCoordinateRegion region = _mapView.region;
//    region.center = coordinate;
//    region.span.latitudeDelta = 0.2;
//    region.span.longitudeDelta = 0.2;
//    [_mapView setRegion:region];
}
@end
