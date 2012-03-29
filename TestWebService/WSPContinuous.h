//
//  WSPContinuous.h
//  ZawJi
//
//  Created by openxcell open on 11/16/10.
//  Copyright 2010 xcsxzc. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface WSPContinuous : NSObject <NSXMLParserDelegate>{
	NSURLRequest *rq;
	NSString *RootTag;
	NSDictionary *StartingTag;
	NSDictionary *EndTag;
	NSDictionary *OthereTags;
	SEL targetSelector;
	NSObject *MainHandler;
	BOOL didGetHTML;
	NSURLConnection *con;
	NSMutableData *myWebData;
	NSXMLParser *myXMLParser;
	
	NSMutableString *tmpString;
	NSMutableDictionary *tmpOther;
	NSMutableArray *tmpArray;
	NSMutableDictionary *tmpDic;
	
}

-(id)initWithRequestForThread:(NSMutableURLRequest*)urlRequest rootTag:(NSString*)rootTag startingTag:(NSDictionary*)startingTag endingTag:(NSDictionary*)endingTag otherTags:(NSDictionary*)otherTags sel:(SEL)seletor andHandler:(NSObject*)handler;


@property(nonatomic,retain) NSURLRequest *rq;
@property(nonatomic,retain) NSString *RootTag;
@property(nonatomic,retain) NSDictionary *StartingTag;
@property(nonatomic,retain) NSDictionary *EndTag;
@property(nonatomic,retain) NSDictionary *OthereTags;
@property(nonatomic) SEL targetSelector;
@property(nonatomic,retain) NSObject *MainHandler;
@property(nonatomic,retain) NSMutableArray *objectArray;

@end
