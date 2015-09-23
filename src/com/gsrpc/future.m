#import <com/gsrpc/future.h>
#import <com/gsrpc/channel.h>

@protocol GSPromiseHandler <NSObject>

-(id<GSPromiseHandler>) parent;

@end


@interface  GSPromiseThen:NSObject<GSPromise,GSPromiseHandler>

+ (instancetype) initWithBlock:(id) block withParent:(id<GSPromiseHandler>) parent;

-(id<GSPromise>) then:(id) block;

-(id<GSAsync>) catch:(GSErrorHandler) block;

-(void) async:(void(^)()) block;

-(void) invoke:(GSResponse*) response withErr:(NSError*) error withResolver:(GSResolver) resolver;

@end


@interface GSFinally : NSObject<GSAsync>


+ (instancetype) initWithParent:(id<GSPromiseHandler>) parent;

+ (instancetype) initWithParent:(id<GSPromiseHandler>) parent withErrHandler:(GSErrorHandler) block;

-(void) async:(void(^)()) block;

-(void) catch:(NSError*) error;

-(void) finally;

@end

@interface GSFuture: NSObject<GSPromise,GSPromiseHandler,GSCallback>

+ (instancetype) init:(id<GSChannel>) channel withRequest:(GSRequest*)request withResolver:(GSResolver) resolover;

-(void) invokeWithPromise:(id<GSPromise>) promise withFinally:(GSFinally *)_finally;

-(void) invoke;

@end



@implementation GSPromiseThen {
    id _block;
    id<GSPromiseHandler> _parent;
    id<GSPromise> _next;
    GSFinally *_finally;
}

+ (instancetype) initWithBlock:(id) block withParent:(id<GSPromiseHandler>) parent {
    return [[GSPromiseThen alloc] initWithBlock:block withParent:parent];
}

- (instancetype)initWithBlock:(id) block withParent:(id<GSPromiseHandler>) parent {
    if (self = [super init]){
        
        _block = block;
        
        _parent = parent;
        
    }
    return self;
}


-(id<GSPromiseHandler>) parent {
    return _parent;
}

-(id<GSPromise>) then:(id) block{
    
    _next = [GSPromiseThen initWithBlock:block withParent:self];
    
    return _next;
}

-(id<GSAsync>) catch:(GSErrorHandler) block{
    
    _finally = [GSFinally initWithParent:self withErrHandler:block];
    
    return _finally;
}

-(void) async:(void(^)()) block{
   
    _finally = [GSFinally initWithParent:self];

    [_finally async:block];
}

-(void) invoke:(GSResponse*) response withErr:(NSError*) error withResolver:(GSResolver) resolver {
    if (error != NULL) {
        [_finally catch:error];
        return;
    }
    
    GSFuture *future = (GSFuture*)resolver(response,_block);
    
    if(future != nil) {
        [future invokeWithPromise:_next withFinally:_finally];
    }
}


@end


@implementation GSFinally {
    id<GSPromiseHandler> _parent;
    GSErrorHandler  _errHandler;
    void(^_finally)();
}


+ (instancetype) initWithParent:(id<GSPromiseHandler>) parent {
    return [[GSFinally alloc] initWithParent:parent withErrHandler:NULL];
}


+ (instancetype) initWithParent:(id<GSPromiseHandler>) parent withErrHandler:(GSErrorHandler) block{
    return [[GSFinally alloc] initWithParent:parent withErrHandler:block];
}


- (instancetype) initWithParent:(id<GSPromiseHandler>) parent withErrHandler:(GSErrorHandler) block {
    
    if (self = [super init]){
        
        _errHandler = block;
        
        _parent = parent;
        
    }
    
    return self;
}

-(void) async:(void(^)()) block {
    
    _finally = block;
    
    id<GSPromiseHandler> handler = _parent;
    
    for(;;){

        if([handler parent] != nil){
            handler = [handler parent];
            continue;
        }
        
        break;
    }
    
    [(GSFuture*)handler invoke];
}
         
-(void) catch:(NSError*) error{
    if(_errHandler != nil) {
        _errHandler(error);
    }
    
    [self finally];
}

-(void) finally {
    if(_finally != nil){
        _finally();
    }
}

@end


@implementation GSFuture{
    id<GSPromise> _next;
    GSFinally *_finally;
    GSResolver _resolver;
    id<GSChannel> _channel;
    GSRequest *_request;
}

+ (instancetype) init:(id<GSChannel>) channel withRequest:(GSRequest*)request withResolver:(GSResolver) resolover{
    return [[GSFuture alloc] init:channel withRequest:request withResolver:resolover];
}

- (instancetype) init:(id<GSChannel>) channel withRequest:(GSRequest*)request withResolver:(GSResolver) resolover {
    if (self = [super init]){
        
        _resolver = resolover;
    
        _channel = channel;
        
        _request = request;
    }
    
    return self;
}


-(id<GSPromise>) then:(id) block{
    
    _next = [GSPromiseThen initWithBlock:block withParent:self];
    
    return _next;
}

-(id<GSAsync>) catch:(GSErrorHandler) block{
    
    _finally = [GSFinally initWithParent:self withErrHandler:block];
    
    return _finally;
}


-(void) invokeWithPromise:(id<GSPromise>) promise withFinally:(GSFinally *)finally{
    _next = promise;
    _finally = finally;

    [self invoke];
}

-(void) invoke{
    [_channel Send:_request withCallback:self];
}

-(void) callback:(GSResponse*) response withErr:(NSError*) err{
    if(_next != nil) {
        [(GSPromiseThen*)_next invoke:response withErr: err withResolver: _resolver];
    } else if (err != nil){
        [_finally catch:err];
    } else {
        [_finally finally];
    }
}

-(id<GSPromiseHandler>) parent{
    return nil;
}

-(void) async:(void(^)()) block {
    
    _finally = [GSFinally initWithParent:self];
    
    [_finally async:block];
}

@end


id<GSPromise> GSCreatePromise(id<GSChannel> channel,GSRequest* request,GSResolver resolver){
    return [GSFuture init:channel withRequest:request withResolver:resolver];
}
