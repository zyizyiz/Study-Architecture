//
//  YZBaseViewController.m
//  StudyCDDDemo
//
//  Created by 张义镇 on 2019/10/12.
//  Copyright © 2019 张义镇. All rights reserved.
//

#import "YZBaseViewController.h"

@interface YZBaseViewController ()

@property (nonatomic, assign) BOOL mvpEnabled;

@end

@implementation YZBaseViewController

- (void)configMVP:(NSString *)name
{
    self.mvpEnabled = YES;
    
    self.rootContext = [[CDDContext alloc] init];   // 先强引用，防止对象创建就进行销毁
    self.context = self.rootContext;    // 再进行context的弱引用
    
    Class presenterClass = NSClassFromString([NSString stringWithFormat:@"YZ%@Presenter",name]);
    if (presenterClass != NULL) {
        self.context.presenter = [presenterClass new];
        self.context.presenter.context = self.context;
    }
    
    Class interactorClass = NSClassFromString([NSString stringWithFormat:@"YZ%@Interactor",name]);
    if (interactorClass != NULL) {
        self.context.interator = [interactorClass new];
        self.context.interator.context = self.context;
    }
    
    Class viewClass = NSClassFromString([NSString stringWithFormat:@"YZ%@View",name]);
    if (viewClass != NULL) {
        self.context.view = [viewClass new];
        self.context.view.context = self.context;
    }
    
    self.context.presenter.view = self.context.view;
    self.context.presenter.baseController = self;
    
    self.context.interator.baseController = self;
    
    self.context.view.presenter = self.context.presenter;
    self.context.view.interactor = self.context.interator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.mvpEnabled) {
        self.context.view.frame = self.view.bounds;
        self.view = self.context.view;
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
