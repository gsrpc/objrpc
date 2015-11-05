#ifndef COM_GSRPC_GSRPC_GS
#define COM_GSRPC_GSRPC_GS
#import <com/gsrpc/channel.h>

#import <com/gsrpc/stream.h>


typedef enum GSState:UInt8 GSState;

@class GSMessage;

@class GSTime;

@class GSResponse;

typedef enum GSOSType:UInt8 GSOSType;

typedef enum GSArchType:UInt8 GSArchType;

@class GSInvalidContract;

@class GSKV;

typedef enum GSCode:UInt8 GSCode;

@class GSRequest;

@class GSDevice;

@class GSUnmarshalException;

typedef enum GSTag:UInt32 GSTag;

@class GSParam;

@class GSWhoAmI;

@class GSRemoteException;


// GSState enum
enum GSState:UInt8{ 
	GSStateDisconnect = 0,
	GSStateConnecting = 1,
	GSStateConnected = 2,
	GSStateDisconnecting = 3,
	GSStateClosed = 4
 };

// GSState enum marshal/unmarshal helper interface
@interface GSStateHelper : NSObject
+ (void) marshal:(GSState) val withWriter:(id<GSWriter>) writer;
+ (GSState) unmarshal:(id<GSReader>) reader;
+ (NSString*) tostring :(GSState)val;
@end



@interface GSMessage : NSObject

@property GSCode Code;

@property UInt8 Agent;

@property(nonatomic, strong) NSMutableData * Content;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

@end



@interface GSTime : NSObject

@property UInt64 Second;

@property UInt64 Nano;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

@end



@interface GSResponse : NSObject

@property UInt32 ID;

@property SInt8 Exception;

@property(nonatomic, strong) NSMutableData * Content;

@property UInt64 Trace;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

@end



// GSOSType enum
enum GSOSType:UInt8{ 
	GSOSTypeWindows = 0,
	GSOSTypeLinux = 1,
	GSOSTypeOSX = 2,
	GSOSTypeWP = 3,
	GSOSTypeAndroid = 4,
	GSOSTypeIOS = 5
 };

// GSOSType enum marshal/unmarshal helper interface
@interface GSOSTypeHelper : NSObject
+ (void) marshal:(GSOSType) val withWriter:(id<GSWriter>) writer;
+ (GSOSType) unmarshal:(id<GSReader>) reader;
+ (NSString*) tostring :(GSOSType)val;
@end



// GSArchType enum
enum GSArchType:UInt8{ 
	GSArchTypeX86 = 0,
	GSArchTypeX64 = 1,
	GSArchTypeARM = 2
 };

// GSArchType enum marshal/unmarshal helper interface
@interface GSArchTypeHelper : NSObject
+ (void) marshal:(GSArchType) val withWriter:(id<GSWriter>) writer;
+ (GSArchType) unmarshal:(id<GSReader>) reader;
+ (NSString*) tostring :(GSArchType)val;
@end



@interface GSInvalidContract : NSObject

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

- (NSError*) asNSError;

@end



@interface GSKV : NSObject

@property(nonatomic, strong) NSMutableData * Key;

@property(nonatomic, strong) NSMutableData * Value;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

@end



// GSCode enum
enum GSCode:UInt8{ 
	GSCodeHeartbeat = 0,
	GSCodeWhoAmI = 1,
	GSCodeRequest = 2,
	GSCodeResponse = 3,
	GSCodeAccept = 4,
	GSCodeReject = 5,
	GSCodeTunnel = 6,
	GSCodeTunnelWhoAmI = 7
 };

// GSCode enum marshal/unmarshal helper interface
@interface GSCodeHelper : NSObject
+ (void) marshal:(GSCode) val withWriter:(id<GSWriter>) writer;
+ (GSCode) unmarshal:(id<GSReader>) reader;
+ (NSString*) tostring :(GSCode)val;
@end



@interface GSRequest : NSObject

@property UInt32 ID;

@property UInt16 Service;

@property UInt16 Method;

@property(nonatomic, strong) NSMutableArray * Params;

@property UInt64 Trace;

@property UInt32 Prev;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

@end



@interface GSDevice : NSObject

@property(nonatomic, strong) NSString* ID;

@property(nonatomic, strong) NSString* Type;

@property GSArchType Arch;

@property GSOSType OS;

@property(nonatomic, strong) NSString* OSVersion;

@property(nonatomic, strong) NSString* AppKey;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

@end



@interface GSUnmarshalException : NSObject

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

- (NSError*) asNSError;

@end



// GSTag enum
enum GSTag:UInt32{ 
	GSTagI8 = 0,
	GSTagI16 = 1,
	GSTagI32 = 2,
	GSTagI64 = 3,
	GSTagList = 4,
	GSTagTable = 5,
	GSTagString = 6,
	GSTagSkip = 7
 };

// GSTag enum marshal/unmarshal helper interface
@interface GSTagHelper : NSObject
+ (void) marshal:(GSTag) val withWriter:(id<GSWriter>) writer;
+ (GSTag) unmarshal:(id<GSReader>) reader;
+ (NSString*) tostring :(GSTag)val;
@end



@interface GSParam : NSObject

@property(nonatomic, strong) NSMutableData * Content;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

@end



@interface GSWhoAmI : NSObject

@property(nonatomic, strong) GSDevice* ID;

@property(nonatomic, strong) NSMutableData * Context;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

@end



@interface GSRemoteException : NSObject

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

- (NSError*) asNSError;

@end


#endif //COM_GSRPC_GSRPC_GS
