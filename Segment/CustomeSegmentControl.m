//
//  CustomeSegmentControl.m
//  Segment
//
//  Created by 黄富磊 on 13-5-29.
//  Copyright (c) 2013年 huangfulei. All rights reserved.
//

#import "CustomeSegmentControl.h"

@implementation CloseAndOpenButton
@synthesize title = _title;
@synthesize isOpen = _isOpen;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _isOpen = NO;
        UIImage *arrow = [UIImage imageNamed:@"segmented_arrow.png"];
        _arrow = [[UIImageView alloc] initWithImage:arrow];
        _arrow.frame = CGRectMake(self.bounds.size.width - 40, self.bounds.size.height/2 - arrow.size.height/2, arrow.size.width, arrow.size.height);
        [self addSubview:_arrow];
        
        _title = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, self.frame.size.width, self.bounds.size.height)];
        _title.backgroundColor = [UIColor redColor];
        [self addSubview:_title];
        
        UIImage *selectedArrow = [UIImage imageNamed:@"segmented_arrow.png"];
        _selectedArrow.image = selectedArrow;
        _selectedArrow.frame = CGRectMake(self.bounds.size.width/2 - selectedArrow.size.width/2, self.bounds.size.height - selectedArrow.size.height, selectedArrow.size.width, selectedArrow.size.height);
        [_selectedArrow setHidden:YES];
        [self addSubview:_selectedArrow];
        
        
        
        UIButton * buttongh= [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [buttongh addTarget:self action:@selector(button) forControlEvents:UIControlEventTouchUpInside];
        buttongh.frame = CGRectMake(0, 200, self.bounds.size.width, self.bounds.size.height);
        buttongh.backgroundColor = [UIColor redColor];
        [self addSubview:buttongh];
        
    }
    return self;
}

- (void)button
{
    
}

- (void)close
{
    _isOpen = NO;
    
    _arrow.image = [UIImage imageNamed:@"segmented_arrow.png"];
    [_selectedArrow setHidden:YES];
    
}

- (void)open
{
    _isOpen = YES;
    
    _arrow.image = [UIImage imageNamed:@"segmented_arrow.png"];
    [_selectedArrow setHidden:NO];
}
@end


@interface CustomeSegmentControl()

- (void)buttonClicked:(UIButton *)sender;
- (void)closeAndOpen:(UIButton *)button;


@end

@implementation CustomeSegmentControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat horizontalOffset = self.bounds.size.width/3;
        
        for (int i = 0; i < 3; i++) {
            CloseAndOpenButton *button = [[CloseAndOpenButton alloc] initWithFrame:CGRectMake(i * horizontalOffset, 0, horizontalOffset, self.bounds.size.height)];
            [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
            button.title.text = @"ewterwte";
            button.backgroundColor = [UIColor grayColor];
            button.tag = i;
            if (_buttonArr) {
                _buttonArr = [NSMutableArray arrayWithCapacity:0];
            }
            [_buttonArr addObject:button];
            [self addSubview:button];
            
        }
    }
    return self;
}

- (void)buttonClicked:(UIButton *)sender
{
    [self closeAndOpen:sender];
    if ([_delegate respondsToSelector:@selector(segmentDidSelectedAtIndex:)]) {
        [_delegate segmentDidSelectedAtIndex:sender.tag];
    }
}

- (void)closeAndOpen:(UIButton *)button
{
    for (CloseAndOpenButton* item in _buttonArr)
    {
        if (item == button)
        {
            if (item.isOpen) {
                [item close];
            } else {
                [item open];
            }
        } else {
            [item close];
        }
    
    }
}

@end
