//
//  FZMD5Encryptor.h
//  FZOCProject
//
//  Created by 吴福增 on 2019/4/18.
//  Copyright © 2019 wufuzeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FZMD5Encryptor : NSObject

/**
 字符串加密成md5
 
 @param str 要加密的字符串
 @return 加密好的字符串
 */
+ (NSString *)fz_stringToMD5:(NSString *)str;

/**
 *  MD5加密, 32位 小写
 *
 *  @param str 传入要加密的字符串
 *
 *  @return 返回加密后的字符串
 */
+(NSString *)fz_MD5ForLower32Bate:(NSString *)str;

/**
 *  MD5加密, 32位 大写
 *
 *  @param str 传入要加密的字符串
 *
 *  @return 返回加密后的字符串
 */
+(NSString *)fz_MD5ForUpper32Bate:(NSString *)str;

/**
 *  MD5加密, 16位 小写
 *
 *  @param str 传入要加密的字符串
 *
 *  @return 返回加密后的字符串
 */
+(NSString *)fz_MD5ForLower16Bate:(NSString *)str;

/**
 *  MD5加密, 16位 大写
 *
 *  @param str 传入要加密的字符串
 *
 *  @return 返回加密后的字符串
 */
+(NSString *)fz_MD5ForUpper16Bate:(NSString *)str;


#pragma mark - 二进制数据加密 --

/**
 返回二进制数据
 */
+(NSData *)fz_MD5DataWithData:(NSData *)data;


/**
 返回加密后的字符串
 */
+(NSString *)fz_MD5StringWithData:(NSData *)data;

@end

NS_ASSUME_NONNULL_END
