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
    UIButton *_button;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initializeSubViews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initializeSubViews];
    }
    return self;
}

- (void)initializeSubViews {
    self.hidden = YES;
    self.backgroundColor = [UIColor clearColor];
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.adjustsImageWhenHighlighted = NO;
    _button.titleLabel.font = [UIFont systemFontOfSize:10];
    [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:_button];
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:CGRectMake(frame.origin.x, frame.origin.y, _button.frame.size.width, _button.frame.size.height)];
}

- (void)setBackgroundImageWithFrame:(CGRect)frame {
    if (_button.currentImage.size.height != frame.size.height) {
        UIImage *image = [self backgroundImageWithColor:[UIColor colorWithRed:255 / 255.0 green:102 / 255.0 blue:102 / 255.0 alpha:1] size:CGSizeMake(frame.size.height, frame.size.height)];
        CGFloat width = image.size.width;
        image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0, width / 2 - 0.5, 0, width / 2 - 0.5) resizingMode:UIImageResizingModeStretch];
        [_button setBackgroundImage:image forState:UIControlStateNormal];
    }
}

- (void)setNumber:(NSInteger)number {
    if (_number != number) {
        _number = number;
        
        NSString *text;
        if (number > 0 && number < 100) {
            text = [NSString stringWithFormat:@"%zd", number];
            self.hidden = NO;
        } else if (number >= 100) {
            text = @"99+";
            self.hidden = NO;
        } else {
            text = @"";
            self.hidden = YES;
        }
        [_button setTitle:text forState:UIControlStateNormal];
        [_button.titleLabel sizeToFit];
        CGRect frame = _button.titleLabel.frame;
        if (_button.titleLabel.bounds.size.height >= _button.titleLabel.bounds.size.width) {
            frame.size.height = _button.titleLabel.bounds.size.height + 5;
            frame.size.width = frame.size.height;
            frame.origin.x -= 2.5;
            frame.origin.y -= 2.5;
        } else {
            frame.size.height = _button.titleLabel.bounds.size.height + 5;
            frame.size.width = _button.titleLabel.bounds.size.width + 9;
            frame.origin.x -= 4.5;
            frame.origin.y -= 2.5;
        }
        [self setBackgroundImageWithFrame:frame];
        _button.frame = frame;
        self.bounds = frame;
    }
}

- (UIImage *)backgroundImageWithColor:(UIColor *)color size:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, [color CGColor]);
    CGContextFillRect(ctx, CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO , 0);
    ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, image.size.width, image.size.height));
    CGContextClip(ctx);
    CGContextStrokePath(ctx);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    UIImage *circleImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return circleImage;
}

@end
