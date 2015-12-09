//
//  ViewController.m
//  BLCustomTabBar
//
//  Created by 班磊 on 15/12/9.
//  Copyright © 2015年 bennyban. All rights reserved.
//

#import "ViewController.h"
#import "BLCustomeTabBar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *tabbar_BGImage = [UIImage imageNamed:@"footnav_bg.png"];
    
    CGFloat width  = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = tabbar_BGImage.size.height *width/tabbar_BGImage.size.width;
    CGFloat orignX = 0;
    CGFloat orignY = [UIScreen mainScreen].bounds.size.height - height;
    
    __weak typeof(self) weakSelf = self;
    BLCustomeTabBar *customTabbar = [[BLCustomeTabBar alloc] initWithFrame:CGRectMake(orignX, orignY, width, height)];
    customTabbar.blTapEvent = ^(NSString *selectEventName){
        if ([selectEventName isEqualToString:BLTabBar_Event_Forward]) {
            [weakSelf doActionToRecharge];
        } else if ([selectEventName isEqualToString:BLTabBar_Event_Middle])
        {
            [weakSelf doActionToQRScan];
        } else if ([selectEventName isEqualToString:BLTabBar_Event_Backward])
        {
            [weakSelf doActionToMy];
        }
    };
    [self.view addSubview:customTabbar];
    
}

- (void)doActionToRecharge
{
    NSLog(@"充值");
}

- (void)doActionToQRScan
{
    NSLog(@"QR扫描");
}

- (void)doActionToMy
{
    NSLog(@"我的");
}

@end
