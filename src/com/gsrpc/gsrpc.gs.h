#ifndef COM_GSRPC_GSRPC_GS
#define COM_GSRPC_GSRPC_GS
#import <com/gsrpc/channel.h>

#import <com/gsrpc/stream.h>


@class GSResponse;

@class GSTunnel;

typedef enum GSOSType:UInt8 GSOSType;

@class GSDevice;

@class GSWhoAmI;

@class GSInvalidContract;

typedef enum GSCode:UInt8 GSCode;

@class GSRequest;

@class GSParam;

typedef enum GSArchType:UInt8 GSArchType;

@class GSRemoteException;

typedef enum GSState:UInt8 GSState;

@class GSMessage;


// GSResponse generated by objrpc tools
@interface GSResponse : NSObject

@property UInt16 ID;

@property UInt16 Service;

@property SInt8 Exception;

@property(nonatomic, strong) NSMutableData * Content;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;
@end



// GSTunnel generated by objrpc tools
@interface GSTunnel : NSObject

@property(nonatomic, strong) GSDevice* ID;

@property(nonatomic, strong) GSMessage* Message;

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



// GSDevice generated by objrpc tools
@interface GSDevice : NSObject

@property(nonatomic, strong) NSString* ID;

@property(nonatomic, strong) NSString* Type;

@property GSArchType Arch;

@property GSOSType OS;

@property(nonatomic, strong) NSString* OSVersion;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;
@end



// GSWhoAmI generated by objrpc tools
@interface GSWhoAmI : NSObject

@property(nonatomic, strong) GSDevice* ID;

@property(nonatomic, strong) NSMutableData * Context;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;
@end



@interface GSInvalidContract : NSObject

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;
- (NSError*) asNSError;
@end



// GSCode enum
enum GSCode:UInt8{ 
	GSCodeHeartbeat = 0,
	GSCodeWhoAmI = 1,
	GSCodeRequest = 2,
	GSCodeResponse = 3,
	GSCodeAccept = 4,
	GSCodeReject = 5,
	GSCodeTunnel = 6
 };

// GSCode enum marshal/unmarshal helper interface
@interface GSCodeHelper : NSObject
+ (void) marshal:(GSCode) val withWriter:(id<GSWriter>) writer;
+ (GSCode) unmarshal:(id<GSReader>) reader;
+ (NSString*) tostring :(GSCode)val;
@end



// GSRequest generated by objrpc tools
@interface GSRequest : NSObject

@property UInt16 ID;

@property UInt16 Method;

@property UInt16 Service;

@property(nonatomic, strong) NSMutableArray * Params;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;
@end



// GSParam generated by objrpc tools
@interface GSParam : NSObject

@property(nonatomic, strong) NSMutableData * Content;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;
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



@interface GSRemoteException : NSObject

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;
- (NSError*) asNSError;
@end



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



// GSMessage generated by objrpc tools
@interface GSMessage : NSObject

@property GSCode Code;

@property UInt8 Agent;

@property(nonatomic, strong) NSMutableData * Content;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;
@end


#endif //COM_GSRPC_GSRPC_GS
