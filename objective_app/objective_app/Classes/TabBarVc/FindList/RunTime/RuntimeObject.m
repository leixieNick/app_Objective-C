//
//  RuntimeObject.m
//  objective_app
//
//  Created by asdc on 2020/12/8.
//

#import "RuntimeObject.h"
#import <objc/runtime.h>

#import "RuntimeTest.h"

@implementation RuntimeObject

#pragma 消息转发
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(test)) {
        NSLog(@"resolveInstanceMethod");
        
        // 添加函数实现
        // class_addMethod([self class], sel, (IMP)funMethod, "V@:");
        
        return YES;
    } else {
        // 返回父类的默认调用
        return [super resolveInstanceMethod:sel];
    }
}

void funMethod(id obj, SEL _cmd) {
    NSLog(@"funMethod");
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(test)) {
        NSLog(@"forwardingTargetForSelector");
        
        // 返回 RuntimeTest 对象，让 RuntimeTest 对象接收这个消息
        // return [[RuntimeTest alloc] init];
        
        return nil;
    } else {
        return [super forwardingTargetForSelector:aSelector];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(test)) {
        NSLog(@"methodSignatureForSelector:");
        
        // 如果当前进入的是test方法,返回一个正确的方法签名
        // v 代表返回值是void类型的 @代表第一个参数类型时id，即self : 代表第二个参数是SEL类型的  即@selector(test)
        return [NSMethodSignature signatureWithObjCTypes:"V@:"];
    } else {
        return [super methodSignatureForSelector:aSelector];
    }
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation");
}

@end
