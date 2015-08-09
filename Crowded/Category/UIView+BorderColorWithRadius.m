//
//  UIView+BorderColorWithRadius.m
//  Crowded
//
//  Created by Er Sanjay Morya on 10/08/15.
//  Copyright (c) 2015 shuchi mehra. All rights reserved.
//

#import "UIView+BorderColorWithRadius.h"
@implementation UIView (BorderColorWithRadius)

+(void)changeBorderColor:(UITextField *)sender
{
    [sender.layer setBorderWidth:1.5f];
    [sender.layer setBorderColor:[[UIColor colorWithRed:58/255.0 green:175/255.0 blue:227/255.0 alpha:1.0f] CGColor]];
}

+(void)makeCornerRadiusOfView:(UIView *)view withRadius:(NSInteger)radius
{
    [view.layer setCornerRadius:radius];
    [view setClipsToBounds:YES];
}

@end
