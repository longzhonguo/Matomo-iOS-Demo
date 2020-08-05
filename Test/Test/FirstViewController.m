//
//  FirstViewController.m
//  Test
//
//  Created by Jared on 2020/8/4.
//  Copyright © 2020 Jared. All rights reserved.
//

#import "FirstViewController.h"

#import "Test-Swift.h"
#import "Test-Bridging-Header.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.lightGrayColor;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(200, 200, 100, 40);
    btn.backgroundColor = UIColor.redColor;
    [btn setTitle:@"点我返回" forState:UIControlStateNormal];
    btn.adjustsImageWhenHighlighted = NO;
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[MatomoTracker shared] trackWithView:@[@"VC", @"view2"] url:[NSURL URLWithString:@"https://matomotest.dapengjiaoyu.cn/matomo/matomo/matomo.php"]];
//    [[MatomoTracker shared] trackWithView:@[@"VC", @"view2"] url:@"https://matomotest.dapengjiaoyu.cn/matomo/matomo/matomo.php"];
}

- (void)clickBtn {
    [[MatomoTracker shared] dispatch];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
