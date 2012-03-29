//
//  GdataParser.h
//  TestWebService
//
//  Created by apple on 8/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataXMLNode.h"

@interface GdataParser : NSObject {

	NSMutableData *xmlData;
	NSDictionary *tagDic;
	//NSString *rootTag;
    
    NSArray *arrRootTag;
	
	SEL targetSelector;
	NSObject *MainHandler;
    NSDictionary *tempDict;
    NSDictionary *dictemp;
    int countDic;
    int countdic2;
    int countdic3;
    NSMutableDictionary *dictionaryFinal;
	
}
//@property(nonatomic,retain) NSString *rootTag;

@property (nonatomic,retain)NSArray *arrRootTag;
@property(nonatomic,retain) NSDictionary *tagDic;
//- (void)downloadAndParse:(NSURL *)url withRootTag:(NSString*)root withTags:(NSDictionary*)tags sel:(SEL)seletor andHandler:(NSObject*)handler;

- (void)downloadAndParse:(NSURL *)url withRootTag:(NSArray *)root withTags:(NSDictionary*)tags sel:(SEL)seletor andHandler:(NSObject*)handler;
@end
