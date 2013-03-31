//
//  MAWSTableViewController.h
//  machiawase-ios
//
//  Created by 小沢 邦雄 on 2013/02/24.
//  Copyright (c) 2013年 zakuni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAWSTableViewController : UITableViewController
{
    UIView *footerView;
}
- (IBAction)buttonPushed:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UITableView *placeTableView;

@end
