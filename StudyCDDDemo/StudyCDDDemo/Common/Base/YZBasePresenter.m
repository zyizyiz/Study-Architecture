//
//  YZBasePresenter.m
//  StudyCDDDemo
//
//  Created by 张义镇 on 2019/10/13.
//  Copyright © 2019 张义镇. All rights reserved.
//

#import "YZBasePresenter.h"

@implementation YZBasePresenter

- (void)showLoading {
    
}

- (void)hideHUD {
    
}

- (void)showSuccessHUD:(NSString *)text {
    
}

- (void)showFailHUD:(NSString *)text {
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
