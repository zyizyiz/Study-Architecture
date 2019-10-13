//
//  YZBaseAdapter.m
//  StudyCDDDemo
//
//  Created by 张义镇 on 2019/10/12.
//  Copyright © 2019 张义镇. All rights reserved.
//

#import "YZBaseAdapter.h"

@interface YZBaseAdapter()

@property (nonatomic, strong) NSMutableArray *arr;

@end

@implementation YZBaseAdapter

- (instancetype)init
{
    self = [super init];
    if (self) {
        _arr = [NSMutableArray new];
    }
    return self;
}

- (NSArray *)getAdapterArray
{
    return _arr;
}

- (void)setAdapterArray:(NSArray *)arr
{
    [_arr removeAllObjects];
    [_arr addObjectsFromArray:arr];
}

- (float)getTableContentHeight
{
    return 0;
}

- (void)refreshCellByData:(id)data tableView:(UITableView *)tableView {
    
}

#pragma mark -- UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _arr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section > _arr.count - 1 || ![_arr[section] isKindOfClass:[NSArray class]]) {
        return 0;
    }
    return ((NSArray *)_arr[section]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self checkTransboundary:indexPath]) {
        return [[UITableViewCell alloc] init];
    }
    
    UITableViewCell *cell = NULL;
    
    return cell;
}

#pragma mark -- UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self checkTransboundary:indexPath]) {
        return;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.adapterDelegate && [self.adapterDelegate respondsToSelector:@selector(didSelectRowForCellData:)]) {
        id cellData = [self getDataAtIndexPath:indexPath];
        [self.adapterDelegate didSelectRowForCellData:cellData];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self checkTransboundary:indexPath]) {
        return;
    }
    
    if (self.adapterRefreshDelegate && [self.adapterRefreshDelegate respondsToSelector:@selector(beginToPullUpRefresh)]) {
        /// 预加载
        if (tableView.style == UITableViewStyleGrouped) {
            if (self.getAdapterArray.count > 1) {
                NSArray *dataArray = [self.getAdapterArray objectAtIndex:0];
                if (dataArray.count > 4 && dataArray.count - 4 == indexPath.row) {
                    [self.adapterRefreshDelegate beginToPullUpRefresh];
                }
            }
        }
        if (tableView.style == UITableViewStylePlain) {
            
        }
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    if (self.adapterScrollDelegate && [self.adapterScrollDelegate respondsToSelector:@selector(scrollViewWillBeginDragging:)]) {
        [self.adapterScrollDelegate scrollViewWillBeginDragging:scrollView];
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.adapterScrollDelegate && [self.adapterScrollDelegate respondsToSelector:@selector(scrollViewDidScroll:)]) {
        [self.adapterScrollDelegate scrollViewDidScroll:scrollView];
    }
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (self.adapterScrollDelegate && [self.adapterScrollDelegate respondsToSelector:@selector(scrollViewDidEndDragging:)]) {
        [self.adapterScrollDelegate scrollViewDidEndDragging:scrollView];
    }
}


#pragma mark -- private

- (BOOL)checkTransboundary:(NSIndexPath *)indexPath {
    if ([_arr[indexPath.section] isKindOfClass:[NSArray class]] || indexPath.section > self.getAdapterArray.count - 1 || indexPath.row > ((NSArray *)_arr[indexPath.section]).count - 1) {
        return YES;
    }
    return NO;
}

- (id)getDataAtIndexPath:(NSIndexPath *)indexPath {
    
    return [[self.arr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
}

@end
