//
//  LXRunTimeViewController.m
//  objective_app
//
//  Created by asdc on 2020/12/8.
//

#import "LXRunTimeViewController.h"
#import "RuntimeObject.h"
#import "RuntimeSwizzling.h"

@interface LXRunTimeViewController ()

@end

@implementation LXRunTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    // 调用test方法，只有声明，没有实现，这样就能看到系统的一个转发流程是怎样的
    RuntimeObject *obj = [[RuntimeObject alloc] init];
    [obj test];
    
    RuntimeSwizzling *objSwizzling = [[RuntimeSwizzling alloc] init];
    
}

@end
