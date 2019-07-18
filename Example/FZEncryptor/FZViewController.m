//
//  FZViewController.m
//  FZEncryptor
//
//  Created by wufuzeng on 07/18/2019.
//  Copyright (c) 2019 wufuzeng. All rights reserved.
//

#import "FZViewController.h"



#import <FZEncryptor.h>
@interface FZViewController ()

@end

@implementation FZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *text_1 = [FZPrivateKeyEncryptor fz_encryptWithTxt:@"wufuzeng" andKey:@"123456"];
    
    NSString *text_2 = [FZPrivateKeyEncryptor fz_decryptWithTxt:text_1 andKey:@"123456"];
    
    NSLog(@"1:%@ 2:%@",text_1,text_2);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
