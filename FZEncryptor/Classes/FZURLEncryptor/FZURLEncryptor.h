//
//  FZURLEncryptor.h
//  FZOCProject
//
//  Created by 吴福增 on 2019/7/17.
//  Copyright © 2019 wufuzeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FZURLEncryptor : NSObject
/// URL编码
+ (NSString *)fz_urlEncoding:(NSString *)plainString;
/// URL解码
+ (NSString *)fz_urlDecoding:(NSString *)encodedString;

@end

NS_ASSUME_NONNULL_END
