//
//  MAWSTableViewController.h
//  machiawase-ios
//
//  Created by 小沢 邦雄 on 2013/02/24.
//  Copyright (c) 2013年 zakuni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAWSMapViewController.h"
#import "MAWSAnnotation.h"

@interface MAWSTableViewController : UITableViewController
{
    UIView *footerView;
    NSDictionary *rendezvousResult;
}
- (IBAction)buttonPushed:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UITableView *placeTableView;
@end
