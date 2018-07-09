//
//  StaffTabBarConfig.m
//  AppHelpStaff
//
//  Created by Zheng on 2018/7/9.
//  Copyright © 2018年 app.help.staff.zhengcx. All rights reserved.
//

#import "StaffTabBarConfig.h"
#import "StaffBaseNavigationController.h"

@interface StaffTabBarConfig ()

@property (nonatomic, readwrite, strong) CYLTabBarController *tabBarController;

@end

@implementation StaffTabBarConfig

- (CYLTabBarController *)tabBarController {
    if (_tabBarController == nil) {
        /**
         * 以下两行代码目的在于手动设置让TabBarItem只显示图标，不显示文字，并让图标垂直居中。
         * 等效于在 `-tabBarItemsAttributesForController` 方法中不传 `CYLTabBarItemTitle` 字段。
         * 更推荐后一种做法。
         */
        UIEdgeInsets imageInsets = UIEdgeInsetsZero;//UIEdgeInsetsMake(4.5, 0, -4.5, 0);
        //        UIEdgeInsets imageInsets = UIEdgeInsetsMake(4.5, 0, -4.5, 0);
        UIOffset titlePositionAdjustment = UIOffsetZero;//UIOffsetMake(0, MAXFLOAT);
        
        CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers tabBarItemsAttributes:self.tabBarItemsAttributesForController imageInsets:imageInsets titlePositionAdjustment:titlePositionAdjustment];
        
        [self customizeTabBarAppearance:tabBarController];
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}

- (NSArray *)viewControllers {
    
    NSArray<NSString *> *namesArr = @[@"UIViewController",
                                      @"UIViewController",
                                      @"UIViewController",
                                      @"UIViewController"];
    
    NSMutableArray *viewControllers = [NSMutableArray array];
    
    
    [namesArr enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController *vc = [[NSClassFromString(obj) alloc] init];
        StaffBaseNavigationController *navVC = [[StaffBaseNavigationController alloc] initWithRootViewController:vc];
        [viewControllers addObject:navVC];
        [vc viewDidLoad];
    }];
    
    return [viewControllers copy];
    
}

- (NSArray *)tabBarItemsAttributesForController {
    
    NSDictionary *home = [self getTabBarItemsAttributesWithTitle:@"首页"
                                                 witlNormalImage:@"home_n"
                                               withSelectedImage:@"home_s"];
    
    NSDictionary *applyDetail = [self getTabBarItemsAttributesWithTitle:@"报名详情"
                                                        witlNormalImage:@"apply_n"
                                                      withSelectedImage:@"apply_s"];
    
    NSDictionary *qrCode = [self getTabBarItemsAttributesWithTitle:@"二维码"
                                                   witlNormalImage:@"qr_code_n"
                                                 withSelectedImage:@"qr_code_s"];
    
    NSDictionary *mine = [self getTabBarItemsAttributesWithTitle:@"我的"
                                                 witlNormalImage:@"mine_n"
                                               withSelectedImage:@"mine_s"];
    
    return @[home,applyDetail,qrCode,mine];;
}

- (NSDictionary *)getTabBarItemsAttributesWithTitle:(NSString *)title
                                    witlNormalImage:(NSString *)normal
                                  withSelectedImage:(NSString *)selected {
    return @{CYLTabBarItemTitle:title,
             CYLTabBarItemImage:normal,
             CYLTabBarItemSelectedImage:selected};
}

/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性等等
 */
- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    
    //#warning CUSTOMIZE YOUR TABBAR APPEARANCE
    // Customize UITabBar height
    // 自定义 TabBar 高度
    //     tabBarController.tabBarHeight = CYLTabBarControllerHeight;
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
    // [self customizeTabBarSelectionIndicatorImage];
    
    // update TabBar when TabBarItem width did update
    // If your app need support UIDeviceOrientationLandscapeLeft or UIDeviceOrientationLandscapeRight，
    // remove the comment '//'
    // 如果你的App需要支持横竖屏，请使用该方法移除注释 '//'
    // [self updateTabBarCustomizationWhenTabBarItemWidthDidUpdate];
    

    NSString *imageName = APPPrex_IphoneX ? @"tab_bar_bg_x":@"tab_bar_bg";
    [tabBarController.tabBar setBackgroundImage:[UIImage imageNamed:imageName]];
    
//    [[UITabBar appearance] setBackgroundColor:kBlueColor];
    //    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tapbar_top_line"]];

    // set the bar background image
    
    // remove the bar system shadow image
    // 去除 TabBar 自带的顶部阴影
    // [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}

#pragma mark CYLTabBarControllerDelegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control {
    
}


@end
