//
//  SecondViewController.m
//  LongImage
//
//  Created by fx on 16/4/21.
//  Copyright © 2016年 fx. All rights reserved.
//

#import "SecondViewController.h"
#import "KLLayout.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIView *changeSizeView;

@property (nonatomic) CGFloat viewHeightScale;

@property (weak, nonatomic) IBOutlet UIView *testView;
@property (weak, nonatomic) IBOutlet UILabel *testLabel1;
@property (weak, nonatomic) IBOutlet UILabel *testLabel2;
@property (weak, nonatomic) IBOutlet UIImageView *testImageView;
@property (weak, nonatomic) IBOutlet UIButton *testBtn;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewHeightScale = 1.f;
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchView:)];
    [self.view addGestureRecognizer:pinchGesture];
    
    [self testLayoutViews];
    [self.testImageView setImage:[UIImage imageNamed:@"karl.jpeg"]];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[KLLayoutEngine sharedEngine] setDebugModeEnable:YES];
    });
}

- (void)testLayoutViews
{
    [self.changeSizeView kl_makeLayoutElement:^(KLLayoutElementMaker *make) {
        make.top.multipliedBy(0.0f).offset(70);
        make.left.offset(10);
        make.height.multipliedBy(self.viewHeightScale * 0.5f).offset(100);
        make.width.multipliedBy(self.viewHeightScale * 0.8f).offset(50);
    }];

    [self.testLabel1 kl_makeLayoutElement:^(KLLayoutElementMaker *make) {
        make.top.offset(10);
        make.left.offset(10);
        make.width.multipliedBy(0.6f);
        make.height.multipliedBy(0.1f);
    }];
    
    [self.testLabel2 kl_makeLayoutElement:^(KLLayoutElementMaker *make) {
        make.top.offset(60);
        make.left.offset(10);
        make.width.multipliedBy(0.6f);
        make.height.multipliedBy(0.1f);
    }];
    
    [self.testView kl_makeLayoutElement:^(KLLayoutElementMaker *make) {
        make.top.flexible(YES);
        make.left.flexible(YES);
        make.width.multipliedBy(0.2f);
        make.height.multipliedBy(0.2f);
        make.bottom.offset(20).flexible(NO);
        make.right.offset(20).flexible(NO);
    }];
    
    [self.testBtn kl_makeLayoutElement:^(KLLayoutElementMaker *make) {
        make.width.multipliedBy(0.4f);
        make.top.offset(120);
        make.right.offset(10);
    }];
    
    [self.testImageView kl_makeLayoutElement:^(KLLayoutElementMaker *make) {
        make.width.flexible(YES);
        make.height.flexible(YES);
        make.top.offset(200).flexible(NO);
        make.bottom.offset(10).flexible(NO);
        make.left.offset(10).flexible(NO);
        make.right.offset(100).flexible(NO);
        
    }];
}

- (void) pinchView:(UIPinchGestureRecognizer *)pinchGestureRecognizer
{
    if (pinchGestureRecognizer.state == UIGestureRecognizerStateBegan || pinchGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        if (pinchGestureRecognizer.scale > 0.3f) {
            self.viewHeightScale = pinchGestureRecognizer.scale;
        }
        
        
        [self testLayoutViews];
        
//        [self.changeSizeView kl_makeLayoutElement:^(KLLayoutElementMaker *make) {
//            make.top.offset(70);
//            make.left.offset(10);
//            make.height.multipliedBy(self.viewHeightScale * 0.5f);
//            make.width.multipliedBy(self.viewHeightScale * 0.8f);
//        }];
    }
}

@end
