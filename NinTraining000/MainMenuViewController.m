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
