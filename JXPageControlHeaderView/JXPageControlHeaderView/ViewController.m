//
//  ViewController.m
//  JXPageControlHeaderView
//
//  Created by JiongXing on 16/8/23.
//  Copyright © 2016年 JiongXing. All rights reserved.
//

#import "ViewController.h"
#import "JXPageControlHeaderView.h"

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) JXPageControlHeaderView *headerView;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"JXPageControlHeaderView";
    
    // Layout
    CGFloat width = CGRectGetWidth(self.view.frame);
    self.headerView.frame = CGRectMake(0, 64, width, 45);
    self.headerView.headerArray = @[@"全部", @"收入", @"支出"];
    [self.view addSubview:self.headerView];
    
    CGFloat scrollY = CGRectGetMaxY(self.headerView.frame);
    CGFloat scrollHeight = CGRectGetHeight(self.view.frame) - scrollY;
    self.scrollView.frame = CGRectMake(0, scrollY, width, scrollHeight);
    [self.view addSubview:self.scrollView];
    
    for (NSInteger index = 0; index < 3; index ++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(index * width, 0, width, scrollHeight)];
        view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0
                                               green:arc4random_uniform(255) / 255.0
                                                blue:arc4random_uniform(255) / 255.0
                                               alpha:1];
        [self.scrollView addSubview:view];
        self.scrollView.contentSize = CGSizeMake(CGRectGetMaxX(view.frame), scrollHeight);
    }
    
    // Action
    __weak typeof(self) weakSelf = self;
    [self.headerView setActionOnTouchItem:^(NSInteger index) {
        weakSelf.scrollView.contentOffset = CGPointMake(width * index, 0);
    }];
}

- (JXPageControlHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[JXPageControlHeaderView alloc] init];
    }
    return _headerView;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / CGRectGetWidth(scrollView.frame);
    self.headerView.selectedIndex = index;
}

@end
