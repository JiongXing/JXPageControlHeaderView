//
//  JXPageControlHeaderView.h
//  JXPageControlHeaderView
//
//  Created by JiongXing on 16/8/23.
//  Copyright © 2016年 JiongXing. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 页签控件
@interface JXPageControlHeaderView : UIView

/// 标签数组
@property (nonatomic, copy) NSArray<NSString *> *headerArray;

/// 字体
@property (nonatomic, strong) UIFont *font;

/// 普通状态颜色
@property (nonatomic, copy) UIColor *normalTextColor;

/// 选中状态颜色
@property (nonatomic, copy) UIColor *selectedTextColor;

/// 下划线颜色
@property (nonatomic, copy) UIColor *underLineColor;

/// 当前选中项，赋值操作不会触发Delegate
@property (nonatomic, assign, readwrite) NSUInteger selectedIndex;

/// 选中某项时回调
@property (nonatomic, copy) void (^actionOnTouchItem)(NSInteger index);

/// 刷新数据
- (void)reloadData;

/// 重建视图
- (void)reBuildViews;

@end
