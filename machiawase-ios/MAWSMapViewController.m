//
//  MAWSMapViewController.m
//  machiawase-ios
//
//  Created by 小沢 邦雄 on 2013/03/31.
//  Copyright (c) 2013年 zakuni. All rights reserved.
//

#import "MAWSMapViewController.h"

@interface MAWSMapViewController ()

@end

@implementation MAWSMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = [_rendezvousPlace[@"latitude"] doubleValue];
    coordinate.longitude = [_rendezvousPlace[@"longitude"] doubleValue];
    
    [_rendezvousMapView setCenterCoordinate:coordinate];
    
    // アノテーションを地図へ追加
    MAWSAnnotation *annotation = [[MAWSAnnotation alloc] initWithCoordinate:coordinate];
    annotation.title = _rendezvousPlace[@"address"];
    [_rendezvousMapView addAnnotation:annotation];
    
    MKCoordinateRegion region = _rendezvousMapView.region;
    region.center = coordinate;
    region.span.latitudeDelta = 0.2;
    region.span.longitudeDelta = 0.2;
    [_rendezvousMapView setRegion:region];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// アノテーションが表示される時に呼ばれる
-(MKAnnotationView*)mapView:(MKMapView*)mapView
          viewForAnnotation:(id)annotation{
    
    static NSString *PinIdentifier = @"Pin";
    MKPinAnnotationView *pinAnnotationView = (MKPinAnnotationView*)[_rendezvousMapView dequeueReusableAnnotationViewWithIdentifier:PinIdentifier];
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
    MAWSPinDetailViewController *pinDetailViewController = [segue destinationViewController];
    pinDetailViewController.address = _rendezvousPlace[@"address"];
}
@end
