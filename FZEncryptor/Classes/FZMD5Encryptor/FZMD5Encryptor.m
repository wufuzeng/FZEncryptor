//
//  FZMD5Encryptor.m
//  FZOCProject
//
//  Created by 吴福增 on 2019/4/18.
//  Copyright © 2019 wufuzeng. All rights reserved.
//

#import "FZMD5Encryptor.h"
#import <CommonCrypto/CommonDigest.h>

@implementation FZMD5Encryptor
/**
 字符串加密成md5
 
 @param str 要加密的字符串
 @return 加密好的字符串
 */
+ (NSString *)fz_stringToMD5:(NSString *)str{
    //1.首先将字符串转换成UTF-8编码, 因为MD5加密是基于C语言的,所以要先把字符串转化成C语言的字符串
    const char *fooData = [str UTF8String];
    //2.然后创建一个字符串数组,接收MD5的值
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    //3.计算MD5的值, 这是官方封装好的加密方法:把我们输入的字符串转换成16进制的32位数,然后存储到result中
    CC_MD5(fooData, (CC_LONG)strlen(fooData), result);
    
    /**
     第一个参数:要加密的字符串
     第二个参数: 获取要加密字符串的长度
     第三个参数: 接收结果的数组
     */
    //4.创建一个字符串保存加密结果
    NSMutableString *saveResult = [NSMutableString string];
    
    //5.从result 数组中获取加密结果并放到 saveResult中
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [saveResult appendFormat:@"%02x", result[i]];
    }
    /*
     x表示十六进制，%02X  意思是不足两位将用0补齐，如果多余两位则不影响
     NSLog("%02X", 0x888);  //888
     NSLog("%02X", 0x4); //04
     */
    return saveResult;
}

#pragma mark - 32位 小写
+(NSString *)fz_MD5ForLower32Bate:(NSString *)str{
    
    //要进行UTF8的转码
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    
    return digest;
}

#pragma mark - 32位 大写
+(NSString *)fz_MD5ForUpper32Bate:(NSString *)str{
    
    //要进行UTF8的转码
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02X", result[i]];
    }
    
    return digest;
}

#pragma mark - 16位 大写
+(NSString *)fz_MD5ForUpper16Bate:(NSString *)str{
    
    NSString *md5Str = [self fz_MD5ForUpper32Bate:str];
    
    NSString  *string;
    for (int i=0; i<24; i++) {
        string=[md5Str substringWithRange:NSMakeRange(8, 16)];
    }
    return string;
}


#pragma mark - 16位 小写
+(NSString *)fz_MD5ForLower16Bate:(NSString *)str{
    
    NSString *md5Str = [self fz_MD5ForLower32Bate:str];
    
    NSString  *string;
    for (int i=0; i<24; i++) {
        string=[md5Str substringWithRange:NSMakeRange(8, 16)];
    }
    return string;
}

#pragma mark - 二进制数据加密 --

/**
 返回二进制数据
 */
+(NSData *)fz_MD5DataWithData:(NSData *)data{
    unsigned char    md5Result[CC_MD5_DIGEST_LENGTH + 1];
    CC_LONG            md5Length = (CC_LONG)[data length];
    CC_MD5( [data bytes], md5Length, md5Result );
    NSMutableData * retData = [[NSMutableData alloc] init];
    if ( nil == retData )
        return nil;
    [retData appendBytes:md5Result length:CC_MD5_DIGEST_LENGTH];
    return retData;
}


/**
 返回加密后的字符串
 */
+(NSString *)fz_MD5StringWithData:(NSData *)data{
    NSData * value = [FZMD5Encryptor fz_MD5DataWithData:data];
    if ( value ){
        char            tmp[16];
        unsigned char *    hex = (unsigned char *)malloc( 2048 + 1 );
        unsigned char *    bytes = (unsigned char *)[value bytes];
        unsigned long    length = [value length];
        hex[0] = '\0';
        for ( unsigned long i = 0; i < length; ++i ){
            sprintf( tmp, "%02X", bytes[i] );
            strcat( (char *)hex, tmp );
        }
        NSString * result = [NSString stringWithUTF8String:(const char *)hex];
        free( hex );
        return result;
    } else {
        return nil;
    }
}

@end
