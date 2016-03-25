//
//  SCBadgeView.m
//  Higo
//
//  Created by sichenwang on 16/3/25.
//  Copyright © 2016年 Ryan. All rights reserved.
//

#import "SCBadgeView.h"

@implementation SCBadgeView
{
    UIImageView *_imageView;
    UILabel *_textLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.hidden = YES;
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SCBadgeView.bundle/badge_round_bg"]];
        [self addSubview:_imageView];
        _textLabel = [[UILabel alloc] init];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.textColor = [UIColor whiteColor];
        _textLabel.font = [UIFont systemFontOfSize:10];
        _textLabel.adjustsFontSizeToFitWidth = YES;
        _textLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
        [self addSubview:_textLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _imageView.frame = self.bounds;
    _textLabel.frame = self.bounds;
}

- (void)setNumber:(NSInteger)number {
    if (_number != number) {
        _number = number;
        
        if (number > 0 && number < 100) {
            _textLabel.text = [NSString stringWithFormat:@"%zd", number];
            self.hidden = NO;
        } else if (number >= 100) {
            _textLabel.text = @"99+";
            self.hidden = NO;
        } else {
            _textLabel.text = @"";
            self.hidden = YES;
        }
    }
}

@end
