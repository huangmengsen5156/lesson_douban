//
//  LoginViewController.m
//  lesson_douban
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginRequest.h"
#import "RegisterViewController.h"
#import "MyViewController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"<<返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(returnCliked)];
    
}

- (void)returnCliked{
    
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
        
    }];
    
    
    
}
- (IBAction)dengluButton:(id)sender {
    //登录
    [self login];
    
}

- (void)login
{
    //验证，判断用户名密码
    if ([self.userNameTextField.text length] == 0) {
        NSLog(@"用户名为空");
        
    }else if ([self.passWordTextField.text length] == 0) {
        
        NSLog(@"密码为空");
    }else{
        LoginRequest *request = [[LoginRequest alloc]init];
        
        [request loginRequestWithUsername:self.userNameTextField.text password:self.passWordTextField.text success:^(NSDictionary *dic) {
            NSLog(@"login success === %@",dic);
            
//            long code = [[dic objectForKey:@"code"] longValue];
//            if (code == 1103) {
//                
//            }
            NSString *code = [[dic objectForKey:@"code"] stringValue];
            if ([code isEqualToString:@"1103"]) {
                NSString *avatar = [[dic objectForKey:@"data"]objectForKey:@"avatar"];
                NSString *userId = [[dic objectForKey:@"data"]objectForKey:@"userId"];
                //保存头像和id到本地
                [[NSUserDefaults standardUserDefaults]setObject:avatar forKey:@"avatar"];
                [[NSUserDefaults standardUserDefaults]setObject:userId forKey:@"userId"];
                
                [[NSUserDefaults standardUserDefaults]synchronize];
                
                //登录成功之后消失
                [self dismissViewControllerAnimated:YES completion:^{
                    
                }];
            }else{
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"用户名或密码错误，请重新输入" message:nil preferredStyle:(UIAlertControllerStyleAlert)];
                [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                    
                    
                }]];
                [self presentViewController:alertController animated:YES completion:nil];    
            }
                
        } failure:^(NSError *error) {
            NSLog(@"login error ==== %@",error);
        }];
    }
    
    
    
    
}
//去注册
- (IBAction)registerBtnClicked:(id)sender {
    
    
    UIStoryboard *mainSb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    RegisterViewController *registerVC = [mainSb instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    UINavigationController *navigationC = [[UINavigationController alloc]initWithRootViewController:registerVC];
    [self presentViewController:navigationC animated:YES completion:^{
        
        
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
