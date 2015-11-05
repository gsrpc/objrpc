#import <com/gsrpc/service.gs.h>

#import <com/gsrpc/gsrpc.gs.h>


@implementation GSNamedService
+ (instancetype)init {
    return [[GSNamedService alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _Name = @"";
        
        _DispatchID = (UInt16)0;
        
        _VNodes = (UInt32)0;
        
        _NodeName = @"";
        
    }
    return self;
}



- (void) marshal:(id<GSWriter>) writer {

	[writer WriteString :_Name];


	[writer WriteUInt16 :_DispatchID];


	[writer WriteUInt32 :_VNodes];


	[writer WriteString :_NodeName];


}

- (void) unmarshal:(id<GSReader>) reader {

    {
        	_Name = [reader ReadString];

    }

    {
        	_DispatchID = [reader ReadUInt16];

    }

    {
        	_VNodes = [reader ReadUInt32];

    }

    {
        	_NodeName = [reader ReadString];

    }

}





@end

@implementation GSTunnelWhoAmI
+ (instancetype)init {
    return [[GSTunnelWhoAmI alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _Services = [NSMutableArray arrayWithCapacity: 0];
        
    }
    return self;
}



- (void) marshal:(id<GSWriter>) writer {

	[writer WriteUInt16:_Services.count];
	for(id v1 in _Services){
		GSNamedService* vv1 = (GSNamedService*)v1;
		[vv1 marshal: writer];
	}


}

- (void) unmarshal:(id<GSReader>) reader {

    {
        	UInt16 imax1 = [reader ReadUInt16];

	for(UInt16 i1 = 0; i1 < imax1; i1 ++ ){

		GSNamedService* v1 = [[GSNamedService alloc] init];

		[v1 unmarshal:reader ];

		[ _Services addObject: v1];

	}

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

	[_ID marshal: writer];


	[_Message marshal: writer];


}

- (void) unmarshal:(id<GSReader>) reader {

    {
        	[_ID unmarshal:reader ];

    }

    {
        	[_Message unmarshal:reader ];

    }

}





@end
