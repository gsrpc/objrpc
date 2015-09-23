#import "stream.h"

@implementation GSBytesReader {
  NSMutableData *_content;
  size_t _offset;
}

+ (instancetype)initWithNSData:(NSMutableData *)data {
  return [[GSBytesReader alloc] initWithNSData:data];
}

- (GSBytesReader *)initWithNSData:(NSMutableData *)data {

  if (self = [super init]) {
    _content = data;
    _offset = 0;
  }

  return self;
}

- (NSMutableData *)readBytesWithLength:(size_t)length {
  if (_offset + length > _content.length) {
    @throw [[NSException alloc] initWithName:@"GSBytesReaderException"
                                      reason:@"eof"
                                    userInfo:nil];
  }

  NSMutableData *data =
      [NSMutableData dataWithBytes:_content.bytes + _offset length:length];

  _offset += length;

  return data;
}

- (SInt8)ReadSByte {
  return [self ReadByte];
}

- (UInt8)ReadByte {

  Byte data;

  if (_offset + 1 > _content.length) {
    @throw [[NSException alloc] initWithName:@"GSBytesReaderException"
                                      reason:@"eof"
                                    userInfo:nil];
  }

  [_content getBytes:&data range:NSMakeRange(_offset, 1)];

  _offset += 1;

  return data;
}

- (SInt16)ReadInt16 {
  return [self ReadUInt16];
}

- (UInt16)ReadUInt16 {
  UInt16 val = 0;

  Byte *data = (Byte *)[self readBytesWithLength:2].bytes;

  val |= (UInt16)data[0];
  val |= (UInt16)(data[1] << 8);

  return val;
}

- (SInt32)ReadInt32 {
  return [self ReadUInt32];
}

- (UInt32)ReadUInt32 {

  UInt32 val = 0;

  Byte *data = (Byte *)[self readBytesWithLength:4].bytes;

  val |= (UInt32)data[0];
  val |= (UInt32)(data[1] << 8);

  val |= (UInt32)(data[2] << 16);
  val |= (UInt32)(data[3] << 24);

  return val;
}

- (SInt64)ReadInt64 {
  return [self ReadUInt64];
}

- (UInt64)ReadUInt64 {

  UInt32 val = 0;

  Byte *data = (Byte *)[self readBytesWithLength:8].bytes;

  val |= (UInt64)data[0];
  val |= (UInt64)(data[1] << 8);

  val |= (UInt64)(data[2] << 16);
  val |= (UInt64)(data[3] << 24);

  val |= ((UInt64)data[4]) << 32;
  val |= ((UInt64)data[5]) << 40;
  val |= ((UInt64)data[6]) << 48;
  val |= ((UInt64)data[7]) << 56;

  return val;
}

- (Float32)ReadFloat32 {
  UInt32 val = [self ReadUInt32];

  return *(Float32 *)(UInt32 *)&val;
}

- (Float64)ReadFloat64 {
  UInt64 val = [self ReadUInt64];

  return *(Float64 *)(UInt64 *)&val;
}

- (NSString *)ReadString {

  UInt16 length = [self ReadUInt16];

  NSMutableData *data = [self readBytesWithLength:length];

  return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSMutableData *)ReadBytes {
  UInt16 length = [self ReadUInt16];

  return [self readBytesWithLength:length];
}

- (NSMutableData *)ReadArrayBytes:(UInt16) length {
    return [self readBytesWithLength:length];
}

- (BOOL)ReadBool {
  Byte val = [self ReadByte];

  if (val == 0) {
    return FALSE;
  }

  return TRUE;
}

@end

@implementation GSBytesWriter {
  NSMutableData *_content;
}

+ (GSBytesWriter *)init {
  return [[GSBytesWriter alloc] init];
}

- (NSMutableData *)content {
  return _content;
}

- (instancetype)init {

  if (self = [super init]) {
    _content = [[NSMutableData alloc] init];
  }

  return self;
}

- (void)WriteByte:(UInt8)val {

  [_content appendBytes:&val length:1];
}

- (void)WriteSByte:(SInt8)val {

  [self WriteByte:val];
}

- (void)WriteInt16:(SInt16)val {
  [self WriteUInt16:val];
}

- (void)WriteUInt16:(UInt16)val {
  [self WriteByte:(UInt8)(val & 0xff)];

  [self WriteByte:(UInt8)((val >> 8) & 0xff)];
}

- (void)WriteInt32:(SInt32)val {
  [self WriteUInt32:val];
}

- (void)WriteUInt32:(UInt32)val {

  [self WriteByte:(UInt8)(val & 0xff)];

  [self WriteByte:(UInt8)((val >> 8) & 0xff)];

  [self WriteByte:(UInt8)((val >> 16) & 0xff)];

  [self WriteByte:(UInt8)((val >> 24) & 0xff)];
}

- (void)WriteInt64:(SInt64)val {
  [self WriteUInt64:val];
}

- (void)WriteUInt64:(UInt64)val {
  [self WriteByte:(UInt8)(val & 0xff)];

  [self WriteByte:(UInt8)((val >> 8) & 0xff)];

  [self WriteByte:(UInt8)((val >> 16) & 0xff)];

  [self WriteByte:(UInt8)((val >> 24) & 0xff)];

  [self WriteByte:(UInt8)((val >> 32) & 0xff)];

  [self WriteByte:(UInt8)((val >> 40) & 0xff)];

  [self WriteByte:(UInt8)((val >> 48) & 0xff)];

  [self WriteByte:(UInt8)((val >> 56) & 0xff)];
 
}

- (void)WriteFloat32:(Float32)val {
  [self WriteUInt32:*(UInt32 *)&val];
}

- (void)WriteFloat64:(Float64)val {

  [self WriteUInt64:*(UInt64 *)&val];
}

- (void)WriteString:(NSString *)val {

  NSMutableData *data = [NSMutableData alloc];

  [data setData:[val dataUsingEncoding:NSUTF8StringEncoding]];

  [self WriteUInt16:data.length];

  [_content appendData:data];
}

- (void)WriteBytes:(NSMutableData *)val {

  [self WriteUInt16:val.length];

  [_content appendData:val];
}

- (void)WriteBool:(BOOL)val {
  [self WriteByte:val];
}

@end
