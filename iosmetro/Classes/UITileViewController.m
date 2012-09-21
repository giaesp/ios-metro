/*
 This module is licensed under the MIT license.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

//
//  UITileView.m
//  metro
//
//  Created by Gianluca Esposito on 21/09/12.
//  Copyright (c) 2012 OfficineK. All rights reserved.
//

#import "UITileViewController.h"
#import <QuartzCore/QuartzCore.h>

#define TILE_WIDTH 128.0
#define TILE_HEIGHT 128.0
#define TILE_MARGIN 8.0

#define TITLE_FONT_NAME @"SegoeWP-Light"
#define TITLE_FONT_SIZE 16.0

#define TITLE_PADDING 8.0

@implementation UITileViewController

@synthesize titleText;
@synthesize type;
@synthesize icon;
@synthesize backgroundColor;

- (id) init
{
    self = [super init];
    if (self) {
        self.titleText = @"";
        self.type = 1;
        self.backgroundColor = [UIColor clearColor];
        self.icon = nil;
        _actionQueue = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)registerAction:(BOOL (^)())action {
    [_actionQueue addObject:[[action copy] autorelease]];
}

- (void) viewDidLoad {
    [self.view setFrame:CGRectMake(0.0,
                                   0.0,
                                   (TILE_WIDTH * self.type) + ((self.type > 1) ? (TILE_MARGIN * (self.type - 1)) : 0),
                                   TILE_HEIGHT)];
    

    self.view.backgroundColor = self.backgroundColor;
    self.view.contentMode = UIViewContentModeCenter;
    
    if (icon) {
        
#ifdef DEBUG
        NSLog(@"Setting tile icon");
#endif
        
        if (icon.size.width > self.view.frame.size.width || icon.size.height > self.view.frame.size.height)
            self.view.contentMode = UIViewContentModeScaleAspectFill;
        
        UIImageView *iconView = [[UIImageView alloc] initWithImage:icon];
        [iconView setFrame:CGRectMake((self.view.frame.size.width - icon.size.width) / 2,
                                     (self.view.frame.size.height - icon.size.height) /2,
                                     icon.size.width,
                                     icon.size.height)];
        
        [self.view addSubview:iconView];
    }
    
    if (![titleText isEqualToString:@""]) {

#ifdef DEBUG
        NSLog(@"Setting tile title");
#endif

        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(TITLE_PADDING,
                                                                        self.view.frame.size.height - TITLE_PADDING - TITLE_FONT_SIZE,
                                                               self.view.frame.size.width - (TITLE_PADDING * 2),
                                                                        TITLE_FONT_SIZE)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.text = self.titleText;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = UITextAlignmentLeft;
        titleLabel.font = [UIFont fontWithName:TITLE_FONT_NAME size:TITLE_FONT_SIZE];
        [self.view addSubview:titleLabel];
        [titleLabel release];
        
#ifdef DEBUG
        NSLog(@"Current tile size: %f %f", self.view.frame.size.width, self.view.frame.size.height);
#endif

    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view.superview bringSubviewToFront:self.view];
}
          
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
}
              
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.25
                          delay:0.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         [self.view setTransform:CGAffineTransformMakeScale(1.15, 1.15)];
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:0.25
                                               delay:0.25
                                             options: UIViewAnimationCurveEaseOut
                                          animations:^{
                                              [self.view setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
                                          }
                                          completion:^(BOOL finished){
                                              // DO NOTHING
                                          }];
                     }];
    [self runActions];
}

- (void) runActions {
    int i = [_actionQueue count];
    while (i--) {
        BOOL (^block)() = [_actionQueue objectAtIndex:i];
        BOOL state = block();
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void) dealloc {
    [_actionQueue  release];
    [titleText release];
    [icon release];
    [backgroundColor release];
    [super dealloc];
}

@end
