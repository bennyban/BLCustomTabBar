//
//  BLCustomeTabBar.h
//  TabBar
//
//  Created by 班磊 on 15/12/9.
//  Copyright © 2015年 bennyban. All rights reserved.
//

#import <UIKit/UIKit.h>


#define BLTabBar_Event_Forward   @"充值"
#define BLTabBar_Event_Middle    @"扫描支付"
#define BLTabBar_Event_Backward  @"我的"

typedef void(^BLTapEventBlock)(NSString *selectEventName);

@interface BLCustomeTabBar : UIView

@property (nonatomic, strong) BLTapEventBlock blTapEvent;

@end
