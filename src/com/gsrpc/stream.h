#ifndef GITHUB_COM_GSDOCKER_OBJC_STREAM_H
#define GITHUB_COM_GSDOCKER_OBJC_STREAM_H

#import <Foundation/Foundation.h>

@protocol GSReader <NSObject>

@required
- (UInt8)ReadByte;
@required
- (SInt8)ReadSByte;

@required
- (SInt16)ReadInt16;
@required
- (UInt16)ReadUInt16;

@required
- (SInt32)ReadInt32;
@required
- (UInt32)ReadUInt32;

@required
- (SInt64)ReadInt64;
@required
- (UInt64)ReadUInt64;

@required
- (Float32)ReadFloat32;
@required
- (Float64)ReadFloat64;

@required
- (NSString *)ReadString;

@required
- (NSMutableData *)ReadBytes;


@required
- (NSMutableData *)ReadArrayBytes:(UInt16)length;

@required
- (BOOL)ReadBool;

@end

@protocol GSWriter <NSObject>

@required
- (void)WriteByte:(UInt8)val;
@required
- (void)WriteSByte:(SInt8)val;

@required
- (void)WriteInt16:(SInt16)val;
@required
- (void)WriteUInt16:(UInt16)val;

@required
- (void)WriteInt32:(SInt32)val;
@required
- (void)WriteUInt32:(UInt32)val;

@required
- (void)WriteInt64:(SInt64)val;
@required
- (void)WriteUInt64:(UInt64)val;

@required
- (void)WriteFloat32:(Float32)val;
@required
- (void)WriteFloat64:(Float64)val;

@required
- (void)WriteString:(NSString *)val;

@required
- (void)WriteBytes:(NSMutableData *)val;

@required
- (void)WriteBool:(BOOL)val;

@end

@interface GSBytesReader : NSObject <GSReader> {
}

+ (GSBytesReader *)initWithNSData:(NSData *)data;

@end

@interface GSBytesWriter : NSObject <GSWriter> {
}

+ (GSBytesWriter *)init;

- (NSMutableData *)content;

@end

#endif //
