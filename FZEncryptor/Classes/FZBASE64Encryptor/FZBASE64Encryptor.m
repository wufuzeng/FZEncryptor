//
//  FZBASE64Encryptor.m
//  FZOCProject
//
//  Created by 吴福增 on 2019/4/18.
//  Copyright © 2019 wufuzeng. All rights reserved.
//

#import "FZBASE64Encryptor.h"

@implementation FZBASE64Encryptor

/// Base64编码 
+ (NSString *)fz_base64Encoding:(NSString *)plainString{
    NSData *plainData = [plainString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [plainData base64EncodedStringWithOptions:0];
    return base64String;
}
/// Base64解码
+ (NSString *)fz_base64Decoding:(NSString *)encodedString{
    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:encodedString options:0];
    NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
    return decodedString;
}


@end
