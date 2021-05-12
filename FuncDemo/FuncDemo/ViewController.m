//
//  ViewController.m
//  FuncDemo
//
//  Created by differ on 2021/5/12.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"10+15的结果是%d",sum(10,15));
}


int sum(int a, int b) {
    return  a + b;
}

@end
