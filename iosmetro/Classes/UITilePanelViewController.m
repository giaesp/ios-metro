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
//  UITilePanelView.m
//  metro
//
//  Created by Gianluca Esposito on 21/09/12.
//  Copyright (c) 2012 OfficineK. All rights reserved.
//

#import "UITilePanelViewController.h"
#import "UITileViewController.h"

#define HEADER_HEIGHT 64
#define FOOTER_HEIGHT 64
#define TITLE_FONT_NAME @"SegoeWP-Light"
#define TITLE_FONT_SIZE 48.0
#define TILE_MARGIN 8.0

@implementation UITilePanelViewController

@synthesize titleText;
@synthesize tiles;
@synthesize verticalMargin;
@synthesize horizontalMargin;
@synthesize horizontalPadding;
@synthesize verticalPadding;

- (id) init
{
    self = [super init];
    if (self) {
        self.verticalMargin = 0.0;
        self.horizontalMargin = 0.0;
        self.titleText = @"";
        self.tiles = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) viewDidLoad {
    self.view.multipleTouchEnabled = NO;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
    
    if (![self.titleText isEqualToString:@""]) {
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.horizontalMargin + self.horizontalPadding,
                                                               self.verticalMargin,
                                                               self.view.frame.size.width - ((self.horizontalMargin + self.horizontalPadding )* 2),
                                                               HEADER_HEIGHT)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.text = self.titleText;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = [UIFont fontWithName:TITLE_FONT_NAME size:TITLE_FONT_SIZE];
        [self.view addSubview:titleLabel];
    }
    
    container = [[UIScrollView alloc] initWithFrame:CGRectMake(self.horizontalMargin,
                                                              self.verticalMargin + HEADER_HEIGHT,
                                                              self.view.frame.size.width - (self.horizontalMargin * 2),
                                                              self.view.frame.size.height - HEADER_HEIGHT - FOOTER_HEIGHT - (self.verticalMargin * 2))];
    container.showsHorizontalScrollIndicator = NO;
    container.showsVerticalScrollIndicator = NO;
    container.pagingEnabled = YES;
    container.directionalLockEnabled = YES;
    
    [self arrangeTiles];
    
    [self.view addSubview:container];
    
    container.autoresizesSubviews = NO;
}

- (void) arrangeTiles {
    int pages = 1;
    int offsetX = self.horizontalPadding;
    int offsetY = self.verticalPadding;
    
    for (UITileViewController *tile in self.tiles) {
    
        if (offsetX + tile.view.frame.size.width + TILE_MARGIN > container.frame.size.width * pages) {
            offsetX = (container.frame.size.width * (pages - 1)) + self.horizontalPadding;
            offsetY += tile.view.frame.size.height + TILE_MARGIN;
        }
        
        if (offsetY + tile.view.frame.size.height + TILE_MARGIN > container.frame.size.height) {
            pages++;
            offsetX = (container.frame.size.width * (pages - 1)) + self.horizontalPadding;
            offsetY = self.verticalPadding;
        }
                
        [tile.view setFrame:CGRectMake(offsetX,
                                       offsetY,
                                       tile.view.frame.size.width,
                                       tile.view.frame.size.height)];
                
        [container addSubview:tile.view];
        
        offsetX += tile.view.frame.size.width + TILE_MARGIN;
        
        container.contentSize = CGSizeMake(container.frame.size.width * pages, container.frame.size.height);
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    [container setFrame:CGRectMake(self.horizontalMargin,
                                   self.verticalMargin + HEADER_HEIGHT,
                                   self.view.frame.size.width - (self.horizontalMargin * 2),
                                   self.view.frame.size.height - HEADER_HEIGHT - FOOTER_HEIGHT - (self.verticalMargin * 2))];
    [self arrangeTiles];
    return YES;
}

- (void) dealloc {
    [titleLabel release];
    [titleText release];
    [tiles release];
    [super dealloc];
}

@end
