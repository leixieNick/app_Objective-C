//
//  RuntimeSwizzling.m
//  objective_app
//
//  Created by asdc on 2020/12/8.
//

#import "RuntimeSwizzling.h"
#import <objc/runtime.h>

@implementation RuntimeSwizzling

+ (void)load {
    Method test = class_getClassMethod(self, @selector(test));
    Method otherTest = class_getClassMethod(self, @selector(otherTest));
    method_exchangeImplementations(test, otherTest);
}

- (void)test {
    NSLog(@"test");
}

- (void)otherTest {
    [self otherTest];
    
    NSLog(@"otherTest");
}

@end
