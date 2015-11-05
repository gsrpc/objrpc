#ifndef COM_GSRPC_SERVICE_GS
#define COM_GSRPC_SERVICE_GS
#import <com/gsrpc/stream.h>

#import <com/gsrpc/gsrpc.gs.h>



#import <com/gsrpc/channel.h>


@class GSNamedService;

@class GSTunnelWhoAmI;

@class GSTunnel;


@interface GSNamedService : NSObject

@property(nonatomic, strong) NSString* Name;

@property UInt16 DispatchID;

@property UInt32 VNodes;

@property(nonatomic, strong) NSString* NodeName;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

@end



@interface GSTunnelWhoAmI : NSObject

@property(nonatomic, strong) NSMutableArray * Services;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

@end



@interface GSTunnel : NSObject

@property(nonatomic, strong) GSDevice* ID;

@property(nonatomic, strong) GSMessage* Message;

+ (instancetype)init;
- (void) marshal:(id<GSWriter>) writer;
- (void) unmarshal:(id<GSReader>) reader;

@end


#endif //COM_GSRPC_SERVICE_GS
