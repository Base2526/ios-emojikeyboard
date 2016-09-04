//
//  ViewController.m
//  GZEmojiKeyboardDemo
//
//  Created by zhaoy on 28/8/16.
//  Copyright © 2016 com.gz. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import <GZEmojiKeyboard/GZStickerPanelControl.h>

/**
 *  TODO: 1. support screen roration, ipad 2. support gif
 */
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *emojiInput;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    GZStickerPanelControl* emoControl = [GZStickerPanelControl new];
    emoControl.associatedInput = self.emojiInput;
    [self.view addSubview:emoControl];
    
    [emoControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view.mas_leading);
        make.bottom.equalTo(self.view.mas_bottom);
        make.width.equalTo(self.view.mas_width);
        make.height.equalTo([NSNumber numberWithFloat:220.0f]);
    }];
    
    self.view.userInteractionEnabled = YES;
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self
                                                                            action:@selector(dismissKeyboard)]];
}

- (void)dismissKeyboard
{
    [self.emojiInput resignFirstResponder];
}


@end
