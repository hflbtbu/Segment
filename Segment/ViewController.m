//
//  ViewController.m
//  Segment
//
//  Created by 黄富磊 on 13-5-29.
//  Copyright (c) 2013年 huangfulei. All rights reserved.
//

#import "ViewController.h"
#import "CustomeSegmentControl.h"
@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    CustomeSegmentControl *segment = [[CustomeSegmentControl alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [self.view addSubview:segment];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
