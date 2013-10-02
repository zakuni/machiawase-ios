//
//  MAWSMapViewController.h
//  machiawase-ios
//
//  Created by 小沢 邦雄 on 2013/03/31.
//  Copyright (c) 2013年 zakuni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MAWSAnnotation.h"
#import "MAWSPinDetailViewController.h"
#import "QMapViewController.h"

@interface MAWSMapViewController : QMapViewController
@property (weak, nonatomic) IBOutlet MKMapView *rendezvousMapView;
@property (weak, nonatomic) NSDictionary *rendezvousPlace;
@end
