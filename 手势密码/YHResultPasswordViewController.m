//
//  YHResultPasswordViewController.m
//  手势密码
//
//  Created by mrlee on 2017/3/9.
//  Copyright © 2017年 mrlee. All rights reserved.
//
#import "YHGesturePasswordView.h"
#import "YHResultPasswordViewController.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface YHResultPasswordViewController ()

@end

@implementation YHResultPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"手势密码验证"];
    [self bulidUi];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)bulidUi{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setGesturePasswordView];
}

-(void)setGesturePasswordView{
    YHGesturePasswordView *view = [[YHGesturePasswordView alloc]initWithFrame:CGRectMake(0, (SCREEN_HEIGHT-SCREEN_WIDTH)*0.5,SCREEN_WIDTH,SCREEN_WIDTH) WithState:GestureResultPassword];
    [self.view addSubview:view];
    view.sendReaultData = ^(NSString *str){
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"pwdValue"]isEqualToString:str]) {
            return YES;
        }else{
            return NO;
        }
        return NO;
    };
           
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
