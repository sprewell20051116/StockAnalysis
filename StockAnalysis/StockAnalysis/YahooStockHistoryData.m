//
//  YahooStockHistoryData.m
//  StockAnalysis
//
//  Created by CHIN-KANG CHANG on 6/20/15.
//  Copyright (c) 2015 iOSTutor. All rights reserved.
//

#import "YahooStockHistoryData.h"

#define YAHOO_STOCK_HISTORY_URL_PART_1 @"http://real-chart.finance.yahoo.com/table.csv?s="
#define YAHOO_STOCK_HISTORY_URL_PART_2 @"&d=5&e=20&f=2015&g=d&a=0&b=4&c=2000&ignore=.csv"

@implementation YahooStockHistoryData

-(void) ExecuteRetreiveStockData
{

    
    _StockID = @"2002.TW";
    NSString *URLString = [NSString stringWithFormat:@"%@%@%@", YAHOO_STOCK_HISTORY_URL_PART_1, _StockID, YAHOO_STOCK_HISTORY_URL_PART_2];
    NSLog(@"%@", URLString);
    
    // Create the request.
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URLString]];
    
    // Create url connection and fire request
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    // Do any additional setup after loading the view, typically from a nib.

    
//    static const NSString *ConnectionURLString = @"http://real-chart.finance.yahoo.com/table.csv?s=2002.TW&d=5&e=20&f=2015&g=d&a=0&b=4&c=2000&ignore=.csv";
}


#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    _responseData = [[NSMutableData alloc] init];
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [_responseData appendData:data];
    //NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    // NSLog(@"%s \n ====", __PRETTY_FUNCTION__);
    
    
    double interval = 1;  // 間隔多久執行一次 (秒)
    _UploadTimer = [NSTimer scheduledTimerWithTimeInterval:interval
                                                    target:self
                                                  selector:@selector(UploadTaskMethod:)
                                                  userInfo:nil
                                                   repeats:true];

    
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
}

-(void) UploadTaskMethod:(NSTimer *)timer
{
    
    NSString* newStr = [[NSString alloc] initWithData:_responseData encoding:NSUTF8StringEncoding];
    
    
    
    for (NSString *LineString in [newStr componentsSeparatedByString:@"\n"]) {
        NSArray *StockDataArray = [LineString componentsSeparatedByString:@","];
        if ([StockDataArray count] == 7) {
            
            NSDictionary  *StockDataDic = [[NSDictionary alloc] initWithObjectsAndKeys:
                                           StockDataArray[0], @"Date",
                                           StockDataArray[1], @"Open",
                                           StockDataArray[2], @"High",
                                           StockDataArray[3], @"Low",
                                           StockDataArray[4], @"Close",
                                           StockDataArray[5], @"Volume",
                                           StockDataArray[6], @"Adj Close",nil];
            NSLog(@"\n%@", StockDataDic);
            
        }
    }
}

@end
