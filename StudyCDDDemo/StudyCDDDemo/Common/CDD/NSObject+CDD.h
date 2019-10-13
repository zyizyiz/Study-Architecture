//
//  NSObject+CDD.h
//  StudyCDDDemo
//
//  Created by 张义镇 on 2019/10/12.
//  Copyright © 2019 张义镇. All rights reserved.
//
#import <Foundation/Foundation.h>

@class CDDContext;

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CDD)


@property (nonatomic, strong) CDDContext *context;

+ (void)swizzleInstanceSelector:(SEL)oldSel withSelector:(SEL)newSel;


@end

NS_ASSUME_NONNULL_END
