//
//  MAWSAnnotation.m
//  machiawase-ios
//
//  Created by 小沢 邦雄 on 2013/02/17.
//  Copyright (c) 2013年 zakuni. All rights reserved.
//

#import "MAWSAnnotation.h"

@implementation MAWSAnnotation
@synthesize coordinate;
@synthesize title;

-(id)initWithCoordinate:(CLLocationCoordinate2D)co{
    coordinate = co;
    return self;
}
@end
