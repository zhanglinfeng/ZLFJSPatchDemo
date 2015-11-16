//
//  ViewController.m
//  ZLFJSPatchDemo
//
//  Created by 张林峰 on 15/9/28.
//  Copyright (c) 2015年 张林峰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *name = @"jack";
    NSString *s = [NSString stringWithFormat:@"hello %@",name];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"12" message:@"haha" delegate:self cancelButtonTitle:@"qux" otherButtonTitles:@"a", nil];
    alert.tag = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   
}

@end
