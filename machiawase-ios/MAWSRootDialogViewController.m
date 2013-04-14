//
//  MAWSRootDialogViewController.m
//  machiawase-ios
//
//  Created by 小沢 邦雄 on 2013/04/14.
//  Copyright (c) 2013年 zakuni. All rights reserved.
//

#import "MAWSRootDialogViewController.h"

@interface MAWSRootDialogViewController ()

@end

@implementation MAWSRootDialogViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        QRootElement *root = [[QRootElement alloc] init];
        root.title = @"街合わせ";
        root.grouped = YES;

        QSection *placesSection = [[QSection alloc] init];
        QEntryElement *placeElement = [[QEntryElement alloc] initWithTitle:@"Place1" Value:nil Placeholder:@"type here"];
        placeElement.key = @"place1";
        [placesSection addElement:placeElement];
        
        QEntryElement *placeElement2 = [[QEntryElement alloc] initWithTitle:@"Place2" Value:nil Placeholder:@"type here"];
        placeElement2.key = @"place2";
        [placesSection addElement:placeElement2];
        [root addSection:placesSection];
        
        QButtonElement *buttonElement = [[QButtonElement alloc] initWithTitle:@"待ち合わせる"];
        buttonElement.onSelected = ^{
            [self loading:YES];
            NSString *place1 = placeElement.textValue;
            NSString *place2 = placeElement2.textValue;
            
            NSLog(@"%@", place1);
            NSLog(@"%@", place2);
            MAWSMachiawase *machiawase = [[MAWSMachiawase alloc]init];
            [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
            [machiawase rendezvous:place1 with:place2 delegate:self];
        };
        
        QSection *buttonSection = [[QSection alloc] init];
        [buttonSection addElement:buttonElement];
        [root addSection:buttonSection];
        
        self.root = root;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didReceiveResult:(NSDictionary *)result
{
    NSLog(@"%@", result);
    [self loading:NO];
    rendezvousResult = result;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self performSegueWithIdentifier:@"map" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MAWSMapViewController *mapViewController = [segue destinationViewController];
    mapViewController.rendezvousPlace = rendezvousResult;
}
@end
