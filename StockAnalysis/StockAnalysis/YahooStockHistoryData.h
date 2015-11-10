//
//  YahooStockHistoryData.h
//  StockAnalysis
//
//  Created by CHIN-KANG CHANG on 6/20/15.
//  Copyright (c) 2015 iOSTutor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YahooStockHistoryData : NSObject <NSURLConnectionDelegate> {
    NSMutableData *_responseData;
}
@property (strong, nonatomic) NSString *StockID;
@property (strong, nonatomic) NSTimer  *UploadTimer;
-(void) ExecuteRetreiveStockData;

@end
