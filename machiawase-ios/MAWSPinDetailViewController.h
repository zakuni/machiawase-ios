//
//  MAWSPinDetailViewController.h
//  machiawase-ios
//
//  Created by 小沢 邦雄 on 2013/02/17.
//  Copyright (c) 2013年 zakuni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAWSPinDetailViewController : UITableViewController
@property NSString *address;
@property (weak, nonatomic) IBOutlet UITableViewCell *addressCell;
@property NSString *nearStation;
@property (weak, nonatomic) IBOutlet UITableViewCell *nearStationCell;

@end
