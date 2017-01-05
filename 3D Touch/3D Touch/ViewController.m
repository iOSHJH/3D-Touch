//
//  ViewController.m
//  3D Touch
//
//  Created by WONG on 2017/1/5.
//  Copyright © 2017年 yunshi. All rights reserved.
//

#import "ViewController.h"
#import "Touch1ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel * touchLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.touchLabel];
    
    [self check3DTouch];
}

- (void)check3DTouch {
    // 如果开启了3D touch
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    {
        [self registerForPreviewingWithDelegate:(id)self sourceView:self.touchLabel];
    }
}

#pragma mark - UIViewControllerPreviewingDelegate
/***  触发3D Touch调用*/
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    //防止重复加入
    if ([self.presentedViewController isKindOfClass:[Touch1ViewController class]])
    {
        return nil;
    }
    else
    {
        Touch1ViewController *vc = [[Touch1ViewController alloc] init];
        return vc;
    }
}

- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {

}

- (UILabel *)touchLabel {
    if (!_touchLabel) {
        _touchLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 300, 100, 30)];
        _touchLabel.userInteractionEnabled = YES;
        _touchLabel.textAlignment = NSTextAlignmentCenter;
        _touchLabel.text = @"3D Touch";
        _touchLabel.backgroundColor = [UIColor orangeColor];
    }
    return _touchLabel;
}


@end
