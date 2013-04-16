//
//  MAWSMachiawase.m
//  machiawase-ios
//
//  Created by 小沢 邦雄 on 2013/02/17.
//  Copyright (c) 2013年 zakuni. All rights reserved.
//

#import "MAWSMachiawase.h"

@implementation MAWSMachiawase
id theDelegate;

- (void)rendezvous:(NSString *)place1 with:(NSString *)place2 delegate:(id)delegate
{
    theDelegate = delegate;
    
    NSMutableString *url = [[NSMutableString alloc]initWithString:@"http://machiawase.herokuapp.com/rendezvous.msgpack?"];
    [url appendString:place1];
    [url appendString:@","];
    [url appendString:place2];
    NSString *escapedUrl = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:escapedUrl]];
    [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    DDLogVerbose(@"%@", [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    
    NSDictionary *resultDictionary = [data messagePackParse];
    
    [theDelegate didReceiveResult:resultDictionary];
}
@end
