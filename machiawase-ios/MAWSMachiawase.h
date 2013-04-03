//
//  MAWSMachiawase.h
//  machiawase-ios
//
//  Created by 小沢 邦雄 on 2013/02/17.
//  Copyright (c) 2013年 zakuni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessagePack.h"

@protocol MAWSMachiawaseDelegate <NSObject>

-(void)didReceiveResult:(NSDictionary *)result;

@end

@interface MAWSMachiawase : NSObject

-(void)rendezvous:(NSString *)place1 with:(NSString *)place2 delegate:(id)delegate;
@end
