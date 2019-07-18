//
//  FZURLEncryptor.m
//  FZOCProject
//
//  Created by 吴福增 on 2019/7/17.
//  Copyright © 2019 wufuzeng. All rights reserved.
//

#import "FZURLEncryptor.h"

@implementation FZURLEncryptor

/// URL编码
+ (NSString *)fz_urlEncoding:(NSString *)plainString{
    if (@available(iOS 7.0,*)) {
        return [plainString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    }else{
        return [plainString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    
}
/// URL解码
+ (NSString *)fz_urlDecoding:(NSString *)encodedString{
    if (@available(iOS 7.0,*)){
        return [encodedString stringByRemovingPercentEncoding];
    }else{
       return [encodedString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
}




@end
