//
//  CDDContext.h
//  StudyCDDDemo
//
//  Created by 张义镇 on 2019/10/12.
//  Copyright © 2019 张义镇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+CDD.h"

@class CDDView;

NS_ASSUME_NONNULL_BEGIN

@interface CDDPresenter : NSObject

@property (nonatomic, weak) UIViewController *baseController;

@property (nonatomic, weak) CDDView *view;

@property (nonatomic, weak) id adapter;

@end

@interface CDDInterator : NSObject

@property (nonatomic, weak) UIViewController *baseController;

@end

@interface CDDView : UIView

@property (nonatomic, weak) CDDPresenter *presenter;

@property (nonatomic, weak) CDDInterator *interactor;

@end

@interface CDDContext : NSObject

@property (nonatomic, strong) CDDPresenter *presenter;

@property (nonatomic, strong) CDDInterator *interator;

@property (nonatomic, strong) CDDView      *view;

@end

NS_ASSUME_NONNULL_END
