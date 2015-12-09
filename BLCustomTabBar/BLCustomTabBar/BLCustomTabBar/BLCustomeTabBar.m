//
//  BLCustomeTabBar.m
//  TabBar
//
//  Created by 班磊 on 15/12/9.
//  Copyright © 2015年 bennyban. All rights reserved.
//

#import "BLCustomeTabBar.h"

#define kTabBar_Gap             10
#define kTabBar_Middle_Width    100
#define kTabBar_TapAreaWidth    ( (self.frame.size.width - kTabBar_Middle_Width)/2 )
#define kTabBar_TapAreaHeight   ( self.frame.size.height - 10 )
#define kTabBar_Title_Color     [UIColor colorWithRed:39.0/255.0 green:157.0/255.0 blue:12.0/255.0 alpha:1.0];

#define kForward_ImageName        @"footnav_icon_addmoney.png"
#define kMiddle_ImageName         @"footnav_icon_code.png"
#define kBackward_ImageName       @"footnav_icon_applyfor.png"

@interface BLCustomeTabBar ()

@property (nonatomic, strong) UIButton *btnForward;   /**< 视图前按钮 */
@property (nonatomic, strong) UIButton *btnMiddle;    /**< 视图中按钮 */
@property (nonatomic, strong) UIButton *btnBackward;  /**< 视图后按钮 */

@property (nonatomic, assign) CGFloat height;

@end

@implementation BLCustomeTabBar

- (id)init
{
    self = [super init];
    if (self) {
        self.exclusiveTouch = YES;
        [self initView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.exclusiveTouch = YES;
        [self initView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.exclusiveTouch = YES;
        [self initView];
    }
    return self;
}

- (void)initView
{
    // 背景添加
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    bgImageView.image = [UIImage imageNamed:@"footnav_bg.png"];
    [self addSubview:bgImageView];
    
    // Forward
    CGFloat width  = 35;
    CGFloat height = 35;
    CGFloat orignX = ((self.frame.size.width - kTabBar_Middle_Width)/2 - width)/2;
    CGFloat orignY = (self.frame.size.height - 10 - height - kTabBar_Gap)/2 + 10;
    
    UIImageView *forwardImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:kForward_ImageName]];
    forwardImageView.frame = CGRectMake(orignX, orignY, width, height);
    forwardImageView.backgroundColor = [UIColor clearColor];
    [self addSubview:forwardImageView];
    
    orignX = 0;
    orignY += forwardImageView.frame.size.height;
    width  = (self.frame.size.width - kTabBar_Middle_Width)/2;
    height = 10;
    
    UILabel *lbForward = [[UILabel alloc] initWithFrame:CGRectMake(orignX, orignY, width, height)];
    lbForward.textAlignment = NSTextAlignmentCenter;
    lbForward.text = BLTabBar_Event_Forward;
    lbForward.textColor = kTabBar_Title_Color;
    lbForward.backgroundColor = [UIColor clearColor];
    lbForward.font = [UIFont systemFontOfSize:12];
    [self addSubview:lbForward];
    
    orignX = 0;
    orignY = 10;
    width  = kTabBar_TapAreaWidth;
    height = kTabBar_TapAreaHeight;
    
    _btnForward = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnForward.frame = CGRectMake(orignX, orignY, width, height);
    [_btnForward addTarget:self action:@selector(doActionToTap:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_btnForward];
    
    // Middle
    
    width  = 35;
    height = 35;
    orignX = kTabBar_TapAreaWidth + (kTabBar_Middle_Width - width)/2;
    orignY = forwardImageView.frame.origin.y;
    
    UIImageView *middleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:kMiddle_ImageName]];
    middleImageView.frame = CGRectMake(orignX, orignY, width, height);
    [self addSubview:middleImageView];
    
    orignX = kTabBar_TapAreaWidth;
    orignY = lbForward.frame.origin.y;
    width  = kTabBar_Middle_Width;
    height = 10;
    
    UILabel *lbMiddle = [[UILabel alloc] initWithFrame:CGRectMake(orignX, orignY, width, height)];
    lbMiddle.textAlignment = NSTextAlignmentCenter;
    lbMiddle.text = BLTabBar_Event_Middle;
    lbMiddle.textColor = [UIColor whiteColor];
    lbMiddle.backgroundColor = [UIColor clearColor];
    lbMiddle.font = [UIFont systemFontOfSize:12];
    [self addSubview:lbMiddle];
    
    orignX = kTabBar_TapAreaWidth;
    orignY = 10;
    width  = kTabBar_TapAreaWidth;
    height = kTabBar_TapAreaHeight;
    
    _btnMiddle = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnMiddle.frame = CGRectMake(orignX, orignY, width, height);
    [_btnMiddle addTarget:self action:@selector(doActionToTap:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_btnMiddle];
    
    // Backward
    
    width  = 35;
    height = 35;
    orignX = kTabBar_TapAreaWidth + kTabBar_Middle_Width + (kTabBar_TapAreaWidth - width)/2;
    orignY = forwardImageView.frame.origin.y;
    
    UIImageView *backwardImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:kBackward_ImageName]];
    backwardImageView.frame = CGRectMake(orignX, orignY, width, height);
    [self addSubview:backwardImageView];
    
    orignX = kTabBar_TapAreaWidth + kTabBar_Middle_Width;
    orignY = lbForward.frame.origin.y;
    width  = kTabBar_TapAreaWidth;
    height = 10;
    
    UILabel *lbBackward = [[UILabel alloc] initWithFrame:CGRectMake(orignX, orignY, width, height)];
    lbBackward.textAlignment = NSTextAlignmentCenter;
    lbBackward.text = BLTabBar_Event_Backward;
    lbBackward.textColor = kTabBar_Title_Color;
    lbBackward.backgroundColor = [UIColor clearColor];
    lbBackward.font = [UIFont systemFontOfSize:12];
    [self addSubview:lbBackward];
    
    orignX = kTabBar_TapAreaWidth + kTabBar_Middle_Width;
    orignY = 10;
    width  = kTabBar_TapAreaWidth;
    height = kTabBar_TapAreaHeight;
    
    _btnBackward = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnBackward.frame = CGRectMake(orignX, orignY, width, height);
    [_btnBackward addTarget:self action:@selector(doActionToTap:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_btnBackward];
}

#pragma mark - 点击事件
#pragma mark
- (void)doActionToTap:(UIButton *)sender
{
    if (sender == _btnForward) {
        _blTapEvent ( BLTabBar_Event_Forward );
    } else if (sender == _btnMiddle)
    {
        _blTapEvent ( BLTabBar_Event_Middle );
    } else if (sender == _btnBackward)
    {
        _blTapEvent ( BLTabBar_Event_Backward );
    }
}

@end
