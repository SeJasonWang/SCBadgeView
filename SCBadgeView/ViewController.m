//
//  ViewController.m
//  SCBadgeView
//
//  Created by sichenwang on 16/3/25.
//  Copyright © 2016年 sichenwang. All rights reserved.
//

#import "ViewController.h"
#import "SCBadgeView.h"
#import "Masonry.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet SCBadgeView *badgeXib;

@end

@implementation ViewController
{
    SCBadgeView *_badge;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _badge = [[SCBadgeView alloc] init];
    [self.view addSubview:_badge];
    [_badge mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _badge.number = 99;
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.badgeXib.number = 12;
    });
}

//- (void)viewDidLayoutSubviews {
//    [super viewDidLayoutSubviews];
//    
//    _badge.frame = CGRectMake(100, 100, 30, 30);
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
