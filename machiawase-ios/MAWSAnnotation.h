//
//  MAWSAnnotation.h
//  machiawase-ios
//
//  Created by 小沢 邦雄 on 2013/02/17.
//  Copyright (c) 2013年 zakuni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MAWSAnnotation : NSObject <MKAnnotation>{
    
    CLLocationCoordinate2D coordinate;
    NSString *title;
    
}

@property(nonatomic)CLLocationCoordinate2D coordinate;
@property(nonatomic, copy) NSString *title;

-(id)initWithCoordinate:(CLLocationCoordinate2D)co;

@end
