//
//  NINMenuButton.m
//  NinTraining000
//
//  Created by Deepak Velekkat on 04/06/14.
//  Copyright (c) 2014 Deepak Velekkat. All rights reserved.
//

#import "NINMenuButton.h"

@implementation NINMenuButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)layoutSubviews
{
   // self.imageView.center=self.center;
   // self.titleLabel.frame=CGRectMake(0, 0, self.titleLabel.frame.size.width, self.titleLabel.frame.size.height);
    
    NSLog(@"Imageview is %@",self.imageView);
    
    
}

@end
