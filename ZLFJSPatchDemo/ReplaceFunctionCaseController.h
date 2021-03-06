//
//  ReplaceFunctionCaseController.h
//  ZLFJSPatchDemo
//
//  Created by 张林峰 on 15/9/28.
//  Copyright (c) 2015年 张林峰. All rights reserved.
//

// 本视图控制器的用于演示用js覆盖原oc方法来热修复bug

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BugType) {
    BugType_ReplaceFunction,
    BugType_AddFunction,
    BugType_AddController
};

@interface ReplaceFunctionCaseController : UIViewController
@property (nonatomic, assign) BugType bugType;
@property (weak, nonatomic) IBOutlet UILabel *lbDesc;

@end
