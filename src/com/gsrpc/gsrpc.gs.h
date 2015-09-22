#ifndef COM_GSRPC_GSRPC_GS
#define COM_GSRPC_GSRPC_GS
#import <com/gsrpc/stream.h>



@interface GSTunnel : NSObject

@property Deviceid;

@property Messagemessage;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;
@end



@interface GSDevice : NSObject

@property(nonatomic, strong) stringid;

@property(nonatomic, strong) stringtype;

@property ArchTypearch;

@property OSTypeos;

@property(nonatomic, strong) stringosversion;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;
@end



@interface GSWhoAmI : NSObject

@property Deviceid;

@property(nonatomic, strong) byte[-1]context;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;
@end



typedef NS_ENUM(UInt8,GSCode){ 
	GSCodeHeartbeat = 0,
	GSCodeWhoAmI = 1,
	GSCodeRequest = 2,
	GSCodeResponse = 3,
	GSCodeAccept = 4,
	GSCodeReject = 5,
	GSCodeTunnel = 6
 };

@interface GSCodeHelper : NSObject
+ (void) marshal:(GSCode) val withWriter:(id<GSWriter>) writer;
+ (GSCode) unmarshal:(id<GSReader>) reader;
+ (NSString*) tostring :(GSCode)val;
@end



typedef NS_ENUM(UInt8,GSState){ 
	GSStateDisconnect = 0,
	GSStateConnecting = 1,
	GSStateConnected = 2,
	GSStateDisconnecting = 3,
	GSStateClosed = 4
 };

@interface GSStateHelper : NSObject
+ (void) marshal:(GSState) val withWriter:(id<GSWriter>) writer;
+ (GSState) unmarshal:(id<GSReader>) reader;
+ (NSString*) tostring :(GSState)val;
@end



@interface GSMessage : NSObject

@property Codecode;

@property byteagent;

@property(nonatomic, strong) byte[-1]content;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;
@end



@interface GSParam : NSObject

@property(nonatomic, strong) byte[-1]content;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;
@end



@interface GSRequest : NSObject

@property uint16id;

@property uint16method;

@property uint16service;

@property(nonatomic, strong) Param[-1]params;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;
@end




@interface GSResponse : NSObject

@property uint16id;

@property uint16service;

@property sbyteexception;

@property(nonatomic, strong) byte[-1]content;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;
@end



typedef NS_ENUM(UInt8,GSOSType){ 
	GSOSTypeWindows = 0,
	GSOSTypeLinux = 1,
	GSOSTypeOSX = 2,
	GSOSTypeWP = 3,
	GSOSTypeAndroid = 4,
	GSOSTypeIOS = 5
 };

@interface GSOSTypeHelper : NSObject
+ (void) marshal:(GSOSType) val withWriter:(id<GSWriter>) writer;
+ (GSOSType) unmarshal:(id<GSReader>) reader;
+ (NSString*) tostring :(GSOSType)val;
@end



typedef NS_ENUM(UInt8,GSArchType){ 
	GSArchTypeX86 = 0,
	GSArchTypeX64 = 1,
	GSArchTypeARM = 2
 };

@interface GSArchTypeHelper : NSObject
+ (void) marshal:(GSArchType) val withWriter:(id<GSWriter>) writer;
+ (GSArchType) unmarshal:(id<GSReader>) reader;
+ (NSString*) tostring :(GSArchType)val;
@end



#endif //COM_GSRPC_GSRPC_GS
