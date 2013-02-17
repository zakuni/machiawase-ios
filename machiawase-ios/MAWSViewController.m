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
    [self.navigationController setNavigationBarHidden:YES animated:NO];
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
    _mapView.hidden = NO;
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = [result[@"latitude"] doubleValue];
    coordinate.longitude = [result[@"longtitude"] doubleValue];
    [_mapView setCenterCoordinate:coordinate];
    
    // アノテーションを地図へ追加
    MAWSAnnotation *annotation = [[MAWSAnnotation alloc] initWithCoordinate:coordinate];
    annotation.title = result[@"address"];
    [_mapView addAnnotation:annotation];
    
    MKCoordinateRegion region = _mapView.region;
    region.center = coordinate;
    region.span.latitudeDelta = 0.2;
    region.span.longitudeDelta = 0.2;
    [_mapView setRegion:region];
}

// アノテーションが表示される時に呼ばれる
-(MKAnnotationView*)mapView:(MKMapView*)mapView
          viewForAnnotation:(id)annotation{
    
    static NSString *PinIdentifier = @"Pin";
    MKPinAnnotationView *pinAnnotationView = (MKPinAnnotationView*)[_mapView dequeueReusableAnnotationViewWithIdentifier:PinIdentifier];
    if(pinAnnotationView == nil){
        pinAnnotationView = [[MKPinAnnotationView alloc]
                initWithAnnotation:annotation reuseIdentifier:PinIdentifier];
        pinAnnotationView.animatesDrop = YES;  // アニメーションをする
        pinAnnotationView.canShowCallout = YES;  // ピンタップ時にコールアウトを表示する
        pinAnnotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    return pinAnnotationView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    // push the detail view
    [self performSegueWithIdentifier:@"detail" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
}
@end
