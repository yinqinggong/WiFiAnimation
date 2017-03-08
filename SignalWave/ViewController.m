//
//  ViewController.m
//  SignalWave
//
//  Created by Qinggong on 2017/3/7.
//  Copyright © 2017年 Qinggong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) UIImageView *waveView1;
@property (weak, nonatomic) UIImageView *waveView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blueColor];
    
    UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"signal_strength"]];
    iconView.center = self.view.center;
    [self.view addSubview:iconView];

    UIImageView *waveView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave"]];
    waveView1.center = iconView.center;
    waveView1.bounds = CGRectMake(0.0, 0.0, 100.0, 100.0);
    [self.view addSubview:waveView1];
    self.waveView1 = waveView1;
    
    UIImageView *waveView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave"]];
    waveView2.center = iconView.center;
    waveView2.bounds = CGRectMake(0.0, 0.0, 100.0, 100.0);
    [self.view addSubview:waveView2];
    self.waveView2 = waveView2;
    
    [self testScale];
    
}

- (void)testScale
{
    CAKeyframeAnimation *bounds1 = [CAKeyframeAnimation animation];
    bounds1.keyPath = @"bounds";
    NSValue *value01 = [NSValue valueWithCGRect:CGRectMake(0, 0, 100, 100)];
    NSValue *value011 = [NSValue valueWithCGRect:CGRectMake(0, 0, 100, 100)];
    NSValue *value02 = [NSValue valueWithCGRect:CGRectMake(0, 0, 274, 274)];
    bounds1.values = @[value01,value011, value02];
    bounds1.keyTimes = @[@(0.0), @(0.3), @(1.0)];
    
    CABasicAnimation *opacity1 = [CABasicAnimation animation];
    opacity1.keyPath = @"opacity";
    opacity1.fromValue = @(1.0);
    opacity1.toValue = @(0.2);
    
    CAAnimationGroup *group1 = [CAAnimationGroup animation];
    group1.animations = @[bounds1, opacity1];
    group1.duration = 1.0;
    group1.repeatCount = MAXFLOAT;
    group1.removedOnCompletion = NO;
    group1.fillMode = kCAFillModeForwards;
    
    [self.waveView1.layer addAnimation:group1 forKey:nil];
    
    
    CAKeyframeAnimation *bounds2 = [CAKeyframeAnimation animation];
    bounds2.keyPath = @"bounds";
    NSValue *value11 = [NSValue valueWithCGRect:CGRectMake(0, 0, 100, 100)];
    NSValue *value111 = [NSValue valueWithCGRect:CGRectMake(0, 0, 100, 100)];
    NSValue *value22 = [NSValue valueWithCGRect:CGRectMake(0, 0, 274, 274)];
    NSValue *value222 = [NSValue valueWithCGRect:CGRectMake(0, 0, 274, 274)];
    bounds2.values = @[value11, value111, value22, value222];
    bounds2.keyTimes = @[@(0.0), @(0.0), @(0.7), @(1.0)];
    
    CABasicAnimation *opacity2 = [CABasicAnimation animation];
    opacity2.keyPath = @"opacity";
    opacity2.fromValue = @(1.0);
    opacity2.toValue = @(0.0);
    
    CAAnimationGroup *group2 = [CAAnimationGroup animation];
    group2.animations = @[bounds2, opacity2];
    group2.duration = 1.0;
    group2.repeatCount = MAXFLOAT;
    group2.removedOnCompletion = NO;
    group2.fillMode = kCAFillModeForwards;
    
    [self.waveView2.layer addAnimation:group2 forKey:nil];
}

@end
