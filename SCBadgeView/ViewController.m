//
//  ViewController.m
//  SCBadgeView
//
//  Created by sichenwang on 16/3/25.
//  Copyright © 2016年 sichenwang. All rights reserved.
//

#import "ViewController.h"
#import "SCBadgeView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet SCBadgeView *badgeXib;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    SCBadgeView *badgeLeft = [[SCBadgeView alloc] initWithFrame:CGRectMake(100, 100, 0, 0) alignment:SCBadgeViewAlignmentLeft type:SCBadgeViewTypeDefault];
    badgeLeft.number = 12;
    [self.view addSubview:badgeLeft];
    
    SCBadgeView *badgeCenter = [[SCBadgeView alloc] initWithFrame:CGRectMake(100, 130, 0, 0) alignment:SCBadgeViewAlignmentCenter type:SCBadgeViewTypeWhiteBorder];
    badgeCenter.number = 23;
    [self.view addSubview:badgeCenter];

    SCBadgeView *badgeRight = [[SCBadgeView alloc] initWithFrame:CGRectMake(100, 160, 0, 0) alignment:SCBadgeViewAlignmentRight type:SCBadgeViewTypeWhiteBorder];
    badgeRight.number = 55;
    [self.view addSubview:badgeRight];
//    [_badge mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//    }];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        badgeLeft.number = 991;
        badgeCenter.number = 123;
        badgeRight.number = 123;
        badgeRight.backgroundColor = [UIColor blueColor];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.badgeXib.number = 123;
    });
}

@end
