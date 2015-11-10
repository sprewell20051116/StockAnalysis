//
//  main.m
//  StockAnalysis_Command
//
//  Created by GIGIGUN on 11/10/15.
//  Copyright © 2015 GIGIGUN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YahooStockHistoryData.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        YahooStockHistoryData *StockData = [YahooStockHistoryData new];
        [StockData ExecuteRetreiveStockData];
    }
    return 0;
}
