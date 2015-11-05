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

	[GSCodeHelper marshal: _Code withWriter: writer];


	[writer WriteByte :_Agent];


	[writer WriteBytes: _Content];


}

- (void) unmarshal:(id<GSReader>) reader {

    {
        	_Code = [GSCodeHelper unmarshal: reader];

    }

    {
        	_Agent = [reader ReadByte];

    }

    {
        	_Content = [reader ReadBytes];

    }

}





@end

@implementation GSTime
+ (instancetype)init {
    return [[GSTime alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _Second = (UInt64)0;
        
        _Nano = (UInt64)0;
        
    }
    return self;
}



- (void) marshal:(id<GSWriter>) writer {

	[writer WriteUInt64 :_Second];


	[writer WriteUInt64 :_Nano];


}

- (void) unmarshal:(id<GSReader>) reader {

    {
        	_Second = [reader ReadUInt64];

    }

    {
        	_Nano = [reader ReadUInt64];

    }

}





@end

@implementation GSResponse
+ (instancetype)init {
    return [[GSResponse alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _ID = (UInt32)0;
        
        _Exception = (SInt8)0;
        
        _Content = [[NSMutableData alloc] init];
        
        _Trace = (UInt64)0;
        
    }
    return self;
}



- (void) marshal:(id<GSWriter>) writer {

	[writer WriteUInt32 :_ID];


	[writer WriteSByte :_Exception];


	[writer WriteBytes: _Content];


	[writer WriteUInt64 :_Trace];


}

- (void) unmarshal:(id<GSReader>) reader {

    {
        	_ID = [reader ReadUInt32];

    }

    {
        	_Exception = [reader ReadSByte];

    }

    {
        	_Content = [reader ReadBytes];

    }

    {
        	_Trace = [reader ReadUInt64];

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

    UInt8 __fields = [reader ReadByte];



    for(int i = 0; i < (int)__fields; i ++) {
        UInt8 tag = [reader ReadByte];

        if (tag == GSTagSkip) {
            continue;
        }

        [reader ReadSkip:tag];
    }
}



- (NSError*) asNSError {
    NSString *domain = @"GSInvalidContract";

    NSDictionary *userInfo = @{ @"source" : self };

    NSError *error = [NSError errorWithDomain:domain code:-101 userInfo:userInfo];

    return error;
}


@end

@implementation GSKV
+ (instancetype)init {
    return [[GSKV alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _Key = [[NSMutableData alloc] init];
        
        _Value = [[NSMutableData alloc] init];
        
    }
    return self;
}



- (void) marshal:(id<GSWriter>) writer {

	[writer WriteBytes: _Key];


	[writer WriteBytes: _Value];


}

- (void) unmarshal:(id<GSReader>) reader {

    {
        	_Key = [reader ReadBytes];

    }

    {
        	_Value = [reader ReadBytes];

    }

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
    
    case GSCodeTunnelWhoAmI:
       return @"GSCodeTunnelWhoAmI";
    
    default:
       return @"Unknown val";
   }
}

@end


@implementation GSRequest
+ (instancetype)init {
    return [[GSRequest alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _ID = (UInt32)0;
        
        _Service = (UInt16)0;
        
        _Method = (UInt16)0;
        
        _Params = [NSMutableArray arrayWithCapacity: 0];
        
        _Trace = (UInt64)0;
        
        _Prev = (UInt32)0;
        
    }
    return self;
}



- (void) marshal:(id<GSWriter>) writer {

	[writer WriteUInt32 :_ID];


	[writer WriteUInt16 :_Service];


	[writer WriteUInt16 :_Method];


	[writer WriteUInt16:_Params.count];
	for(id v1 in _Params){
		GSParam* vv1 = (GSParam*)v1;
		[vv1 marshal: writer];
	}


	[writer WriteUInt64 :_Trace];


	[writer WriteUInt32 :_Prev];


}

- (void) unmarshal:(id<GSReader>) reader {

    {
        	_ID = [reader ReadUInt32];

    }

    {
        	_Service = [reader ReadUInt16];

    }

    {
        	_Method = [reader ReadUInt16];

    }

    {
        	UInt16 imax1 = [reader ReadUInt16];

	for(UInt16 i1 = 0; i1 < imax1; i1 ++ ){

		GSParam* v1 = [[GSParam alloc] init];

		[v1 unmarshal:reader ];

		[ _Params addObject: v1];

	}

    }

    {
        	_Trace = [reader ReadUInt64];

    }

    {
        	_Prev = [reader ReadUInt32];

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

	[writer WriteString :_ID];


	[writer WriteString :_Type];


	[GSArchTypeHelper marshal: _Arch withWriter: writer];


	[GSOSTypeHelper marshal: _OS withWriter: writer];


	[writer WriteString :_OSVersion];


	[writer WriteString :_AppKey];


}

- (void) unmarshal:(id<GSReader>) reader {

    {
        	_ID = [reader ReadString];

    }

    {
        	_Type = [reader ReadString];

    }

    {
        	_Arch = [GSArchTypeHelper unmarshal: reader];

    }

    {
        	_OS = [GSOSTypeHelper unmarshal: reader];

    }

    {
        	_OSVersion = [reader ReadString];

    }

    {
        	_AppKey = [reader ReadString];

    }

}





@end

@implementation GSUnmarshalException
+ (instancetype)init {
    return [[GSUnmarshalException alloc] init];
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

    UInt8 __fields = [reader ReadByte];



    for(int i = 0; i < (int)__fields; i ++) {
        UInt8 tag = [reader ReadByte];

        if (tag == GSTagSkip) {
            continue;
        }

        [reader ReadSkip:tag];
    }
}



- (NSError*) asNSError {
    NSString *domain = @"GSUnmarshalException";

    NSDictionary *userInfo = @{ @"source" : self };

    NSError *error = [NSError errorWithDomain:domain code:-101 userInfo:userInfo];

    return error;
}


@end

@implementation GSTagHelper

+ (void) marshal:(GSTag) val withWriter:(id<GSWriter>) writer {
    [writer WriteUInt32:(UInt32) val];
}

+ (GSTag) unmarshal:(id<GSReader>) reader {
    return (GSTag)[reader ReadUInt32];
}

+ (NSString*) tostring:(GSTag)val {
    
    switch(val)
    {
    
    case GSTagI8:
       return @"GSTagI8";
    
    case GSTagI16:
       return @"GSTagI16";
    
    case GSTagI32:
       return @"GSTagI32";
    
    case GSTagI64:
       return @"GSTagI64";
    
    case GSTagList:
       return @"GSTagList";
    
    case GSTagTable:
       return @"GSTagTable";
    
    case GSTagString:
       return @"GSTagString";
    
    case GSTagSkip:
       return @"GSTagSkip";
    
    default:
       return @"Unknown val";
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

	[writer WriteBytes: _Content];


}

- (void) unmarshal:(id<GSReader>) reader {

    {
        	_Content = [reader ReadBytes];

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

	[_ID marshal: writer];


	[writer WriteBytes: _Context];


}

- (void) unmarshal:(id<GSReader>) reader {

    {
        	[_ID unmarshal:reader ];

    }

    {
        	_Context = [reader ReadBytes];

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

    UInt8 __fields = [reader ReadByte];



    for(int i = 0; i < (int)__fields; i ++) {
        UInt8 tag = [reader ReadByte];

        if (tag == GSTagSkip) {
            continue;
        }

        [reader ReadSkip:tag];
    }
}



- (NSError*) asNSError {
    NSString *domain = @"GSRemoteException";

    NSDictionary *userInfo = @{ @"source" : self };

    NSError *error = [NSError errorWithDomain:domain code:-101 userInfo:userInfo];

    return error;
}


@end
