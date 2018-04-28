# CNScollPositionView的使用方法
  CNScollPositionView  *postionView = [[CNScollPositionView alloc]init];
    postionView.titlesArr = @[@"推荐",@"北京车展",@"金融",@"原创",@"车间号",@"视频",@"小视频",@"直播",@"新能源",@"AR车展",@"服务",@"图片",@"话题",];
    postionView.contentScrollView = self.scroView;
    postionView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:postionView];
    self.positionView = postionView;
    
    [self.view addSubview:self.scroView];
