//
//  YZBasePresenter.h
//  StudyCDDDemo
//
//  Created by 张义镇 on 2019/10/13.
//  Copyright © 2019 张义镇. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZBasePresenter : CDDPresenter

- (void)showLoading;
- (void)hideHUD;

- (void)showSuccessHUD:(NSString *)text;
- (void)showFailHUD:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
