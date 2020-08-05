//
//  ViewController.m
//  Test
//
//  Created by Jared on 2020/8/4.
//  Copyright © 2020 Jared. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "Test-Swift.h"
#import "Test-Bridging-Header.h"

//#import <MatomoTracker-Swift.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HH *vc = [[HH alloc] init];
    [vc show];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 100, 40);
    btn.backgroundColor = UIColor.blueColor;
    [btn setTitle:@"点我跳转" forState:UIControlStateNormal];
    btn.adjustsImageWhenHighlighted = NO;
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[MatomoTracker shared] trackWithView:@[@"VC", @"view1"] url:[NSURL URLWithString:@"https://matomotest.dapengjiaoyu.cn/matomo/matomo/matomo.php"]];
}

- (void)clickBtn {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            // 更新界面
            FirstViewController *vc = [[FirstViewController alloc] init];
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:vc animated:YES completion:nil];
            
            [[MatomoTracker shared] trackWithEventWithCategory:@"事件维度-分类" action:@"事件维度-行为" name:@"事件维度-名字" number:@9 url:[NSURL URLWithString:@"https://matomotest.dapengjiaoyu.cn/matomo/matomo/matomo.php"]];
            
            NSURL *downloadURL = [NSURL URLWithString:@"https://builds.piwik.org/piwik.zip"];
            [[MatomoTracker shared] trackEvent1WithView:@[@"VC", @"custom tracking parameters"] url:downloadURL customTrackingParameters:@{@"download":[downloadURL absoluteString]}];
            
            
            [[MatomoTracker shared] dispatch];
        });
    });
}

- (void)otherMatomoFunc{
    [[MatomoTracker shared] trackSearchWithQuery:@"搜索词关键词1" category:@"Jared search category" resultCount:15 url:[NSURL URLWithString:@"https://matomotest.dapengjiaoyu.cn/matomo/matomo/matomo.php"]];
    
    [[MatomoTracker shared] trackCampaignWithName:@"campaign_name" keyword:@"campaign_keyword"];
    
    NSURL *downloadURL = [NSURL URLWithString:@"https://builds.piwik.org/piwik.zip"];
    [[MatomoTracker shared] trackEvent1WithView:@[@"VC", @"custom tracking parameters"] url:downloadURL customTrackingParameters:@{@"download":[downloadURL absoluteString]}];
    
//    [[PiwikTracker sharedInstance] sendDownload:@"http://dn.se/some/content/image.png"];
    
    [MatomoTracker shared].userId = @"Jared CHAN";
    
//    [MatomoTracker shared].isOptedOut = YES; // 终止监听
}

@end
