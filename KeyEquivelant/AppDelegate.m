#import "AppDelegate.h"
#import "Utils.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    NSMenu *menu = [NSApp mainMenu];
    
    NSMenuItem *item = [[NSMenuItem alloc] initWithTitle:@"coding"
                                                  action:nil
                                           keyEquivalent:@""];
    
    NSMenu *subMenu = [[NSMenu alloc] initWithTitle:@"coding"];
    
    
    {
        NSMenuItem *item1 = [[NSMenuItem alloc] initWithTitle:@"coding 1"
                                                       action:@selector(menuItemAction:)
                                                keyEquivalent:@"b"];
        
        [item1 setKeyEquivalentModifierMask:NSEventModifierFlagControl|NSEventModifierFlagOption];
        
        NSMenuItem *item2 = [[NSMenuItem alloc] initWithTitle:@"coding 2"
                                                       action:@selector(menuItemAction:)
                                                keyEquivalent:@"b"];
        
        [item2 setKeyEquivalentModifierMask:NSEventModifierFlagControl|NSEventModifierFlagCommand];
        
        NSMenuItem *item3 = [[NSMenuItem alloc] initWithTitle:@"coding 3"
                                                       action:@selector(menuItemAction:)
                                                keyEquivalent:@"b"];
        
        [item3 setKeyEquivalentModifierMask:NSEventModifierFlagControl];
        
        NSMenuItem *item4 = [[NSMenuItem alloc] initWithTitle:@"coding 4"
                                                       action:@selector(menuItemAction:)
                                                keyEquivalent:@"B"];
        
        [item4 setKeyEquivalentModifierMask:NSEventModifierFlagControl|NSEventModifierFlagOption];
        
        NSMenuItem *item5 = [[NSMenuItem alloc] initWithTitle:@"coding 5"
                                                       action:@selector(menuItemAction:)
                                                keyEquivalent:@"B"];
        
        [item5 setKeyEquivalentModifierMask:NSEventModifierFlagControl|NSEventModifierFlagCommand];
        
        NSMenuItem *item6 = [[NSMenuItem alloc] initWithTitle:@"coding 6"
                                                       action:@selector(menuItemAction:)
                                                keyEquivalent:@"B"];
        
        [item6 setKeyEquivalentModifierMask:NSEventModifierFlagControl];
        
        [subMenu addItem:item1];
        [subMenu addItem:item2];
        [subMenu addItem:item3];
        [subMenu addItem:item4];
        [subMenu addItem:item5];
        [subMenu addItem:item6];
        
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
