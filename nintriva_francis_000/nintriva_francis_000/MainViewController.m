//
//  MainViewController.m
//  nintriva_francis_000
//
//  Created by Francis on 06/06/14.
//  Copyright (c) 2014 NIntriva. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *contentScroll;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation MainViewController
- (IBAction)actionLogin:(id)sender {
    
    [PFUser logInWithUsernameInBackground:[self.username text] password:[self.password text] block:^(PFUser *user, NSError *error) {
        if(error){
            NSLog(@"ERROR: %@",[error localizedDescription]);
        }
        else{
            NSLog(@"user %@",user);
            //UIStoryboard * sb = [[UIStoryboard alloc] instantiateInitialViewController];
            //HomeViewController * hv =[[HomeViewController alloc] init];
            [self performSegueWithIdentifier:@"loginSegue" sender:self];
            //[self presentViewController:hv animated:YES completion:nil];
        }
    }];

}
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    
    NSLog(@"ident:- %@",identifier);
    id login =[PFUser logInWithUsername:[self.username text] password:[self.username text]];
    if(login)
        return YES;
    else
        return NO;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    //    UIScrollView * scrollView= [self.view.subviews objectAtIndex:0];
    [self.contentScroll setBackgroundColor:[UIColor clearColor]];
    [self.contentScroll setContentOffset:CGPointMake(0,0.0) ];
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
     NSLog(@"Keyboard hiden now");
    [textField resignFirstResponder];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.contentScroll.delegate self];
    
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(onKeyboardHide:) name:UIKeyboardWillHideNotification object:nil];
     [self setDelegatesToTextFieldsInScrollView:self.contentScroll];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(onKeyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
}

-(void)dismissKeyboard {
    [self.username resignFirstResponder];
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
            return YES;
            
        }
        
    }
    [textField resignFirstResponder];
    return YES;
    
}

-(void)onKeyboardHide:(NSNotification *)notification
{
    NSLog(@"Keyboard will hide");
    //[self.username resignFirstResponder];
    //[self.password resignFirstResponder];
    [UIView animateWithDuration:.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self.contentScroll setContentOffset:CGPointMake(0, 50.0) animated:NO];
                         [self.username resignFirstResponder];
                         
                     } completion:nil];
    
}

-(void)onKeyboardShow:(NSNotification *)notification
{
    NSLog(@"Keyboard will show now");
    CGSize keyboardSize = [[[notification userInfo]objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size ;
    [UIView animateWithDuration:.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self.contentScroll setContentOffset:CGPointMake(0, keyboardSize.height) animated:NO];
                     } completion:nil];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
