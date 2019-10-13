//
//  NSObject+CDD.m
//  StudyCDDDemo
//
//  Created by 张义镇 on 2019/10/12.
//  Copyright © 2019 张义镇. All rights reserved.
//

#import "NSObject+CDD.h"
#import <objc/runtime.h>
#import "CDDContext.h"


@implementation NSObject (CDD)

- (void)setContext:(CDDContext *)context
{
    objc_setAssociatedObject(self, @selector(context), context, OBJC_ASSOCIATION_ASSIGN);
}

- (CDDContext *)context {
    id curContext = objc_getAssociatedObject(self, @selector(context));
    if (curContext == nil && [self isKindOfClass:[UIView class]]) {
        UIView *view = (UIView *)self;
        
        UIView *superView = view.superview;
        while (superView != nil) {
            if (superView.context != nil) {
                curContext = superView.context;
                break;
            }
            superView = superView.superview;
        }
        if (curContext != nil) {
            [self setContext:curContext];
        }
    }
    return curContext;
}

+ (void)swizzleInstanceSelector:(SEL)oldSel withSelector:(SEL)newSel
{
    Method oldMethod = class_getInstanceMethod(self, oldSel);
    Method newMethod = class_getInstanceMethod(self, newSel);
    if (!oldMethod || !newMethod) {
        return;
    }
    class_addMethod(self, oldSel, class_getMethodImplementation(self, oldSel), method_getTypeEncoding(oldMethod));
    class_addMethod(self, newSel, class_getMethodImplementation(self, newSel), method_getTypeEncoding(newMethod));
    method_exchangeImplementations(oldMethod, newMethod);
}

@end
