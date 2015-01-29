//
//  AppDelegate.m
//  Chaaarge
//
//  Created by Kuba Subczynski on 2015-01-02.
//  Copyright (c) 2015 Kuba Subczynski. All rights reserved.
//

#import "AppDelegate.h"
#import "Battery.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    int batteryLevel = [Battery percentLeft];
    
    if (batteryLevel < 10) {
        [NSApp terminate:self];
    }
    
    NSString *message = [[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", batteryLevel], @"% of battery power remaining!", nil] componentsJoinedByString:@""];
    
    [self.message setStringValue:message];
    [self showWindow];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    [NSApp hide:nil];
    //Sleep for 10 seconds so that launchd does not think app is crashing
    [NSThread sleepForTimeInterval:10.0f];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
    return YES;
}

- (IBAction)closeWindow:(id)sender {
    [self.window close];
    [NSApp terminate:nil];
}

- (void)showWindow {
    [[self.window standardWindowButton:NSWindowCloseButton] setHidden:YES];
    [[self.window standardWindowButton:NSWindowMiniaturizeButton] setHidden:YES];
    [[self.window standardWindowButton:NSWindowZoomButton] setHidden:YES];
    [self.window center];
    [self.window setLevel:NSStatusWindowLevel];
    [self.window orderFrontRegardless];
    [NSApp activateIgnoringOtherApps:true];
}

@end
