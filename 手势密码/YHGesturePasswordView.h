//
//  YHGesturePasswordView.h
//  手势密码
//
//  Created by mrlee on 2017/3/5.
//  Copyright © 2017年 mrlee. All rights reserved.
//
typedef enum {
    GestureSetPassword, //设置手势密码
    GestureResultPassword //已有手势密码教验
} PasswordState;
//设置密码的3种状态
typedef enum {
    FristPwd, //第一次设置密码
    PwdNoValue, //二次设置密码不一致
    SetPwdSuccess,  //设置密码成功
    Other
}SetPwdState;

#import <UIKit/UIKit.h>

@interface YHGesturePasswordView : UIView
/** btn图片*/
@property (nonatomic,strong)UIImage *btnImage;

///选中的图片
@property (nonatomic,strong)UIImage *btnSelectImage;

///划线颜色
@property (nonatomic,strong)UIColor *lineColor;

/** 解锁手势完成之后判断结果时调用的block */
@property (nonatomic,copy)BOOL (^sendReaultData)(NSString *str);

//设置手势密码
@property(nonatomic,copy)void(^setPwdBlock)(SetPwdState pwdState);


// init
-(instancetype)initWithFrame:(CGRect)frame WithState:(PasswordState)state;

@end
