//
//  webService.m
//  ZawJi
//
//  Created by openxcell open on 11/16/10.
//  Copyright 2010 xcsxzc. All rights reserved.
//

#import "webService.h"

static NSString *webServiceURL = @"http://index.goweb.it/goweb";

@implementation webService
+(NSMutableURLRequest*)getURq_getansascreen:(NSString*)ws_name{
	NSMutableURLRequest *urlReq = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:ws_name] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30];
	
	[urlReq addValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
	[urlReq setHTTPMethod:@"POST"];
	return urlReq;
	
}



//-----------------------------------------------------------------

+(NSString*)getWS_testJSON{
	NSString *st = [NSString stringWithFormat:@"http://www.openxcellaus.info/test_json.php"];
	return st;
}
+(NSString*)getWS_testXML{
	NSString *st = [NSString stringWithFormat:@"http://www.openxcellaus.info/test_xml.php"];
	return st;
}
@end
