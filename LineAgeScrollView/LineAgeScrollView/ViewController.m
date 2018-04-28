//
//  ViewController.m
//  LineAgeScrollView
//
//  Created by WangShaoShuai on 2018/4/28.
//  Copyright © 2018年 com.sswang.www. All rights reserved.
//

#import "ViewController.h"
#import "CNScollPositionView.h"
@interface ViewController ()<UIScrollViewDelegate>
@property(nonatomic)CNScollPositionView  *positionView;
@property(nonatomic)UIScrollView         *scroView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"联动scrollview";
    self.automaticallyAdjustsScrollViewInsets=NO;
    CNScollPositionView  *postionView = [[CNScollPositionView alloc]init];
    postionView.titlesArr = @[@"推荐",@"北京车展",@"金融",@"原创",@"车间号",@"视频",@"小视频",@"直播",@"新能源",@"AR车展",@"服务",@"图片",@"话题",];
    postionView.contentScrollView = self.scroView;
    postionView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:postionView];
    self.positionView = postionView;
    
    [self.view addSubview:self.scroView];
    [self addScroviewSubViews];
}

-(void)addScroviewSubViews{
    for (int i = 0; i<self.positionView.titlesArr.count; i++) {
        UILabel   *lab = [[UILabel alloc]init];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.text = [NSString stringWithFormat:@"第%d个",i];
        [self.scroView addSubview:lab];
    }
}
-(UIScrollView *)scroView{
    if (!_scroView ) {
        _scroView = [[UIScrollView alloc]init];
        _scroView.bounces = NO;
        _scroView.delegate =self;
        _scroView.pagingEnabled=YES;
        //        [_scroView.panGestureRecognizer addTarget:self action:@selector(pan:)];
    }
    return _scroView;
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger   pageIndex = scrollView.contentOffset.x/self.scroView.bounds.size.width;
    [self.positionView resetTitileViewState:pageIndex];
    self.positionView.titleContentView.scroll=NO;
    
}
-(void)viewWillLayoutSubviews{
    if (@available(iOS 11.0, *)) {
        self.positionView.frame = CGRectMake(0,self.view.safeAreaInsets.top, self.view.bounds.size.width, 40);
    } else {
        self.positionView.frame = CGRectMake(0,64, self.view.bounds.size.width, 40);
    }
    self.scroView.frame = CGRectMake(0, self.positionView.frame.origin.y+self.positionView.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height-self.positionView.bounds.size.height-self.positionView.frame.origin.y);
    self.scroView.contentSize = CGSizeMake(self.view.bounds.size.width*self.positionView.titlesArr.count, 0);
    for (int  i = 0; i<self.scroView.subviews.count; i++) {
        UILabel *lab =self.scroView.subviews[i];
        lab.frame = CGRectMake(self.scroView.bounds.size.width*i, 0,self.scroView.bounds.size.width, self.scroView.bounds.size.height);
    }
}


@end
