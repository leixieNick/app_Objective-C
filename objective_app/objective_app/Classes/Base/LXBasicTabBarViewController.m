//
//  LXBasicTabBarViewController.m
//  objective_app
//
//  Created by asdc on 2020/12/7.
//

#import "LXBasicTabBarViewController.h"
#import "LXBasicNavigationViewController.h"
#import "LXFindViewController.h"
#import "LXHomeViewController.h"
#import "LXNewsViewController.h"
#import "LXMusicViewController.h"
#import "LXMeViewController.h"
#import "UIImage+Extension.h"
#import "UIColor+Extension.h"

@interface LXBasicTabBarViewController ()

@end

@implementation LXBasicTabBarViewController

+ (void)load {
    UITabBarItem *item = [UITabBarItem appearance];
    
    NSMutableDictionary *normalAttribute = [NSMutableDictionary dictionary];
    normalAttribute[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    normalAttribute[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"aaaaaa"];
    [item setTitleTextAttributes:normalAttribute forState:UIControlStateNormal];
    
    NSMutableDictionary *selectedAttribute = [NSMutableDictionary dictionary];
    selectedAttribute[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    selectedAttribute[NSForegroundColorAttributeName] = [UIColor colorThemeColor];
    [item setTitleTextAttributes:selectedAttribute forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initChildrenController];
}

- (void)initChildrenController {
    LXFindViewController *findVc = [[LXFindViewController alloc] init];
    [self setupOneChildrenController:findVc title:@"发现" image:@"item-04-normal" selectedImage:@"item-04-select"];
    
    LXHomeViewController *wallpaper = [[LXHomeViewController alloc] init];
    [self setupOneChildrenController:wallpaper title:@"壁纸" image:@"item-01-normal" selectedImage:@"item-01-select"];

    LXNewsViewController *news = [[LXNewsViewController alloc] init];
    [self setupOneChildrenController:news title:@"新闻" image:@"item-02-normal" selectedImage:@"item-02-select"];

    LXMusicViewController *music = [[LXMusicViewController alloc] init];
    [self setupOneChildrenController:music title:@"乐库" image:@"item-03-normal" selectedImage:@"item-03-select"];

    LXMeViewController *mine = [[LXMeViewController alloc] init];
    [self setupOneChildrenController:mine title:@"我的" image:@"item-04-normal" selectedImage:@"item-04-select"];
}

- (void)setupOneChildrenController:(UIViewController *)vc
                             title:(NSString *)title
                             image:(NSString *)image
                     selectedImage:(NSString *)selectedImage {
    
    LXBasicNavigationViewController *nav = [[LXBasicNavigationViewController alloc] initWithRootViewController:vc];
    vc.title = title;
    if (((image.length) && (selectedImage.length)) > 0) { //图片存在
        vc.tabBarItem.image = [UIImage imageWithOriginalRenderingMode:image];
        vc.tabBarItem.selectedImage = [UIImage imageWithOriginalRenderingMode:selectedImage];
    }
    
    // 添加子控制器
    [self addChildViewController:nav];
}

@end
