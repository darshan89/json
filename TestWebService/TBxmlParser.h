//
//  TBxmlParser.h
//  TestWebService
//
//  Created by apple on 8/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBXML.h"

@interface TBxmlParser : NSObject {

	NSMutableData *xmlData;
	NSDictionary *tagDic;
	NSString *rootTag;
	
	SEL targetSelector;
	NSObject *MainHandler;
	
}
@property(nonatomic,retain) NSString *rootTag;
@property(nonatomic,retain) NSDictionary *tagDic;
- (void)downloadAndParse:(NSURL *)url withRootTag:(NSString*)root withTags:(NSDictionary*)tags sel:(SEL)seletor andHandler:(NSObject*)handler;

@end
