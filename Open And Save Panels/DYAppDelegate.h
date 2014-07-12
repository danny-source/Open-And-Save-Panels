//
//  DYAppDelegate.h
//  Open And Save Panels
//
//  Created by danny on 2014/7/9.
//  Copyright (c) 2014年 Danny. All rights reserved.
//  website:http://cms.35g.tw/coding

#import <Cocoa/Cocoa.h>

@interface DYAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
- (IBAction)buttonOpenPanels:(id)sender;
- (IBAction)buttonOpenPanelsAssociate:(id)sender;
- (IBAction)buttonSavePanels:(id)sender;
- (IBAction)buttonSavePanelsAssociate:(id)sender;


@property (weak) IBOutlet NSTextField *textOpenPanelsPath;
@property (weak) IBOutlet NSTextField *textSavePanelsPath;


@end
