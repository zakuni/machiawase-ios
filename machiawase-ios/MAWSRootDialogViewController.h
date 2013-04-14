//
//  MAWSRootDialogViewController.h
//  machiawase-ios
//
//  Created by 小沢 邦雄 on 2013/04/14.
//  Copyright (c) 2013年 zakuni. All rights reserved.
//

#import "QuickDialogController.h"
#import <QuickDialog/QRootElement.h>
#import <QuickDialog/QRootElement+JsonBuilder.h>
#import <QuickDialog/QEntryElement.h>
#import <QuickDialog/QButtonElement.h>
#import "MAWSMachiawase.h"
#import "MAWSMapViewController.h"

@interface MAWSRootDialogViewController : QuickDialogController
{
    NSDictionary *rendezvousResult;
}

@end
