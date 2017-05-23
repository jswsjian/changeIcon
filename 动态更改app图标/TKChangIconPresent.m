//
//  TKChangIconPresent.m
//  动态更改app图标
//
//  Created by jian huang on 2017/5/22.
//  Copyright © 2017年 hj. All rights reserved.
//

#import "TKChangIconPresent.h"


@interface TKChangIconPresent ()

@end

@implementation TKChangIconPresent

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)buttonClick:(UIButton *)sender {
    if (![UIApplication sharedApplication].supportsAlternateIcons) {
        NSLog(@"不能更换icon");
        return;
    }
    switch (sender.tag) {
        case 101:
            [self setIconWithName:nil];
            break;
        case 102:
            [self setIconWithName:@"rain"];
            break;
        case 103:
            [self setIconWithName:@"cloud"];
            break;
        case 104:
            [self setIconWithName:@"snow"];
            break;
        default:
            break;
    }
    
}

-(void)setIconWithName:(NSString *)iconName{
    //更换的图标名称，如果为nil则为原始图标名称，
    NSString *name = [[UIApplication sharedApplication] alternateIconName];
    if ((!iconName&&!name) || [name isEqualToString:iconName]) {
        return;
    }
    [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"set icon error: %@",error);
        }
    }];
    NSLog(@"The alternate icon's name is %@",iconName);
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
