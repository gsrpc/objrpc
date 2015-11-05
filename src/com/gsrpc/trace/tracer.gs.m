#import <com/gsrpc/trace/tracer.gs.h>

#import <com/gsrpc/gsrpc.gs.h>


@implementation EvtRPC
+ (instancetype)init {
    return [[EvtRPC alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _Trace = (UInt64)0;
        
        _ID = (UInt32)0;
        
        _Prev = (UInt32)0;
        
        _Probe = @"";
        
        _StartTime = [[GSTime alloc] init];
        
        _EndTime = [[GSTime alloc] init];
        
        _Attributes = [NSMutableArray arrayWithCapacity: 0];
        
    }
    return self;
}


- (void) marshal:(id<GSWriter>) writer {
    [writer WriteByte :(UInt8)7];

    [writer WriteByte :(UInt8)GSTagI64];
	[writer WriteUInt64 :_Trace];


    [writer WriteByte :(UInt8)GSTagI32];
	[writer WriteUInt32 :_ID];


    [writer WriteByte :(UInt8)GSTagI32];
	[writer WriteUInt32 :_Prev];


    [writer WriteByte :(UInt8)GSTagString];
	[writer WriteString :_Probe];


    [writer WriteByte :(UInt8)GSTagTable];
	[_StartTime marshal: writer];


    [writer WriteByte :(UInt8)GSTagTable];
	[_EndTime marshal: writer];


    [writer WriteByte :(UInt8)((GSTagTable << 4)|GSTagList)];
	[writer WriteUInt16:_Attributes.count];
	for(id v1 in _Attributes){
		GSKV* vv1 = (GSKV*)v1;
		[vv1 marshal: writer];
	}


}
- (void) unmarshal:(id<GSReader>) reader {

    UInt8 __fields = [reader ReadByte];


    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_Trace = [reader ReadUInt64];

        }

        if(-- __fields == 0) {
            return;
        }
    }

    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_ID = [reader ReadUInt32];

        }

        if(-- __fields == 0) {
            return;
        }
    }

    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_Prev = [reader ReadUInt32];

        }

        if(-- __fields == 0) {
            return;
        }
    }

    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	_Probe = [reader ReadString];

        }

        if(-- __fields == 0) {
            return;
        }
    }

    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	[_StartTime unmarshal:reader ];

        }

        if(-- __fields == 0) {
            return;
        }
    }

    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	[_EndTime unmarshal:reader ];

        }

        if(-- __fields == 0) {
            return;
        }
    }

    {
        UInt8 tag = [reader ReadByte];

        if(tag != GSTagSkip) {
        	UInt16 imax1 = [reader ReadUInt16];

	for(UInt16 i1 = 0; i1 < imax1; i1 ++ ){

		GSKV* v1 = [[GSKV alloc] init];

		[v1 unmarshal:reader ];

		[ _Attributes addObject: v1];

	}

        }

        if(-- __fields == 0) {
            return;
        }
    }


    for(int i = 0; i < (int)__fields; i ++) {
        UInt8 tag = [reader ReadByte];

        if (tag == GSTagSkip) {
            continue;
        }

        [reader ReadSkip:tag];
    }
}




@end
