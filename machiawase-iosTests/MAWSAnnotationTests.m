//
//  MAWSAnnotationTests.m
//  machiawase-ios
//
//  Created by 小沢 邦雄 on 2014/02/15.
//  Copyright (c) 2014年 zakuni. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "MAWSAnnotation.h"

@interface MAWSAnnotationTests : SenTestCase

@end

@implementation MAWSAnnotationTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testInit
{
    STAssertNotNil([[MAWSAnnotation alloc]init], nil);

    CLLocationCoordinate2D coordinate;
    STAssertNotNil([[MAWSAnnotation alloc]initWithCoordinate:coordinate], nil);
}

@end
