//
//  ViewController.h
//  testTv
//
//  Created by Andre Vellori on 12/09/2015.
//  Copyright © 2015 Andre Vellori. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label;
- (IBAction)touch1:(id)sender;
- (IBAction)touch2:(id)sender;
- (IBAction)touch3:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *laView;
@property (weak, nonatomic) IBOutlet UIImageView *limageView;
@property (weak, nonatomic) IBOutlet UIImageView *rimageView;

@end

