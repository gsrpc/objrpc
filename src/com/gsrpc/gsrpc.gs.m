#import "com/gsrpc/gsrpc.gs.h"





@implementation GSCodeHelper

+ (void) marshal:(GSCode) val withWriter:(id<GSWriter>) writer {
    [writer WriteByte:(UInt8) val];
}

+ (GSCode) unmarshal:(id<GSReader>) reader {
    return (GSCode)[reader ReadByte];
}

+ (NSString*) tostring:(GSCode)val {
    
    switch(val)
    {
    
case GSCodeHeartbeat:
       return @"GSCodeHeartbeat";
    
case GSCodeWhoAmI:
       return @"GSCodeWhoAmI";
    
case GSCodeRequest:
       return @"GSCodeRequest";
    
case GSCodeResponse:
       return @"GSCodeResponse";
    
case GSCodeAccept:
       return @"GSCodeAccept";
    
case GSCodeReject:
       return @"GSCodeReject";
    
case GSCodeTunnel:
       return @"GSCodeTunnel";
    
    default:
       return @"Unknown val";
   }
}

@end


@implementation GSStateHelper

+ (void) marshal:(GSState) val withWriter:(id<GSWriter>) writer {
    [writer WriteByte:(UInt8) val];
}

+ (GSState) unmarshal:(id<GSReader>) reader {
    return (GSState)[reader ReadByte];
}

+ (NSString*) tostring:(GSState)val {
    
    switch(val)
    {
    
case GSStateDisconnect:
       return @"GSStateDisconnect";
    
case GSStateConnecting:
       return @"GSStateConnecting";
    
case GSStateConnected:
       return @"GSStateConnected";
    
case GSStateDisconnecting:
       return @"GSStateDisconnecting";
    
case GSStateClosed:
       return @"GSStateClosed";
    
    default:
       return @"Unknown val";
   }
}

@end







@implementation GSOSTypeHelper

+ (void) marshal:(GSOSType) val withWriter:(id<GSWriter>) writer {
    [writer WriteByte:(UInt8) val];
}

+ (GSOSType) unmarshal:(id<GSReader>) reader {
    return (GSOSType)[reader ReadByte];
}

+ (NSString*) tostring:(GSOSType)val {
    
    switch(val)
    {
    
case GSOSTypeWindows:
       return @"GSOSTypeWindows";
    
case GSOSTypeLinux:
       return @"GSOSTypeLinux";
    
case GSOSTypeOSX:
       return @"GSOSTypeOSX";
    
case GSOSTypeWP:
       return @"GSOSTypeWP";
    
case GSOSTypeAndroid:
       return @"GSOSTypeAndroid";
    
case GSOSTypeIOS:
       return @"GSOSTypeIOS";
    
    default:
       return @"Unknown val";
   }
}

@end


@implementation GSArchTypeHelper

+ (void) marshal:(GSArchType) val withWriter:(id<GSWriter>) writer {
    [writer WriteByte:(UInt8) val];
}

+ (GSArchType) unmarshal:(id<GSReader>) reader {
    return (GSArchType)[reader ReadByte];
}

+ (NSString*) tostring:(GSArchType)val {
    
    switch(val)
    {
    
case GSArchTypeX86:
       return @"GSArchTypeX86";
    
case GSArchTypeX64:
       return @"GSArchTypeX64";
    
case GSArchTypeARM:
       return @"GSArchTypeARM";
    
    default:
       return @"Unknown val";
   }
}

@end


