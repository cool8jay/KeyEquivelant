#import "ViewController.h"
#import "Utils.h"

@interface ViewController()

@property (weak) IBOutlet NSButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    {
        // this combination will not work as shortcut
        self.button.keyEquivalent = @"c";
        self.button.keyEquivalentModifierMask = NSEventModifierFlagControl;
    }
}

- (IBAction)menuItemAction:(id)sender{
    NSMenuItem *item = (NSMenuItem *)sender;
    NSEventModifierFlags flags = item.keyEquivalentModifierMask;
    
    NSLog(@"sender=%@, key=%@%@", sender, [Utils parseFlag:flags], item.keyEquivalent.uppercaseString);
}

- (IBAction)buttonAction:(id)sender{
    NSLog(@"sender=%@", sender);
}

@end
