//
//  ViewController.m
//  InlineDemo
//
//  Created by differ on 2021/5/12.
//

#import "ViewController.h"
#import <DobbyX/dobby.h>
#import <mach-o/dyld.h>

@interface ViewController ()

@end

@implementation ViewController

int sum(int a,int b) {
    return a + b;
}
//0x1029d5e1c-0x00000001029d0000 = 0x5E1C
//0x10204dda8-0x0000000102048000 = 0x5DA8
//0x100199da8-0x0000000100194000 = 0x5DA8
//0x100badd6c-0x0000000100ba8000 = 0x5D6C
//函数指针⽤于保留原来的执⾏流程
static int(*sum_p)(int a,int b);

//定义指针,表示sum函数的偏移地址!
static uintptr_t sumP = 0x100005D6C;

//新函数
int mySum(int a,int b){
    NSLog(@"原有的结果是:%d",sum_p(a,b));
    return a - b;
}

+ (void)load {
    //获取ASLR,让sumP变成准确的地址
    //参数0代表imagelist中的主程序（⾃⼰）
    uintptr_t aslr = _dyld_get_image_vmaddr_slide(0);
    sumP += aslr;
    //Hook sum
    DobbyHook((void *)sumP, mySum, (void *)&sum_p);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"打印出：%d",sum(10, 20));
}


@end
