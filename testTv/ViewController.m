//
//  ViewController.m
//  testTv
//
//  Created by Andre Vellori on 12/09/2015.
//  Copyright © 2015 Andre Vellori. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.rimageView.image = self.limageView.image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)touch1:(id)sender {
    [self roteate:@"1.jpg"];

}

- (IBAction)touch2:(id)sender {
    [self roteate:@"2.jpg"];
}

- (IBAction)touch3:(id)sender {
    [self roteate:@"3.jpg"];
}
#define STARTANIMVALUE  0
#define ENDANIMVALUE ( 5.5 * M_PI)
#define ENDANIM2VALUE ( 10 * M_PI)

#define DURATION1 2
#define DURATION2 1.5


- (void) roteate:(NSString *)imageName
{
    self.limageView.image = self.rimageView.image;
    self.limageView.alpha = 1;
    self.rimageView.alpha = 0;
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1.0/2000;
    self.laView.layer.transform = transform;

    
    UIImage *image = [UIImage imageNamed:imageName];
    self.rimageView.image = image;
    [CATransaction begin];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    animation.duration = DURATION1;
    animation.fromValue = @(STARTANIMVALUE);
    animation.toValue = @(ENDANIMVALUE);
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.fillMode = kCAFillModeBoth;
    
    [CATransaction setCompletionBlock:^{

        CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
        animation2.duration = DURATION2;
        animation2.beginTime = CACurrentMediaTime() ;
        animation2.fromValue = @(ENDANIMVALUE);
        animation2.toValue = @(ENDANIM2VALUE);
        animation2.removedOnCompletion = NO;
        animation2.fillMode = kCAFillModeBoth;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        [self.laView.layer addAnimation:animation2 forKey:@"second"];
        
    }];
    
    [self.laView.layer addAnimation:animation forKey:@"first"];
    
    [CATransaction commit];
    [UIView animateWithDuration:(DURATION2 + DURATION1) / 2 delay:(DURATION1+ DURATION2) / 2 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.limageView.alpha = 0;
        self.rimageView.alpha = 1;
    } completion:^(BOOL finished) { }];

}



@end
