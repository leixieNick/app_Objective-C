//
//  ViewController.m
//  objective_app
//
//  Created by asdc on 2020/10/29.
//

#import "ViewController.h"
#import <MBProgressHUD.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.redColor;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [hud hideAnimated:YES afterDelay:3.0];
}


@end
