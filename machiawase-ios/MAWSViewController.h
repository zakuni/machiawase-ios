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

@interface MAWSViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstPlaceTextField;
@property (weak, nonatomic) IBOutlet UITextField *secondPlaceTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultText;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)rendezvousButtonPushed:(UIButton *)sender;

@end
