//
//  MainViewController.m
//  nintriva_francis_000
//
//  Created by Francis on 06/06/14.
//  Copyright (c) 2014 NIntriva. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *contentScroll;

@end

@implementation MainViewController

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
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(onKeyboardHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(onKeyboardShow:) name:UIKeyboardWillShowNotification object:nil];
}

-(void)onKeyboardHide:(NSNotification *)notification
{
    NSLog(@"Keyboard will hide");
    
    [UIView animateWithDuration:.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self.contentScroll setContentOffset:CGPointMake(0, 50.0) animated:NO];
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
