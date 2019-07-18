//
//  FZPrivateKeyEncryptor.m
//  FZOCProject
//
//  Created by 吴福增 on 2019/4/18.
//  Copyright © 2019 wufuzeng. All rights reserved.
//

#import "FZPrivateKeyEncryptor.h"
#import "FZMD5Encryptor.h"
#import "FZBASE64Encryptor.h"
@implementation FZPrivateKeyEncryptor

//加密运算
+(NSString*)fz_encryptWithTxt:(NSString*)txt andKey:(NSString*)key{
    NSInteger rand = arc4random()%3200;//(0~32000)
    NSString* keyEncrypt = [FZMD5Encryptor fz_MD5ForLower32Bate:[NSString stringWithFormat:@"%ld",rand]];
    
    NSData* txtData = [txt dataUsingEncoding:NSUTF8StringEncoding];
    Byte * txtBytes = (Byte *)[txtData bytes];
    
    NSData* keyData = [keyEncrypt dataUsingEncoding:NSUTF8StringEncoding];
    Byte * keyBytes = (Byte *)[keyData bytes];
    
    int ctr       = 0;
    NSMutableData* tmpData = [NSMutableData data];
    
    for (int i = 0; i < txt.length; i++){
        ctr = (ctr == keyEncrypt.length) ? 0 : ctr;
        char tmp[3] = {'\0', '\0', '\0'};
        
        tmp[0] = keyBytes[ctr++];
        tmp[1] = txtBytes[i];
        tmp[2] = tmp[0] ^ tmp[1];
        
        [tmpData appendBytes:&tmp[0] length:1];
        [tmpData appendBytes:&tmp[2] length:1];
    }
    
    NSString * tmpStr = [[NSString alloc]initWithData:tmpData encoding:NSUTF8StringEncoding];
    
    NSString* result = [FZBASE64Encryptor fz_base64Encoding:[FZPrivateKeyEncryptor fz_encryptKeyWithTxt:tmpStr andKey:key]];
    
    //
    NSString *regex = @"/\\+/";// 配到含有'+'就重新加密
    while ([[NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex] evaluateWithObject:result] == YES){
        NSLog(@"result：%@",result);
        result = [self fz_encryptWithTxt:txt andKey:key];
    }
    return result;
}

/// 解密运算
+(NSString*)fz_decryptWithTxt:(NSString*)string andKey:(NSString*)key{
    NSString* txt = [FZPrivateKeyEncryptor fz_encryptKeyWithTxt:[FZBASE64Encryptor fz_base64Decoding:string] andKey:key];
    
    NSData* bytes = [txt dataUsingEncoding:NSUTF8StringEncoding];
    Byte * txtByte = (Byte *)[bytes bytes];
    
    NSMutableData* tmpData = [NSMutableData data];
    
    for (int i = 0; i < txt.length; i++){
        char tmp[3] = {'\0', '\0', '\0'};
        
        tmp[0] = txtByte[i];
        tmp[1] = txtByte[++i];
        tmp[2] = tmp[0] ^ tmp[1];
        [tmpData appendBytes:&tmp[2] length:1];
    }
    
    NSString * tmpStr = [[NSString alloc]initWithData:tmpData encoding:NSUTF8StringEncoding];
    
    return tmpStr;
}

//key运算
+(NSString*)fz_encryptKeyWithTxt:(NSString*)txt andKey:(NSString*)key{
    NSString* keyEncrypt = [FZMD5Encryptor fz_MD5ForLower32Bate:key];
    
    NSData* txtData = [txt dataUsingEncoding:NSUTF8StringEncoding];
    Byte * txtBytes = (Byte *)[txtData bytes];
    
    NSData* keyData = [keyEncrypt dataUsingEncoding:NSUTF8StringEncoding];
    Byte * keyBytes = (Byte *)[keyData bytes];
    
    int ctr       = 0;
    NSMutableData* tmpData = [NSMutableData data];
    
    for (int i = 0; i < txt.length; i++){
        ctr = (ctr == keyEncrypt.length) ? 0 : ctr;
        
        char tmp[3] = {'\0', '\0', '\0'};
        
        tmp[0] = txtBytes[i];
        tmp[1] = keyBytes[ctr++];
        tmp[2] = tmp[0] ^ tmp[1];
        
        [tmpData appendBytes:&tmp[2] length:1];
    }
    NSString * tmpStr = [[NSString alloc]initWithData:tmpData encoding:NSUTF8StringEncoding];
    return tmpStr;
}


@end
