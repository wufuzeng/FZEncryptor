//
//  FZBASE64Encryptor.h
//  FZOCProject
//
//  Created by 吴福增 on 2019/4/18.
//  Copyright © 2019 wufuzeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FZBASE64Encryptor : NSObject

/// Base64编码
+ (NSString *)fz_base64Encoding:(NSString *)plainString;
/// Base64解码
+ (NSString *)fz_base64Decoding:(NSString *)encodedString;

@end

NS_ASSUME_NONNULL_END
