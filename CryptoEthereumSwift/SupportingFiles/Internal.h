#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface CryptoHash : NSObject
+ (NSData *)sha256:(NSData *)data;
+ (NSData *)ripemd160:(NSData *)data;
+ (NSData *)hmacsha512:(NSData *)data key:(NSData *)key;
@end

@interface Secp256k1 : NSObject
+ (NSData *)generatePublicKeyWithPrivateKey:(NSData *)privateKeyData compression:(BOOL)isCompression;
+ (NSData *)deriveKey:(NSData *)password salt:(NSData *)salt iterations:(NSInteger)iterations keyLength:(NSInteger)keyLength;

@end

@interface KeyDerivation : NSObject
@property (nonatomic, readonly, nullable) NSData *privateKey;
@property (nonatomic, readonly, nullable) NSData *publicKey;
@property (nonatomic, readonly) NSData *chainCode;
@property (nonatomic, readonly) uint8_t depth;
@property (nonatomic, readonly) uint32_t fingerprint;
@property (nonatomic, readonly) uint32_t childIndex;

- (instancetype)initWithPrivateKey:(nullable NSData *)privateKey publicKey:(nullable NSData *)publicKey chainCode:(NSData *)chainCode depth:(uint8_t)depth fingerprint:(uint32_t)fingerprint childIndex:(uint32_t)childIndex;
- (nullable KeyDerivation *)derivedAtIndex:(uint32_t)childIndex hardened:(BOOL)hardened;

@end
NS_ASSUME_NONNULL_END
