//
//  FZSHAEncryptor.h
//  FZOCProject
//
//  Created by 吴福增 on 2019/4/18.
//  Copyright © 2019 wufuzeng. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 哈希x算法
 
 SHA1有如下特性：不可以从消息摘要中复原信息；两个不同的消息不会产生同样的消息摘要。
 
 */


NS_ASSUME_NONNULL_BEGIN

@interface FZSHAEncryptor : NSObject

/**
 sha1编码
 
 @return 返回编码的字符串
 */
+(NSString *)fz_stringToSHA1:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
