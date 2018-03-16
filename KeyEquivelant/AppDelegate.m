#import "AppDelegate.h"
#import "Utils.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSMenu *menu = [NSApp mainMenu];
    
    NSMenuItem *item = [[NSMenuItem alloc] initWithTitle:@"coding"
                                                  action:nil
                                           keyEquivalent:@""];
    
    NSMenu *subMenu = [[NSMenu alloc] initWithTitle:@"coding"];
        
    {
        NSMenuItem *item1 = [[NSMenuItem alloc] initWithTitle:@"coding 1"
                                                       action:@selector(menuItemAction:)
                                                keyEquivalent:@"b"];
        
        item1.keyEquivalentModifierMask = NSEventModifierFlagControl|NSEventModifierFlagOption;
        
        NSMenuItem *item2 = [[NSMenuItem alloc] initWithTitle:@"coding 2"
                                                       action:@selector(menuItemAction:)
                                                keyEquivalent:@"b"];
        
        item2.keyEquivalentModifierMask = NSEventModifierFlagControl|NSEventModifierFlagCommand;
        
        NSMenuItem *item3 = [[NSMenuItem alloc] initWithTitle:@"coding 3"
                                                       action:@selector(menuItemAction:)
                                                keyEquivalent:@"b"];
        
        item3.keyEquivalentModifierMask = NSEventModifierFlagControl;
        
        NSMenuItem *item4 = [[NSMenuItem alloc] initWithTitle:@"coding 4"
                                                       action:@selector(menuItemAction:)
                                                keyEquivalent:@"B"];
        
        item4.keyEquivalentModifierMask = NSEventModifierFlagControl|NSEventModifierFlagOption;
        
        NSMenuItem *item5 = [[NSMenuItem alloc] initWithTitle:@"coding 5"
                                                       action:@selector(menuItemAction:)
                                                keyEquivalent:@"B"];
        
        item5.keyEquivalentModifierMask = NSEventModifierFlagControl|NSEventModifierFlagCommand;
        
        NSMenuItem *item6 = [[NSMenuItem alloc] initWithTitle:@"coding 6"
                                                       action:@selector(menuItemAction:)
                                                keyEquivalent:@"B"];
        
        NSMenuItem *separator = [NSMenuItem separatorItem];
        
        NSMenuItem *item8 = [[NSMenuItem alloc] initWithTitle:@"coding 8"
                                                       action:@selector(menuItemAction:)
                                                keyEquivalent:[NSString stringWithFormat:@"%c", NSCarriageReturnCharacter]];  // must use %c to avlid compile warning
        
        item8.keyEquivalentModifierMask = NSEventModifierFlagControl|NSEventModifierFlagCommand;
        
        NSMenuItem *item9 = [[NSMenuItem alloc] initWithTitle:@"coding 9"
                                                       action:@selector(menuItemAction:)
                                                keyEquivalent:[NSString stringWithFormat:@"%C", 0x001f]];       // must use %C, otherwise it is wrong
        
        item9.keyEquivalentModifierMask = NSEventModifierFlagControl|NSEventModifierFlagCommand;
        
        NSMenuItem *item10 = [[NSMenuItem alloc] initWithTitle:@"coding 10"
                                                       action:@selector(menuItemAction:)
                                                keyEquivalent:[NSString stringWithFormat:@"%C", 0x21df]];       // must use %C, otherwise it is wrong
        
        item10.keyEquivalentModifierMask = NSEventModifierFlagControl|NSEventModifierFlagCommand;
        
        NSMenuItem *item11 = [[NSMenuItem alloc] initWithTitle:@"coding 11"
                                                        action:@selector(menuItemAction:)
                                                 keyEquivalent:[NSString stringWithFormat:@"%C", 0x2198]];       // must use %C, otherwise it is wrong
        
        item11.keyEquivalentModifierMask = NSEventModifierFlagControl|NSEventModifierFlagCommand;
        
        [subMenu addItem:item1];
        [subMenu addItem:item2];
        [subMenu addItem:item3];
        [subMenu addItem:item4];
        [subMenu addItem:item5];
        [subMenu addItem:item6];
        [subMenu addItem:separator];
        [subMenu addItem:item8];
        [subMenu addItem:item9];
        [subMenu addItem:item10];
        [subMenu addItem:item11];
        
        // item 4, item 5, item 6, automatically get ⇧ when displaying on UI.
    }
    
    item.submenu = subMenu;
    
    [menu addItem:item];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (IBAction)menuItemAction:(id)sender{
    NSMenuItem *item = (NSMenuItem *)sender;
    NSEventModifierFlags flags = item.keyEquivalentModifierMask;
    
    NSLog(@"sender=%@, key=%@%@", sender, [Utils parseFlag:flags], item.keyEquivalent.uppercaseString);
}

@end
