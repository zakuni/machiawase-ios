//
//  MAWSViewController.m
//  machiawase-ios
//
//  Created by 小沢 邦雄 on 2013/02/16.
//  Copyright (c) 2013年 zakuni. All rights reserved.
//

#import "MAWSViewController.h"

@interface MAWSViewController ()

@end

@implementation MAWSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rendezvousButtonPushed:(UIButton *)sender {
    // close keyboard
    [self.view endEditing:YES];

    NSString *place1 = _firstPlaceTextField.text;
    NSString *place2 = _secondPlaceTextField.text;
    
    NSLog(@"%@", place1);
    NSLog(@"%@", place2);
    MAWSMachiawase *machiawase = [[MAWSMachiawase alloc]init];
    [machiawase rendezvous:place1 with:place2 delegate:self];
}

- (void)didReceiveResult:(NSDictionary *)result
{
    CLLocationCoordinate2D location;
    location.latitude = [result[@"latitude"] doubleValue];
    location.longitude = [result[@"longtitude"] doubleValue];
    [_mapView setCenterCoordinate:location];
    
    MKCoordinateRegion cr = _mapView.region;
    cr.center = location;
    cr.span.latitudeDelta = 0.2;
    cr.span.longitudeDelta = 0.2;
    [_mapView setRegion:cr];
    
    _resultText.text = result[@"address"];
}

@end
