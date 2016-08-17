//
//  FirstViewController.m
//  LongImage
//
//  Created by fx on 16/4/21.
//  Copyright © 2016年 fx. All rights reserved.
//

#import "FirstViewController.h"

#import "View+KLLayout.h"
#import "KLLayoutEngine.h"

@implementation TestCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    _testView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 30, 30)];
    _testLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(60, 20, 30, 30)];
    _testLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, 30, 30)];
    
    [_testLabel1 setText:@"test"];
    
    [self addSubview:_testView];
    [self addSubview:_testLabel1];
    [self addSubview:_testLabel2];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
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
    
    return self;
}

@end

@interface FirstViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView setTableFooterView:[[UIView alloc] init]];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Identifier"];
    
    if (!cell) {
        cell = [[TestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Identifier"];
        [[KLLayoutEngine sharedEngine] setDebugModeEnable:YES];
    }
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.f;
}

@end
