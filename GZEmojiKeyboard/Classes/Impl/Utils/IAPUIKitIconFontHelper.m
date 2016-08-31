//
//  IAPUIKitIconFontHelper.m
//  GZEmojiKeyboard
//
//  Created by zhaoy on 31/8/16.
//  Copyright © 2016 com.gz. All rights reserved.
//

#import "IAPUIKitIconFontHelper.h"

@implementation IAPUIKitIconFontHelper

+ (NSString *)_charStringFromHexString:(NSString *)string
{
    if (![string length]) {
        return nil;
    }
    unsigned int result = 0;
    NSScanner *scanner = [NSScanner scannerWithString:string];
    
    [scanner setScanLocation:0];
    [scanner scanHexInt:&result];
    return [NSString stringWithFormat:@"%C", (unichar)result];
}

+ (UIFont *)iconFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"iconfont" size:size];
}

+ (NSString *)stringWithIdentifier:(NSString *)identifier
{
    return [self _charStringFromHexString:identifier];
}

+ (UIBarButtonItem *)barButtonItemWithIdentifier:(NSString *)identifier target:(id)target selector:(SEL)selector
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [IAPUIKitIconFontHelper iconFontWithSize:23];
    [button setTitle:[self _charStringFromHexString:identifier] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRGB:0xffffff alpha:0.8] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRGB:0xffffff alpha:0.5] forState:UIControlStateHighlighted];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, 25, 25);
    button.tag = 9997;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return item;
}


+ (UILabel *)labelWithIdentifier:(NSString *)identifier tintColor:(UIColor *)color fontSize:(CGFloat)fontSize
{
    UILabel *label = [[UILabel alloc] init];
    label.font = [IAPUIKitIconFontHelper iconFontWithSize:fontSize];
    label.textColor = color;
    label.text = [self _charStringFromHexString:identifier];
    return label;
}

+ (UIButton *)buttonWithIdentifier:(NSString *)identifier tintColor:(UIColor *)color fontSize:(CGFloat)fontSize
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [IAPUIKitIconFontHelper iconFontWithSize:fontSize];
    button.titleLabel.textColor = color;
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setTitle:[self _charStringFromHexString:identifier] forState:UIControlStateNormal];
    return button;
}

+ (UIImage *)imageWithIdentifier:(NSString *)identifier tintColor:(UIColor *)color size:(CGSize)size
{
    UIFont *font = [IAPUIKitIconFontHelper iconFontWithSize:MIN(size.width, size.height)];
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    [color set];
    NSString *iconStr = [IAPUIKitIconFontHelper stringWithIdentifier:identifier];
    [iconStr drawInRect:CGRectMake(0, 0, size.width, size.height) withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:color}];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


@end
