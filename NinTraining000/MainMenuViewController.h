//
//  MainMenuViewController.h
//  NinTraining000
//
//  Created by Deepak Velekkat on 04/06/14.
//  Copyright (c) 2014 Deepak Velekkat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NINViewController.h"

@protocol MainMenuViewControllerDelegate <NSObject>

-(void)didLogOut;

@end


@interface MainMenuViewController : NINViewController
@property(strong,nonatomic) id<MainMenuViewControllerDelegate> delegate;

@end
