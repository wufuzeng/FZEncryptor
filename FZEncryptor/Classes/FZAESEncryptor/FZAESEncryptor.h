//
//  FZAESEncryptor.h
//  FZOCProject
//
//  Created by 吴福增 on 2019/4/18.
//  Copyright © 2019 wufuzeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FZAESEncryptor : NSObject

/**
 *  aes加密
 *
 *  @return 返回加密后的data数据
 */
- (NSData *)fz_aesEncryptWithData:(NSData *)data fromKey:(NSString *)key;

/**
 *  aes解密
 *
 *  @return 返回解密后的data数据
 */
- (NSData *)fz_aesDecryptWithData:(NSData *)data fromKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
