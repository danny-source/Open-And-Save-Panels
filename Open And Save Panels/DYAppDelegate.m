//
//  DYAppDelegate.m
//  Open And Save Panels
//
//  Created by danny on 2014/7/9.
//  Copyright (c) 2014年 Danny. All rights reserved.
//  website:http://cms.35g.tw/coding

#import "DYAppDelegate.h"

@implementation DYAppDelegate



- (void)awakeFromNib
{

}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)buttonOpenPanels:(id)sender {
    NSOpenPanel* panel = [NSOpenPanel openPanel];
    //屬性設置
    [panel setCanChooseDirectories:YES];//能否選目錄
    [panel setAllowsMultipleSelection:YES];//一次多選
    [panel setCanChooseFiles:YES];//能否選檔案
    [panel setCanHide:YES];//能否看見隱藏檔
    [panel setMessage:@"Message"];//功能說明
    [panel setTitle:@"Title"];//標題
    [panel setAllowedFileTypes:[NSImage imageTypes]];//限定檔案類型
    [panel setCanCreateDirectories:YES];//是否顯示新建目錄功能
    
    [panel beginWithCompletionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton) {
            NSURL*  theDoc = [[panel URLs] objectAtIndex:0];
            _textOpenPanelsPath.stringValue = [theDoc relativeString];
            NSLog(@"%@",[theDoc relativeString]);
        }
        
    }];
}

- (IBAction)buttonOpenPanelsAssociate:(id)sender
{
    NSOpenPanel* panel = [NSOpenPanel openPanel];
    //屬性設置
    [panel setCanChooseDirectories:YES];//能否選目錄
    [panel setAllowsMultipleSelection:YES];//一次多選
    [panel setCanChooseFiles:YES];//能否選檔案
    [panel setCanHide:YES];//能否看見隱藏檔
    [panel setMessage:@"Message"];//功能說明
    [panel setTitle:@"Title"];//標題
    [panel setPrompt:@"OK"];//變更原本Open按鍵的名稱
    [panel setAllowedFileTypes:[NSImage imageTypes]];//限定檔案類型
    [panel setCanCreateDirectories:YES];//是否顯示新建目錄功能

    
    // Display the panel attached to the document's window.
    [panel beginSheetModalForWindow:[self window] completionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton) {
            NSURL*  theDoc = [[panel URLs] objectAtIndex:0];
            _textOpenPanelsPath.stringValue = [theDoc relativeString];
        }
        
    }];
}

- (IBAction)buttonSavePanels:(id)sender {
    NSSavePanel*    panel = [NSSavePanel savePanel];
    //屬性設置
    [panel setCanHide:YES];//能否看見隱藏檔
    [panel setMessage:@"Message"];//功能說明
    [panel setTitle:@"Title"];//標題
    [panel setPrompt:@"OK"];//變更原本Save按鍵的名稱
    //[panel setAllowedFileTypes:@[@"png",@"jpg"]];//限定檔案類型
    
    [panel setNameFieldStringValue:@"test"];
    [panel beginWithCompletionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton) {
            NSURL*  theDoc = [panel URL];
            _textSavePanelsPath.stringValue = [theDoc relativeString];
        }
        
    }];

}




- (IBAction)buttonSavePanelsAssociate:(id)sender
{
    NSSavePanel*    panel = [NSSavePanel savePanel];
    //屬性設置
    [panel setCanHide:YES];//能否看見隱藏檔
    [panel setMessage:@"Message"];//功能說明
    [panel setTitle:@"Title"];//標題

    [panel setExtensionHidden:NO];
    [panel setPrompt:@"確定"];//變更原本Save按鍵的名稱
    [panel setNameFieldStringValue:@"test"];
    [panel setAllowedFileTypes:@[@"png",@"jpg"]];//限定檔案類型
    [panel setAllowsOtherFileTypes:YES];
    

    [panel beginSheetModalForWindow:[self window] completionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton)
        {
            NSURL*  theFile = [panel URL];
            _textSavePanelsPath.stringValue = [theFile relativeString];
            
        }
    }];
}



@end
