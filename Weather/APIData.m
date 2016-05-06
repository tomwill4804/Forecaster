//
//  apiData.m
//  Weather
//
//  Created by Tom Williamson on 5/5/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "APIData.h"

@implementation APIData

//
//  build a url request and start the request
//
-(void)startRequest:(NSString*)request delegate:(id<APIDataDelegate>) delegate; {
    
    self.request = request;
    self.delegate = delegate;
    
    if (![request hasPrefix:@"https://"])
        self.request = [NSString stringWithFormat:@"https://%@", request];
    NSURL* url = [NSURL URLWithString:self.request];
    
    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession* session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithURL:url];
    [dataTask resume];
    
}

#pragma mark NSURLSessionDelegate

//
//  we are finished.  Make the callback to indicate that we are done
//
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(nullable NSError *)error{
    
    if(!error && self.rawData){
        
        self.dictionary = [NSJSONSerialization JSONObjectWithData:self.rawData options:NSJSONReadingMutableLeaves error:nil];
        
        if([self.dictionary isKindOfClass:[NSDictionary class]] && self.dictionary[@"message"]) {
            self.errorText = self.dictionary[@"message"];
            self.dictionary = nil;
        }
    }
    
    [self.delegate gotAPIData:self];
    
}

//
//  collect raw data
//
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
    didReceiveData:(NSData *)data{
    
    if(!self.rawData){
        self.rawData = [[NSMutableData alloc] initWithData:data];
    } else {
        [self.rawData appendData:data];
    }
    
}


//
//  handle tcpip handshake
//
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow);
}


@end
