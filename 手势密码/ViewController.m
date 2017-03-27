//
//  ViewController.m
//  手势密码
//
//  Created by mrlee on 2017/3/5.
//  Copyright © 2017年 mrlee. All rights reserved.
//
//vvvvvvvvv
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#import "ViewController.h"
#include "YHGesturePasswordView.h"
@interface ViewController ()
@property(nonatomic,strong)YHGesturePasswordView *passwordView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"设置手势密码"];
    [self bulidUi];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)bulidUi{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setGesturePasswordView];
}

-(void)setGesturePasswordView{
    YHGesturePasswordView *view = [[YHGesturePasswordView alloc]initWithFrame:CGRectMake(0, (SCREEN_HEIGHT-SCREEN_WIDTH)*0.5,SCREEN_WIDTH,SCREEN_WIDTH) WithState:GestureSetPassword];
    [self.view addSubview:view];
    view.setPwdBlock =  ^(SetPwdState pwdState){
        //可以做加密处理
        NSLog(@"str is value%d",pwdState);
        switch (pwdState) {
            case FristPwd:
            {
                //第一次设置密码
                NSLog(@"第一次设置密码");
            }
                break;
            case PwdNoValue:
            {
                //二次设置不一致
                NSLog(@"二次设置不一致");
                // 清空
                [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"pwdValue"];
            }
                break;
            case SetPwdSuccess:
            {
                //设置成功
                NSLog(@"设置成功");
                
            }
                break;
                
            default:
                break;
        }
    };
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
