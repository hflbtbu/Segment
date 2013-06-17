//
//  CustomeSegmentControl.h
//  Segment
//
//  Created by 黄富磊 on 13-5-29.
//  Copyright (c) 2013年 huangfulei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CloseAndOpenButton : UIButton
{
    UIImageView     *_arrow;
    UIImageView     *_selectedArrow;
    
    UILabel         *_title;
    BOOL            _isOpen;
}
@property (nonatomic, retain) UILabel   *title;
@property (nonatomic, assign) BOOL      isOpen;
- (void)close;
- (void)open;
@end

@protocol CustomeSegmentControlDelegate;

@interface CustomeSegmentControl : UIView
{
    NSMutableArray  *_buttonArr;
}
@property(nonatomic, assign)id <CustomeSegmentControlDelegate> __unsafe_unretained delegate;
@end

@protocol CustomeSegmentControlDelegate <NSObject>

- (void)segmentDidSelectedAtIndex:(int)index;

@end

