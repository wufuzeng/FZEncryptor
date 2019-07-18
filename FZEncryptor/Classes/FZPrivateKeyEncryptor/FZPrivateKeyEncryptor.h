//
//  FZPrivateKeyEncryptor.h
//  FZOCProject
//
//  Created by 吴福增 on 2019/4/18.
//  Copyright © 2019 wufuzeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FZPrivateKeyEncryptor : NSObject

// 秘钥加密/解密运算
+(NSString*)fz_encryptWithTxt:(NSString*)txt andKey:(NSString*)key;
+(NSString*)fz_decryptWithTxt:(NSString*)string andKey:(NSString*)key;

@end

NS_ASSUME_NONNULL_END
