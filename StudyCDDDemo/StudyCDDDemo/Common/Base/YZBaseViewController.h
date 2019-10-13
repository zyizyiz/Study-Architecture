//
//  YZBaseViewController.h
//  StudyCDDDemo
//
//  Created by 张义镇 on 2019/10/12.
//  Copyright © 2019 张义镇. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZBaseViewController : UIViewController

@property (nonatomic, strong) CDDContext *rootContext;

- (void)configMVP:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
