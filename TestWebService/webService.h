//
//  webService.h
//  ZawJi
//
//  Created by openxcell open on 11/16/10.
//  Copyright 2010 xcsxzc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface webService : NSObject {

}
+(NSMutableURLRequest*)getURq_getansascreen:(NSString*)ws_name;

//-------------------------------------------------------

+(NSString*)getWS_testJSON;
+(NSString*)getWS_testXML;
@end
