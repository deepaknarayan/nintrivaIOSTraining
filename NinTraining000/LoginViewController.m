//
//  MainViewController.m
//  NinTraining000
//
//  Created by Deepak Velekkat on 03/06/14.
//  Copyright (c) 2014 Deepak Velekkat. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setDelegatesToTextFieldsInScrollView:(UIScrollView *)contentScrollView
{
    [contentScrollView.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if([obj isKindOfClass:[UITextField class]])
        {
            [obj setDelegate:self];
            
        }
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    UIScrollView* contentScrollView=[self.view.subviews objectAtIndex:0];
    
    [contentScrollView setBackgroundColor:[UIColor clearColor]];
    
    [contentScrollView setContentOffset:CGPointMake(0, 50.0)];
    
    
    [self setDelegatesToTextFieldsInScrollView:contentScrollView];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(onKeyboardHide:) name:UIKeyboardWillHideNotification object:nil];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(onKeyboardShow:) name:UIKeyboardWillShowNotification object:nil];

    
    
    
    }

-(void)viewWillAppear:(BOOL)animated
{
    [[UINavigationBar appearance] setTitleTextAttributes: @{
                                                            UITextAttributeTextColor: [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0],
                                                            UITextAttributeTextShadowColor: [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8],
                                                            UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 1.0f)],
                                                            UITextAttributeFont: [UIFont fontWithName:@"Lobster1.4" size:0.0f]
                                                            }];
    
    
    UIScrollView* contentScrollView=[self.view.subviews objectAtIndex:0];
    
    [contentScrollView setBackgroundColor:[UIColor clearColor]];
    
    [contentScrollView setContentOffset:CGPointMake(0, 50.0)];
    
}

-(void)onKeyboardHide:(NSNotification *)notification
{
    //keyboard will hide
    
    NSLog(@"Keyboard will hide now");
    
    
    
    
    UIScrollView* contentScrollView=[self.view.subviews objectAtIndex:0];
    
    
    
    [UIView animateWithDuration:.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [contentScrollView setContentOffset:CGPointMake(0.0, 50.0) animated:NO];
                         
                     } completion:nil];
    
}

-(void)onKeyboardShow:(NSNotification *)notification
{
    //keyboard will hide
    
    NSLog(@"Keyboard will show now");
    
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;

    
    UIScrollView* contentScrollView=[self.view.subviews objectAtIndex:0];
    
    
    
    
    [UIView animateWithDuration:.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [contentScrollView setContentOffset:CGPointMake(0.0, keyboardSize.height) animated:NO];
                     } completion:nil];
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    /* if the textfield has the next button as return, then move to the next field.
     else hide the keyboard
     */
    
    __block UITextField* next=nil;
    
    
    
    if(textField.returnKeyType==UIReturnKeyNext)
    {
        [textField.superview.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if([obj isKindOfClass:[UITextField class]])
            {
                if(obj!=textField)
                {
                    *stop=YES;
                    next=obj;
                    
                
                }
            }
        }];
        
        if(next)
        {
            [next becomeFirstResponder];
            return NO;
            
        }
  
    }
    [textField resignFirstResponder];
    return NO;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didLogOut
{
    NSLog(@"Dismissing viewcontroller");
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"segueToMainMenu"])
    {
        NSLog(@"Segue to Main menu");

        UINavigationController* nav=segue.destinationViewController;
        MainMenuViewController* mmvc=[nav.childViewControllers objectAtIndex:0];
        mmvc.delegate=self;
        
        
    }
}

@end
