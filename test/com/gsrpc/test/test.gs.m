#import "com/gsrpc/test/test.gs.h"

#import <com/gsrpc/gsrpc.gs.h>


@implementation GSTestRemoteException
+ (instancetype)init {
    return [[GSTestRemoteException alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
    }
    return self;
}
- (void) marshal:(id<GSWriter>) writer {

}
- (void) unmarshal:(id<GSReader>) reader {

}

- (NSError*) asNSError {
    NSString *domain = @"GSTestRemoteException";

    NSDictionary *userInfo = @{ @"source" : self };

    NSError *error = [NSError errorWithDomain:domain code:-101 userInfo:userInfo];

    return error;
}

@end



@implementation GSTestRESTfulService{
    id<GSTestRESTful> _service;
}
+ (instancetype) init:(id<GSTestRESTful>)service withID:(UInt16) serviceID {
    return [[GSTestRESTfulService alloc] init: service withID: serviceID];
}
- (instancetype) init:(id<GSTestRESTful>)service withID:(UInt16) serviceID {
    if(self = [super init]) {
        _service = service;
        _ID = serviceID;
    }
    return self;
}

- (GSResponse*) Dispatch:(GSRequest*)call {
    switch(call.Method){
    
    case 0:
    {
		NSString* arg0 = @"";

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

			arg0 = [reader ReadString];
		}

		NSMutableData * arg1 = [[NSMutableData alloc] init];

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[1]).Content];

			arg1 = [reader ReadBytes];
		}


        [ _service Post: arg0  withArg1:arg1 ];
        
        break;
    }
    
    case 1:
    {
		NSString* arg0 = @"";

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

			arg0 = [reader ReadString];
		}


        NSMutableData * ret = [ _service Get: arg0 ];
        
        GSResponse * callreturn  = [GSResponse init];
        		{

			GSBytesWriter *writer = [[GSBytesWriter alloc] init];

			[writer WriteBytes: ret];
			callreturn.Content = writer.content;

		}


        callreturn.ID = call.ID;
        callreturn.Service = call.Service;
        return callreturn;
        
        break;
    }
    
    }
    return nil;
}

@end


@implementation GSTestRESTfulRPC {
    id<GSChannel> _channel;
    UInt16 _serviceID;
}
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    return [[GSTestRESTfulRPC alloc] initRPC: channel withID: serviceID];
}
- (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    if(self = [super init]) {
        _channel = channel;
        _serviceID = serviceID;
    }
    return self;
}


- (id<GSPromise>) Post:(NSString*) arg0  withArg1:(NSMutableData *) arg1 {
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)0;
    
    NSMutableArray * params = [NSMutableArray array];
	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[writer WriteString :arg0];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}

	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[writer WriteBytes: arg1];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}


    call.Params = params;
    

    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){


        return ((id<GSPromise>(^)())block)();;
    });
}

- (id<GSPromise>) Get:(NSString*) arg0 {
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)1;
    
    NSMutableArray * params = [NSMutableArray array];
	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[writer WriteString :arg0];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}


    call.Params = params;
    

    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){

		NSMutableData * callreturn = [[NSMutableData alloc] init];

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: response.Content];

			callreturn = [reader ReadBytes];
		}


        return ((id<GSPromise>(^)(NSMutableData *))block)(callreturn);;
    });
}

@end




@implementation GSTestBlock
+ (instancetype)init {
    return [[GSTestBlock alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _Content = [[NSMutableData alloc] init];
        
        _KV = [NSMutableArray arrayWithCapacity: 0];
        
    }
    return self;
}
- (void) marshal:(id<GSWriter>) writer {

	[writer WriteBytes: _Content];


	for(id v1 in _KV){
		NSMutableArray * vv1 = (NSMutableArray *)v1;
		for(id v2 in vv1){
			GSTestKV* vv2 = (GSTestKV*)v2;
			[vv2 marshal: writer];
		}
	}


}
- (void) unmarshal:(id<GSReader>) reader {

	_Content = [reader ReadArrayBytes:256];


	UInt16 imax1 = [reader ReadUInt16];

	for(UInt16 i1 = 0; i1 < imax1; i1 ++ ){

		NSMutableArray * v1 = [NSMutableArray arrayWithCapacity: 0];

		UInt16 imax2 = [reader ReadUInt16];

		for(UInt16 i2 = 0; i2 < imax2; i2 ++ ){

			GSTestKV* v2 = [[GSTestKV alloc] init];

			[v2 unmarshal:reader ];

			[ v1 addObject: v2];

		}

		[ _KV addObject: v1];

	}


}

@end

@implementation GSTestTimeUnitHelper

+ (void) marshal:(GSTestTimeUnit) val withWriter:(id<GSWriter>) writer {
    [writer WriteByte:(UInt8) val];
}

+ (GSTestTimeUnit) unmarshal:(id<GSReader>) reader {
    return (GSTestTimeUnit)[reader ReadByte];
}

+ (NSString*) tostring:(GSTestTimeUnit)val {
    
    switch(val)
    {
    
    case GSTestTimeUnitSecond:
       return @"GSTestTimeUnitSecond";
    
    default:
       return @"Unknown val";
   }
}

@end


@implementation GSTestDuration
+ (instancetype)init {
    return [[GSTestDuration alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _Value = (SInt32)0;
        
        _Unit = GSTestTimeUnitSecond;
        
    }
    return self;
}
- (void) marshal:(id<GSWriter>) writer {

	[writer WriteInt32 :_Value];


	[GSTestTimeUnitHelper marshal: _Unit withWriter: writer];


}
- (void) unmarshal:(id<GSReader>) reader {

	_Value = [reader ReadInt32];


	_Unit = [GSTestTimeUnitHelper unmarshal: reader];


}

@end

@implementation GSTestKV
+ (instancetype)init {
    return [[GSTestKV alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _Key = @"";
        
        _Value = @"";
        
    }
    return self;
}
- (void) marshal:(id<GSWriter>) writer {

	[writer WriteString :_Key];


	[writer WriteString :_Value];


}
- (void) unmarshal:(id<GSReader>) reader {

	_Key = [reader ReadString];


	_Value = [reader ReadString];


}

@end

@implementation GSTestNotFound
+ (instancetype)init {
    return [[GSTestNotFound alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
    }
    return self;
}
- (void) marshal:(id<GSWriter>) writer {

}
- (void) unmarshal:(id<GSReader>) reader {

}

- (NSError*) asNSError {
    NSString *domain = @"GSTestNotFound";

    NSDictionary *userInfo = @{ @"source" : self };

    NSError *error = [NSError errorWithDomain:domain code:-101 userInfo:userInfo];

    return error;
}

@end
