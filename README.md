# KarlLayout

用于处理基于父视图的排版

参考Masonry的语法

可以通过指定上下，左右，长宽的基于父视图的比例和偏移确定自己的大小和位置。同时支持AutoResizeMask的简单添加。

##example


    [_testView kl_makeLayoutElement:^(KLLayoutElementMaker *make) {
        make.width.flexible(YES);
        make.top.offset(10);
        make.left.offset(10);
        make.width.multipliedBy(0.2);
        make.height.multipliedBy(0.5).offset(40);
    }];
    
    [_testLabel1 kl_makeLayoutElement:^(KLLayoutElementMaker *make) {
        make.width.flexible(YES);
        make.top.offset(10);
        make.left.offset(20).multipliedBy(0.2);
        make.right.multipliedBy(0.05).offset(10);
        make.height.multipliedBy(0.2).offset(20);
    }];
    
    [_testLabel2 kl_makeLayoutElement:^(KLLayoutElementMaker *make) {
        make.width.flexible(YES);
        make.top.offset(50);
        make.left.offset(20).multipliedBy(0.2);
        make.right.multipliedBy(0.05).offset(10);
        make.height.multipliedBy(0.4).offset(20);
    }];

可以简单适配各个屏幕的cell样式

