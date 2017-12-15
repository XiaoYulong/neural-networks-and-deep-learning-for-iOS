//
//  ViewController.m
//  neural-networks-and-deep-learning-for-iOS
//
//  Created by yulong on 14/12/2017.
//  Copyright © 2017 yulong. All rights reserved.
//

#import "ViewController.h"
#import "YLNetwork.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 100, 40)];
    label.text = @"Hello World";
    label.textColor = [UIColor darkTextColor];
    [self.view addSubview:label];
    
    YLNetwork *network = [[YLNetwork alloc] initWithNetworkStructure:@[@(2), @(3), @(4)]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
