//
//  ViewController.m
//  StockAnalysis
//
//  Created by CHIN-KANG CHANG on 6/20/15.
//  Copyright (c) 2015 iOSTutor. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    YahooStockHistoryData *StockData = [YahooStockHistoryData new];
    [StockData ExecuteRetreiveStockData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
