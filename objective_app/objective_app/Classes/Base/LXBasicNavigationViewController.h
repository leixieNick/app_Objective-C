//
//  LXBasicNavigationViewController.h
//  objective_app
//
//  Created by asdc on 2020/12/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXBasicNavigationViewController : UINavigationController

/**
 全屏滑动返回手势
 */
@property (nonatomic, strong) UIPanGestureRecognizer *pan;

@end

NS_ASSUME_NONNULL_END
