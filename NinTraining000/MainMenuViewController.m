//
//  MainMenuViewController.m
//  NinTraining000
//
//  Created by Deepak Velekkat on 04/06/14.
//  Copyright (c) 2014 Deepak Velekkat. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController
- (IBAction)actionLogout:(id)sender {
	NSLog(@"logging out");
    
	[self.delegate didLogOut];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		// Custom initialization
	}
	return self;
}

- (void)animateMenuButtonsOnEntry {
	// Do any additional setup after loading the view.
    
	[[self.view.subviews filteredArrayUsingPredicate:[NSPredicate predicateWithBlock: ^BOOL (id evaluatedObject, NSDictionary *bindings) {
        return [evaluatedObject isKindOfClass:[UIButton class]];
    }]] enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
	    UIButton *button = obj;
        
        
	    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations: ^{
            // instantaneously make the image view small (scaled to 1% of its actual size)
            button.transform = CGAffineTransformMakeScale(0.01, 0.01);
            [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations: ^{
                // animate it to the identity transform (100% scale)
                button.transform = CGAffineTransformIdentity;
            } completion: ^(BOOL finished) {
                // if you want to do something once the animation finishes, put it here
            }];
        } completion: ^(BOOL finished) {
            [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations: ^{
                button.transform = CGAffineTransformMakeScale(1, 1);
            } completion: ^(BOOL finished) {
            }];
        }];
	}];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	[self animateMenuButtonsOnEntry];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(applicationDidBecomeActiveAtMainMenu)
                                                name:UIApplicationDidBecomeActiveNotification
                                              object:nil];
}

-(void)applicationDidBecomeActiveAtMainMenu
{
    NSLog(@"App came active at Main menu");
    
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSLog(@"View did appear for mainmenu");
    
}

@end
