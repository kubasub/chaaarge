//
//  AppDelegate.h
//  Chaaarge
//
//  Created by Kuba Subczynski on 2015-01-02.
//  Copyright (c) 2015 Kuba Subczynski. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *message;

- (IBAction)closeWindow:(id)sender;

- (void)showWindow;
@end

