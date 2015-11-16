//
//  ReplaceFunctionCaseController.m
//  ZLFJSPatchDemo
//
//  Created by 张林峰 on 15/9/28.
//  Copyright (c) 2015年 张林峰. All rights reserved.
//

#import "ReplaceFunctionCaseController.h"

@interface ReplaceFunctionCaseController ()

@property (nonatomic, strong) UILabel *lb1;
@property (nonatomic, strong) NSArray *array1;
@property (nonatomic, assign) NSInteger index;

@end

@implementation ReplaceFunctionCaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatReplaceFunctionDemo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)creatReplaceFunctionDemo {
    _lbDesc.text = @"原本有个数组越界的bug，我们可以不用发app新版本，直接用JSPatch替换原来有bug的方法，热修复该bug。\n例如数组@[@'小明',@'小强',@'小红']";
    _array1 = @[@"小明",@"小强",@"小红"];
    _index = 0;
    _lb1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 170, 100, 30)];
    _lb1.text = _array1[_index];
    [self.view addSubview:_lb1];
    
    UIButton *bt = [[UIButton alloc]initWithFrame:CGRectMake(20, 220, 80, 30)];
    [bt setTitle:@"下一位" forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(nextBody) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
    
    
    
}

//下一位
- (void)nextBody {
    _index ++;
    _lb1.text = _array1[_index];//没有对数组越界判断，我将用js来修复这个bug
}



- (void)creatAddFunctionDemo {
    _lbDesc.text = @"可以给一个类随意添加 OC 未定义的方法，但所有的参数类型都是 id，例如增加一个字符串拼接";
    
    UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(20, 170, 100, 30)];
    [tf setBorderStyle:UITextBorderStyleRoundedRect];
    tf.keyboardType = UIKeyboardTypeNumberPad;
    tf.delegate = self;
}


- (void)creatAddController {
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
