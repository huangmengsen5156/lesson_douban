//
//  RegisterViewController.m
//  lesson_douban
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterRequest1.h"
@interface RegisterViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong)UIImagePickerController *imagePC;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"<<返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(returnCliked)];
    
    
    self.imagePC = [[UIImagePickerController alloc]init];
    self.imagePC.delegate = self;
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGRAction:)];
    
    self.imageV.userInteractionEnabled = YES;
    [self.imageV addGestureRecognizer:tapGR];
    
}
- (void)returnCliked{
    
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

//图片实现方法
- (void)tapGRAction:(UITapGestureRecognizer *)sender{
//    UIImagePickerController *imagePC = [[UIImagePickerController alloc]init];
//    //设置代理
//    imagePC.delegate = self;
//    //消息来源
//    imagePC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    [self presentViewController:imagePC animated:YES completion:^{
//        
//    }];
    
    //    控制器提醒模块
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请选择" message:nil preferredStyle:(UIAlertControllerStyleActionSheet)];
    
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"选择相机" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        [self openCamera];
        NSLog(@"选择相机");
        
    }];;
    
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"选择相册" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        [self openPhoto];
        
    }];
    UIAlertAction *quxiao = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleDefault) handler:nil];
    
    [alertController addAction:photo];
    [alertController addAction:camera];
    [alertController addAction:quxiao];
    
    //        显示这个对话框视图控制器即可
    [self presentViewController:alertController animated:YES completion:nil];
    
    
}

//打开相册
- (void)openPhoto{
    
    [self presentViewController:self.imagePC animated:YES completion:^{
        
        NSLog(@"打开相册");
    }];
    
}


// 打开相机
- (void)openCamera {
    // UIImagePickerControllerCameraDeviceRear 后置摄像头
    // UIImagePickerControllerCameraDeviceFront 前置摄像头
    BOOL isCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    if (!isCamera) {
        NSLog(@"没有摄像头");
        return ;
    }
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.delegate = self;
    // 编辑模式
    imagePicker.allowsEditing = YES;
    
    [self  presentViewController:imagePicker animated:YES completion:^{
    }];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //获取到原图，赋值到imageV上
    UIImage *temp = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.imageV.image = temp;
    //关闭状态
    [self dismissViewControllerAnimated:YES completion:^{
        
        
    }];
}

- (IBAction)registerButton:(id)sender {
    RegisterRequest1 *request = [[RegisterRequest1 alloc]init];
    [request registerWithUsername:self.userNameTextFiled.text password:self.passwordTextFiled.text avator:self.imageV.image success:^(NSDictionary *dic) {
        
        NSLog(@"register success ==== %@",dic);
        
        NSString *code = [[dic objectForKey:@"code"]stringValue];
        if ([code isEqualToString:@"1001"]) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"注册非法访问" message:nil preferredStyle:(UIAlertControllerStyleAlert)];
            [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
                
            }]];
            [self presentViewController:alertController animated:YES completion:nil];
        }else if ([code isEqualToString:@"1002"]){
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"昵称重复注册" message:nil preferredStyle:(UIAlertControllerStyleAlert)];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            
        }]];
            [self presentViewController:alertController animated:YES completion:nil];
        }else if ([code isEqualToString:@"1003"]){
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"存储图片失败" message:nil preferredStyle:(UIAlertControllerStyleAlert)];
            [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
                
                
            }]];
            [self presentViewController:alertController animated:YES completion:nil];
        }else if ([code isEqualToString:@"1004"]){
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"存储图片失败" message:nil preferredStyle:(UIAlertControllerStyleAlert)];
            [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
                
                
            }]];
            [self presentViewController:alertController animated:YES completion:nil];

        }else if ([code isEqualToString:@"1005"]) {
            NSString *avatar = [[dic objectForKey:@"data"]objectForKey:@"avatar"];
            NSString *userId = [[dic objectForKey:@"data"]objectForKey:@"userId"];
            //保存头像和id到本地
            [[NSUserDefaults standardUserDefaults]setObject:avatar forKey:@"avatar"];
            [[NSUserDefaults standardUserDefaults]setObject:userId forKey:@"userId"];
            
            [[NSUserDefaults standardUserDefaults]synchronize];
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"注册成功" message:nil preferredStyle:(UIAlertControllerStyleAlert)];
            [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
                //界面消失
                [self dismissViewControllerAnimated:YES completion:^{
                    
                }];

                
            }]];
            [self presentViewController:alertController animated:YES completion:nil];

        }
        
    } failure:^(NSError *error) {
        NSLog(@"register error ====== %@",error);
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
