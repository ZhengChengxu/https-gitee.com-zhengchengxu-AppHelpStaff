//
//  OftenDefines.h
//  AppHelpStaff
//
//  Created by Zheng on 2018/7/9.
//  Copyright © 2018年 app.help.staff.zhengcx. All rights reserved.
//

#ifndef OftenDefines_h
#define OftenDefines_h

#define kBoldFont(size) [UIFont boldSystemFontOfSize:size]
#define kFont(size) [UIFont systemFontOfSize:size]

#define APPPrex_IphoneX ((CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(375.f, 812.f)) || CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(812.f, 375.f))) ? YES : NO)
#define APPPrex_StatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height
#define APPPrex_TabbarBottom (APPPrex_IphoneX? 34.f: 0.f)

#define kRGB(R,G,B,A) [UIColor colorWithRed:R/255. green:G/255. blue:B/255. alpha:A]
#define kRandomColor kRGB(arc4random()%255, arc4random()%255, arc4random()%255, 1)
#define kBlueColor kRGB(46, 141, 218, 1)

#define kScale(A) [UIScreen mainScreen].bounds.size.width/375.*A


#endif /* OftenDefines_h */
