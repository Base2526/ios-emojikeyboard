//
//  GZStickerPanelLayoutStrategy.m
//  MobileFramework
//
//  Created by zhaoy on 15/10/15.
//  Copyright © 2015 com.gz. All rights reserved.
//

#import "GZStickerPanelLayoutStrategy.h"
#import "GZStickerPanelControl.h"
#import "GZCommonUtils.h"

@implementation GZStickerPanelLayoutStrategy

- (instancetype)init {
    self = [super init];
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = CGSizeMake([GZCommonUtils getMainScreenWidth], GZ_MESSAGE_BOT_STICKER_PANEL_HEIGHT - 15);
    self.sectionInset = UIEdgeInsetsZero;
    self.minimumInteritemSpacing = 0.0;
    self.minimumLineSpacing = 0.0;
    return self;
}

- (CGSize)collectionViewContentSize {
    
    return  CGSizeMake(self.numberOfPage * [GZCommonUtils getMainScreenWidth], GZ_MESSAGE_BOT_STICKER_PANEL_HEIGHT - GZ_EMO_PACK_BAR_HEIGHT - 15);
}

@end
