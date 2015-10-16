#import <com/gsrpc/gsrpc.gs.h>

#import <com/gsrpc/gsrpc.gs.h>


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


@implementation GSDevice
+ (instancetype)init {
    return [[GSDevice alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _ID = @"";
        
        _Type = @"";
        
        _Arch = GSArchTypeX86;
        
        _OS = GSOSTypeWindows;
        
        _OSVersion = @"";
        
        _AppKey = @"";
        
    }
    return self;
}
- (void) marshal:(id<GSWriter>) writer {
    [writer WriteByte :(UInt8)6];

	[writer WriteString :_ID];


	[writer WriteString :_Type];


	[GSArchTypeHelper marshal: _Arch withWriter: writer];


	[GSOSTypeHelper marshal: _OS withWriter: writer];


	[writer WriteString :_OSVersion];


	[writer WriteString :_AppKey];


}
- (void) unmarshal:(id<GSReader>) reader {

    UInt8 __fields = [reader ReadByte];


	_ID = [reader ReadString];

    if(-- __fields == 0) {
        return;
    }

	_Type = [reader ReadString];

    if(-- __fields == 0) {
        return;
    }

	_Arch = [GSArchTypeHelper unmarshal: reader];

    if(-- __fields == 0) {
        return;
    }

	_OS = [GSOSTypeHelper unmarshal: reader];

    if(-- __fields == 0) {
        return;
    }

	_OSVersion = [reader ReadString];

    if(-- __fields == 0) {
        return;
    }

	_AppKey = [reader ReadString];

    if(-- __fields == 0) {
        return;
    }

}

@end

@implementation GSRemoteException
+ (instancetype)init {
    return [[GSRemoteException alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
    }
    return self;
}
- (void) marshal:(id<GSWriter>) writer {
    [writer WriteByte :(UInt8)0];

}
- (void) unmarshal:(id<GSReader>) reader {

    [reader ReadByte];


}

- (NSError*) asNSError {
    NSString *domain = @"GSRemoteException";

    NSDictionary *userInfo = @{ @"source" : self };

    NSError *error = [NSError errorWithDomain:domain code:-101 userInfo:userInfo];

    return error;
}

@end

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


@implementation GSMessage
+ (instancetype)init {
    return [[GSMessage alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _Code = GSCodeHeartbeat;
        
        _Agent = (UInt8)0;
        
        _Content = [[NSMutableData alloc] init];
        
    }
    return self;
}
- (void) marshal:(id<GSWriter>) writer {
    [writer WriteByte :(UInt8)3];

	[GSCodeHelper marshal: _Code withWriter: writer];


	[writer WriteByte :_Agent];


	[writer WriteBytes: _Content];


}
- (void) unmarshal:(id<GSReader>) reader {

    UInt8 __fields = [reader ReadByte];


	_Code = [GSCodeHelper unmarshal: reader];

    if(-- __fields == 0) {
        return;
    }

	_Agent = [reader ReadByte];

    if(-- __fields == 0) {
        return;
    }

	_Content = [reader ReadBytes];

    if(-- __fields == 0) {
        return;
    }

}

@end

@implementation GSParam
+ (instancetype)init {
    return [[GSParam alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _Content = [[NSMutableData alloc] init];
        
    }
    return self;
}
- (void) marshal:(id<GSWriter>) writer {
    [writer WriteByte :(UInt8)1];

	[writer WriteBytes: _Content];


}
- (void) unmarshal:(id<GSReader>) reader {

    UInt8 __fields = [reader ReadByte];


	_Content = [reader ReadBytes];

    if(-- __fields == 0) {
        return;
    }

}

@end

@implementation GSRequest
+ (instancetype)init {
    return [[GSRequest alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _ID = (UInt16)0;
        
        _Method = (UInt16)0;
        
        _Service = (UInt16)0;
        
        _Params = [NSMutableArray arrayWithCapacity: 0];
        
    }
    return self;
}
- (void) marshal:(id<GSWriter>) writer {
    [writer WriteByte :(UInt8)4];

	[writer WriteUInt16 :_ID];


	[writer WriteUInt16 :_Method];


	[writer WriteUInt16 :_Service];


	[writer WriteUInt16:_Params.count];
	for(id v1 in _Params){
		GSParam* vv1 = (GSParam*)v1;
		[vv1 marshal: writer];
	}


}
- (void) unmarshal:(id<GSReader>) reader {

    UInt8 __fields = [reader ReadByte];


	_ID = [reader ReadUInt16];

    if(-- __fields == 0) {
        return;
    }

	_Method = [reader ReadUInt16];

    if(-- __fields == 0) {
        return;
    }

	_Service = [reader ReadUInt16];

    if(-- __fields == 0) {
        return;
    }

	UInt16 imax1 = [reader ReadUInt16];

	for(UInt16 i1 = 0; i1 < imax1; i1 ++ ){

		GSParam* v1 = [[GSParam alloc] init];

		[v1 unmarshal:reader ];

		[ _Params addObject: v1];

	}

    if(-- __fields == 0) {
        return;
    }

}

@end

@implementation GSResponse
+ (instancetype)init {
    return [[GSResponse alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _ID = (UInt16)0;
        
        _Service = (UInt16)0;
        
        _Exception = (SInt8)0;
        
        _Content = [[NSMutableData alloc] init];
        
    }
    return self;
}
- (void) marshal:(id<GSWriter>) writer {
    [writer WriteByte :(UInt8)4];

	[writer WriteUInt16 :_ID];


	[writer WriteUInt16 :_Service];


	[writer WriteSByte :_Exception];


	[writer WriteBytes: _Content];


}
- (void) unmarshal:(id<GSReader>) reader {

    UInt8 __fields = [reader ReadByte];


	_ID = [reader ReadUInt16];

    if(-- __fields == 0) {
        return;
    }

	_Service = [reader ReadUInt16];

    if(-- __fields == 0) {
        return;
    }

	_Exception = [reader ReadSByte];

    if(-- __fields == 0) {
        return;
    }

	_Content = [reader ReadBytes];

    if(-- __fields == 0) {
        return;
    }

}

@end

@implementation GSTunnel
+ (instancetype)init {
    return [[GSTunnel alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _ID = [[GSDevice alloc] init];
        
        _Message = [[GSMessage alloc] init];
        
    }
    return self;
}
- (void) marshal:(id<GSWriter>) writer {
    [writer WriteByte :(UInt8)2];

	[_ID marshal: writer];


	[_Message marshal: writer];


}
- (void) unmarshal:(id<GSReader>) reader {

    UInt8 __fields = [reader ReadByte];


	[_ID unmarshal:reader ];

    if(-- __fields == 0) {
        return;
    }

	[_Message unmarshal:reader ];

    if(-- __fields == 0) {
        return;
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


@implementation GSWhoAmI
+ (instancetype)init {
    return [[GSWhoAmI alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _ID = [[GSDevice alloc] init];
        
        _Context = [[NSMutableData alloc] init];
        
    }
    return self;
}
- (void) marshal:(id<GSWriter>) writer {
    [writer WriteByte :(UInt8)2];

	[_ID marshal: writer];


	[writer WriteBytes: _Context];


}
- (void) unmarshal:(id<GSReader>) reader {

    UInt8 __fields = [reader ReadByte];


	[_ID unmarshal:reader ];

    if(-- __fields == 0) {
        return;
    }

	_Context = [reader ReadBytes];

    if(-- __fields == 0) {
        return;
    }

}

@end

@implementation GSInvalidContract
+ (instancetype)init {
    return [[GSInvalidContract alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
    }
    return self;
}
- (void) marshal:(id<GSWriter>) writer {
    [writer WriteByte :(UInt8)0];

}
- (void) unmarshal:(id<GSReader>) reader {

    [reader ReadByte];


}

- (NSError*) asNSError {
    NSString *domain = @"GSInvalidContract";

    NSDictionary *userInfo = @{ @"source" : self };

    NSError *error = [NSError errorWithDomain:domain code:-101 userInfo:userInfo];

    return error;
}

@end
