//
//  MAWSViewController.h
//  machiawase-ios
//
//  Created by 小沢 邦雄 on 2013/02/16.
//  Copyright (c) 2013年 zakuni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MAWSMachiawase.h"
#import "MAWSAnnotation.h"
#import "MAWSPinDetailViewController.h"

@interface MAWSViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstPlaceTextField;
@property (weak, nonatomic) IBOutlet UITextField *secondPlaceTextField;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;

- (IBAction)rendezvousButtonPushed:(UIButton *)sender;

- (IBAction)firstTextFieldEndOnExit:(UITextField *)sender;
- (IBAction)secondTextFieldEndOnExit:(UITextField *)sender;

@end
