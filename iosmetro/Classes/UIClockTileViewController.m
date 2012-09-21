//
//  UIClockTileViewController.m
//  iosmetro
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
//  Created by Gianluca Esposito on 21/09/12.
//  Copyright (c) 2012 OfficineK. All rights reserved.
//

#import "UIClockTileViewController.h"

#define TITLE_FONT_NAME @"SegoeWP-SemiLight"
#define TITLE_FONT_SIZE 32.0

@implementation UIClockTileViewController

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
    // Forces standard tile properties
    self.type = 2;
    self.titleText = @"";
    self.icon = nil;
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];

    clockLabel.backgroundColor = [UIColor clearColor];
    clockLabel.text = @"8:36PM";
    clockLabel.textColor = [UIColor whiteColor];
    clockLabel.textAlignment = UITextAlignmentLeft;
    clockLabel.font = [UIFont fontWithName:TITLE_FONT_NAME size:TITLE_FONT_SIZE];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
