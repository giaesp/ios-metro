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
//  AppDelegate.m
//  iosmetro
//
//  Created by Gianluca Esposito on 21/09/12.
//  Copyright (c) 2012 OfficineK. All rights reserved.
//

#import "AppDelegate.h"
#import "Classes/UITilePanelViewController.h"
#import "Classes/UITileViewController.h"
#import "Classes/UIClockTileViewController.h"

@implementation AppDelegate

@synthesize container;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];

    UITilePanelViewController *panelView = [[UITilePanelViewController alloc] init];
    panelView.titleText = @"iOS Metro";
    panelView.horizontalMargin = 0.0;
    panelView.verticalMargin = 20.0;
    panelView.horizontalPadding = 40.0;
    panelView.verticalPadding = 20.0;
    
    [self createDemoTiles:panelView];
    
    self.container = [[UINavigationController alloc] initWithRootViewController:panelView];
    self.container.navigationBarHidden = YES;
    [panelView release];

    [self.window addSubview:container.view];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)createDemoTiles:(UITilePanelViewController*)tilesContainer {
    // Create custom tiles
    UITileViewController *homeTile = [[UITileViewController alloc] init];
    homeTile.titleText = @"Home";
    homeTile.type = 1;
    homeTile.backgroundColor = [UIColor colorWithRed:(random()%100)/(float)100 green:(random()%100)/(float)100 blue:(random()%100)/(float)100 alpha:1];
    homeTile.icon = [UIImage imageNamed:@"home.png"];
    [homeTile registerAction:^BOOL{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Demo message" message:@"You selected 'home' tile" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        return YES;
    }];
    [tilesContainer.tiles addObject:homeTile];
    [homeTile release];
    
    UITileViewController *contactsTile = [[UITileViewController alloc] init];
    contactsTile.titleText = @"Contacts";
    contactsTile.type = 1;
    contactsTile.backgroundColor = [UIColor colorWithRed:(random()%100)/(float)100 green:(random()%100)/(float)100 blue:(random()%100)/(float)100 alpha:1];
    contactsTile.icon = [UIImage imageNamed:@"contacts.png"];
    [contactsTile registerAction:^BOOL{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Demo message" message:@"You selected 'contacts' tile" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        return YES;
    }];
    [tilesContainer.tiles addObject:contactsTile];
    [contactsTile release];
    
    UITileViewController *mailTile = [[UITileViewController alloc] init];
    mailTile.titleText = @"Email";
    mailTile.type = 1;
    mailTile.backgroundColor = [UIColor colorWithRed:(random()%100)/(float)100 green:(random()%100)/(float)100 blue:(random()%100)/(float)100 alpha:1];
    mailTile.icon = [UIImage imageNamed:@"email.png"];
    [mailTile registerAction:^BOOL{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Demo message" message:@"You selected 'email' tile" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        return YES;
    }];
    [tilesContainer.tiles addObject:mailTile];
    [mailTile release];
    
    UITileViewController *browserTile = [[UITileViewController alloc] init];
    browserTile.titleText = @"Browser";
    browserTile.type = 1;
    browserTile.backgroundColor = [UIColor colorWithRed:(random()%100)/(float)100 green:(random()%100)/(float)100 blue:(random()%100)/(float)100 alpha:1];
    browserTile.icon = [UIImage imageNamed:@"internet"];
    [browserTile registerAction:^BOOL{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Demo message" message:@"You selected 'browser' tile" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        return YES;
    }];
    [tilesContainer.tiles addObject:browserTile];
    [browserTile release];
    
    UITileViewController *photoTile = [[UITileViewController alloc] init];
    photoTile.titleText = @"Photo";
    photoTile.type = 3;
    photoTile.backgroundColor = [UIColor colorWithRed:(random()%100)/(float)100 green:(random()%100)/(float)100 blue:(random()%100)/(float)100 alpha:1];
    photoTile.icon = [UIImage imageNamed:@"images.jpg"];
    [photoTile registerAction:^BOOL{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Demo message" message:@"You selected 'photo' tile" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        return YES;
    }];
    [tilesContainer.tiles addObject:photoTile];
    [photoTile release];

    
    UITileViewController *cpuTile = [[UITileViewController alloc] init];
    cpuTile.titleText = @"CPU";
    cpuTile.type = 1;
    cpuTile.backgroundColor = [UIColor colorWithRed:(random()%100)/(float)100 green:(random()%100)/(float)100 blue:(random()%100)/(float)100 alpha:1];
    cpuTile.icon = [UIImage imageNamed:@"cpustats.png"];
    [cpuTile registerAction:^BOOL{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Demo message" message:@"You selected 'cpu' tile" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        return YES;
    }];
    [tilesContainer.tiles addObject:cpuTile];
    [cpuTile release];
    
    
    
    UITileViewController *musicTile = [[UITileViewController alloc] init];
    musicTile.titleText = @"Music";
    musicTile.type = 2;
    musicTile.backgroundColor = [UIColor colorWithRed:(random()%100)/(float)100 green:(random()%100)/(float)100 blue:(random()%100)/(float)100 alpha:1];
    musicTile.icon = [UIImage imageNamed:@"music.jpg"];
    [musicTile registerAction:^BOOL{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Demo message" message:@"You selected 'music' tile" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        return YES;
    }];
    [tilesContainer.tiles addObject:musicTile];
    [musicTile release];
    
    UITileViewController *appTile = [[UITileViewController alloc] init];
    appTile.titleText = @"Composer";
    appTile.type = 1;
    appTile.backgroundColor = [UIColor colorWithRed:(random()%100)/(float)100 green:(random()%100)/(float)100 blue:(random()%100)/(float)100 alpha:1];
    appTile.icon = [UIImage imageNamed:@"composer.png"];
    [appTile registerAction:^BOOL{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Demo message" message:@"You selected 'composer' tile" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        return YES;
    }];
    [tilesContainer.tiles addObject:appTile];
    [appTile release];

    UITileViewController *rssTile = [[UITileViewController alloc] init];
    rssTile.titleText = @"Rss Reader";
    rssTile.type = 1;
    rssTile.backgroundColor = [UIColor colorWithRed:(random()%100)/(float)100 green:(random()%100)/(float)100 blue:(random()%100)/(float)100 alpha:1];
    rssTile.icon = [UIImage imageNamed:@"rssreader.png"];
    [rssTile registerAction:^BOOL{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Demo message" message:@"You selected 'rss reader' tile" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        return YES;
    }];
    [tilesContainer.tiles addObject:rssTile];
    [rssTile release];
    
    UITileViewController *clockTile = [[UITileViewController alloc] init];
    clockTile.titleText = @"";
    clockTile.type = 2;
    clockTile.backgroundColor = [UIColor colorWithRed:(random()%100)/(float)100 green:(random()%100)/(float)100 blue:(random()%100)/(float)100 alpha:1];
    clockTile.icon = [UIImage imageNamed:@"clock.jpg"];
    [clockTile registerAction:^BOOL{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Demo message" message:@"You selected 'clock' tile" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        return YES;
    }];
    [tilesContainer.tiles addObject:clockTile];
    [clockTile release];
    
    UITileViewController *documentsTile = [[UITileViewController alloc] init];
    documentsTile.titleText = @"Documents";
    documentsTile.type = 1;
    documentsTile.backgroundColor = [UIColor colorWithRed:(random()%100)/(float)100 green:(random()%100)/(float)100 blue:(random()%100)/(float)100 alpha:1];
    documentsTile.icon = [UIImage imageNamed:@"documents.png"];
    [documentsTile registerAction:^BOOL{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Demo message" message:@"You selected 'documents' tile" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        return YES;
    }];
    [tilesContainer.tiles addObject:documentsTile];
    [documentsTile release];

    UITileViewController *twitterTile = [[UITileViewController alloc] init];
    twitterTile.titleText = @"";
    twitterTile.type = 1;
    twitterTile.backgroundColor = [UIColor colorWithRed:(random()%100)/(float)100 green:(random()%100)/(float)100 blue:(random()%100)/(float)100 alpha:1];
    twitterTile.icon = [UIImage imageNamed:@"twitter.jpg"];
    [twitterTile registerAction:^BOOL{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Demo message" message:@"You selected 'documents' tile" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        return YES;
    }];
    [tilesContainer.tiles addObject:twitterTile];
    [twitterTile release];
    
    UITileViewController *trashTile = [[UITileViewController alloc] init];
    trashTile.titleText = @"Trash";
    trashTile.type = 1;
    trashTile.backgroundColor = [UIColor colorWithRed:(random()%100)/(float)100 green:(random()%100)/(float)100 blue:(random()%100)/(float)100 alpha:1];
    trashTile.icon = [UIImage imageNamed:@"trash"];
    [trashTile registerAction:^BOOL{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Demo message" message:@"You selected 'trash' tile" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        return YES;
    }];
    [tilesContainer.tiles addObject:trashTile];
    [trashTile release];
    
    UITileViewController *settingsTile = [[UITileViewController alloc] init];
    settingsTile.titleText = @"Settings";
    settingsTile.type = 1;
    settingsTile.backgroundColor = [UIColor colorWithRed:(random()%100)/(float)100 green:(random()%100)/(float)100 blue:(random()%100)/(float)100 alpha:1];
    settingsTile.icon = [UIImage imageNamed:@"settings.png"];
    [settingsTile registerAction:^BOOL{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Demo message" message:@"You selected 'settings' tile" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        return YES;
    }];
    [tilesContainer.tiles addObject:settingsTile];
    [settingsTile release];
    
    UITileViewController *facebookTile = [[UITileViewController alloc] init];
    facebookTile.titleText = @"";
    facebookTile.type = 2;
    facebookTile.backgroundColor = [UIColor colorWithRed:(random()%100)/(float)100 green:(random()%100)/(float)100 blue:(random()%100)/(float)100 alpha:1];
    facebookTile.icon = [UIImage imageNamed:@"facebook.jpg"];
    [facebookTile registerAction:^BOOL{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Demo message" message:@"You selected 'facebook' tile" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        return YES;
    }];
    [tilesContainer.tiles addObject:facebookTile];
    [facebookTile release];
    
    UITileViewController *alarmsTile = [[UITileViewController alloc] init];
    alarmsTile.titleText = @"Alarms";
    alarmsTile.type = 1;
    alarmsTile.backgroundColor = [UIColor colorWithRed:(random()%100)/(float)100 green:(random()%100)/(float)100 blue:(random()%100)/(float)100 alpha:1];
    alarmsTile.icon = [UIImage imageNamed:@"alarms.png"];
    [alarmsTile registerAction:^BOOL{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Demo message" message:@"You selected 'alarms' tile" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        return YES;
    }];
    [tilesContainer.tiles addObject:alarmsTile];
    [alarmsTile release];

    
    UITileViewController *calendarTile = [[UITileViewController alloc] init];
    calendarTile.titleText = @"Calendar";
    calendarTile.type = 2;
    calendarTile.backgroundColor = [UIColor colorWithRed:(random()%100)/(float)100 green:(random()%100)/(float)100 blue:(random()%100)/(float)100 alpha:1];
    calendarTile.icon = [UIImage imageNamed:@"calendar.png"];
    [calendarTile registerAction:^BOOL{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Demo message" message:@"You selected 'calendar' tile" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        return YES;
    }];
    [tilesContainer.tiles addObject:calendarTile];
    [calendarTile release];
    
    UITileViewController *aphorismTile = [[UITileViewController alloc] init];
    aphorismTile.titleText = @"";
    aphorismTile.type = 3;
    aphorismTile.backgroundColor = [UIColor colorWithRed:(random()%100)/(float)100 green:(random()%100)/(float)100 blue:(random()%100)/(float)100 alpha:1];
    aphorismTile.icon = [UIImage imageNamed:@"steve.jpg"];
    [aphorismTile registerAction:^BOOL{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Demo message" message:@"You selected 'aphorism' tile" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        return YES;
    }];
    [tilesContainer.tiles addObject:aphorismTile];
    [aphorismTile release];
    
    UITileViewController *mapsTile = [[UITileViewController alloc] init];
    mapsTile.titleText = @"Maps";
    mapsTile.type = 1;
    mapsTile.backgroundColor = [UIColor colorWithRed:(random()%100)/(float)100 green:(random()%100)/(float)100 blue:(random()%100)/(float)100 alpha:1];
    mapsTile.icon = [UIImage imageNamed:@"maps.png"];
    [mapsTile registerAction:^BOOL{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Demo message" message:@"You selected 'maps' tile" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        return YES;
    }];
    [tilesContainer.tiles addObject:mapsTile];
    [mapsTile release];
    
    UITileViewController *calculatorTile = [[UITileViewController alloc] init];
    calculatorTile.titleText = @"Calculator";
    calculatorTile.type = 1;
    calculatorTile.backgroundColor = [UIColor colorWithRed:(random()%100)/(float)100 green:(random()%100)/(float)100 blue:(random()%100)/(float)100 alpha:1];
    calculatorTile.icon = [UIImage imageNamed:@"calculator.png"];
    [calculatorTile registerAction:^BOOL{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Demo message" message:@"You selected 'calculator' tile" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        return YES;
    }];
    [tilesContainer.tiles addObject:calculatorTile];
    [calculatorTile release];



    /*
    UIClockTileViewController *clockTile = [[UIClockTileViewController alloc] init];
    [tilesContainer.tiles addObject:clockTile];
    [clockTile release];
     */
    
    // Append random tiles for demo
    for (int i = 0; i < 30; i++) {
        UITileViewController *tile = [[UITileViewController alloc] init];
        if (i % 6 == 0) tile.type = 2;
        if (i % 11 == 0) tile.type = 3;
        tile.titleText = [NSString stringWithFormat:@"%i", i];
        tile.backgroundColor = [UIColor colorWithRed:(random()%100)/(float)100 green:(random()%100)/(float)100 blue:(random()%100)/(float)100 alpha:1];
        [tilesContainer.tiles addObject:tile];
        [tile release];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
