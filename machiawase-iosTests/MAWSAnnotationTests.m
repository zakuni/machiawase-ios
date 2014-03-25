//
//  MAWSAnnotationTests.m
//  machiawase-ios
//
//  Created by 小沢 邦雄 on 2014/02/15.
//  Copyright (c) 2014年 zakuni. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MAWSAnnotation.h"

@interface MAWSAnnotationTests : XCTestCase

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
    XCTAssertNotNil([[MAWSAnnotation alloc]init]);

    CLLocationCoordinate2D coordinate;
    XCTAssertNotNil([[MAWSAnnotation alloc]initWithCoordinate:coordinate]);
}

@end
