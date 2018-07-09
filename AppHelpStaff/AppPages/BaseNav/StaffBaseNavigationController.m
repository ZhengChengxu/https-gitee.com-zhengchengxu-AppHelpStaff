//
//  StaffBaseNavigationController.m
//  AppHelpStaff
//
//  Created by Zheng on 2018/7/9.
//  Copyright © 2018年 app.help.staff.zhengcx. All rights reserved.
//

#import "StaffBaseNavigationController.h"

@interface StaffBaseNavigationController ()

@end

@implementation StaffBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationBar.translucent = NO;
    self.navigationBar.barTintColor = kBlueColor;

}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.hidesBottomBarWhenPushed = self.childViewControllers.count > 0? YES: NO;
    [super pushViewController:viewController animated:animated];
}



@end
