//
//  ProjectViewController.m
//  NinTraining000
//
//  Created by Deepak Velekkat on 04/06/14.
//  Copyright (c) 2014 Deepak Velekkat. All rights reserved.
//

#import "ProjectViewController.h"

@interface ProjectViewController ()

@end

@implementation ProjectViewController
- (IBAction)actionClickProject:(id)sender {
    
    UIButton* button=sender;
    

    
#if 0
    
    
    
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                     animations:^(void) {
                    
                         button.transform = CGAffineTransformMakeScale(-1, 1);

                     }
                     completion:^(BOOL finished) {
                         
                         [button.imageView setAlpha:0];
                         [button.titleLabel setAlpha:0];
                         [UIView animateWithDuration:0.5 delay:0.9 options:UIViewAnimationOptionCurveEaseInOut
                                          animations:^(void) {
                                              button.transform = CGAffineTransformMakeScale(1, 1);

                                          }
                                          completion:^(BOOL finished) {
                                              
                                              [button.imageView setAlpha:1];
                                              [button.titleLabel setAlpha:1];
                                              
                                           }
                          ];
                         
                     }
     ];
    
    
#else
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        
        // instantaneously make the image view small (scaled to 1% of its actual size)
        button.transform = CGAffineTransformMakeScale(-0.01, -0.01);
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            // animate it to the identity transform (100% scale)
            button.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished){
            // if you want to do something once the animation finishes, put it here
        }];
        
    } completion:^(BOOL finished) {
        
        
        
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            button.transform = CGAffineTransformMakeScale(1, 1);
            
            
        } completion:^(BOOL finished) {
            
            
            
            
        }];
        
    }];
    
    
#endif
    
    
    
}

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
