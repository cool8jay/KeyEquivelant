#import "Utils.h"

@implementation Utils

+ (NSString *)parseFlag: (NSEventModifierFlags)flags{
    NSString *str = @"";
    
    if(flags&NSEventModifierFlagControl){
        str = [str stringByAppendingString:@"⌃"];
    }
    
    if(flags&NSEventModifierFlagOption){
        str = [str stringByAppendingString:@"⌥"];
    }
    
    if(flags&NSEventModifierFlagShift){
        str = [str stringByAppendingString:@"⇧"];
    }
    
    if(flags&NSEventModifierFlagCommand){
        str = [str stringByAppendingString:@"⌘"];
    }
    
    return str;
}


@end
