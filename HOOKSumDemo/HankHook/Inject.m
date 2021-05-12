//
//  Inject.m
//  HankHook
//
//  Created by hank on 2021/5/10.
//

#import "Inject.h"
#import <DobbyX/dobby.h>
#import <mach-o/dyld.h>

@implementation Inject

static uintptr_t sumP = 0x100005efc;

static int (*sum_p)(int a,int b);

int mySum(int a,int b) {
    NSLog(@"HOOK到了!");
    return  sum_p(a,b);
}

+ (void)load {
    uintptr_t aslr = _dyld_get_image_vmaddr_slide(0);
    sumP += aslr;
    DobbyHook((void *)sumP, mySum, (void *)&sum_p);
}

@end
