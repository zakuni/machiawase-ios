//
//  MAWSPinDetailViewController.m
//  machiawase-ios
//
//  Created by 小沢 邦雄 on 2013/02/17.
//  Copyright (c) 2013年 zakuni. All rights reserved.
//

#import "MAWSPinDetailViewController.h"

@interface MAWSPinDetailViewController ()

@end

@implementation MAWSPinDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (CGFloat)tableView:
(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath == 0) {
        return 70;
    }
    else{
        return 80;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    _addressCell.detailTextLabel.text = _address;
    _nearStationCell.detailTextLabel.text = _nearStation;
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
