//
//  YZBaseAdapter.h
//  StudyCDDDemo
//
//  Created by 张义镇 on 2019/10/12.
//  Copyright © 2019 张义镇. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@protocol YZBaseAdapterDelegate <NSObject>

@optional
- (void)didSelectRowForCellData:(id)cellData;

@end

@protocol YZBaseAdapterScrollDelegate <NSObject>

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView;
@end

@protocol YZBaseAdapterRefreshDelegate <NSObject>

- (void)beginToPullUpRefresh;

- (void)beginToPullDownRefresh;

@end

@interface YZBaseAdapter : NSObject<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) id<YZBaseAdapterDelegate> adapterDelegate;
@property (nonatomic, weak) id<YZBaseAdapterScrollDelegate> adapterScrollDelegate;
@property (nonatomic, weak) id<YZBaseAdapterRefreshDelegate> adapterRefreshDelegate;

- (float)getTableContentHeight;
- (void)refreshCellByData:(id)data tableView:(UITableView*)tableView;

- (NSArray*)getAdapterArray;
- (void)setAdapterArray:(NSArray*)arr;

@end

NS_ASSUME_NONNULL_END
