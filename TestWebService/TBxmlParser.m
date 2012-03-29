//
//  TBxmlParser.m
//  TestWebService
//
//  Created by apple on 8/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TBxmlParser.h"


@implementation TBxmlParser
@synthesize tagDic,rootTag;

- (void)downloadAndParse:(NSURL *)url withRootTag:(NSString*)root withTags:(NSDictionary*)tags sel:(SEL)seletor andHandler:(NSObject*)handler{
	self.tagDic =tags;
	self.rootTag=root;
	
	NSURLRequest *theRequest = [NSURLRequest requestWithURL:url];
	xmlData = [[NSMutableData alloc] init];
	NSURLConnection  *rssConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
	
	
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
	
	[xmlData setLength:0];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	
    [xmlData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	
	/*
	TBXML *xml =  [[TBXML tbxmlWithXMLData:xmlData] retain];
	TBXMLElement *root = xml.rootXMLElement;
	NSMutableArray *finalArray = [[NSMutableArray alloc] init];
	if (root) {
		NSArray *ar= [tagDic allKeys];
		for (int i=0; i < [ar count]; i++) {
			NSString *key = [NSString stringWithFormat:@"%@",[tagDic objectForKey:[ar objectAtIndex:i]]];
		
			TBXMLElement *child1 = [TBXML childElementNamed:key parentElement:root];
			NSMutableDictionary *tmp = [[NSMutableDictionary alloc] init];
		//	while (child1->nextSibling){
		//		child1 = child1->nextSibling;	
			NSLog(@"%@",[TBXML textForElement:child1]);
				[tmp setValue:[TBXML textForElement:child1] forKey:key];
		//	}
			[finalArray addObject:tmp];
		}
		
	}

	[MainHandler performSelector:targetSelector withObject:[NSDictionary dictionaryWithObjectsAndKeys:finalArray,@"array",nil]];
	
    xmlData = nil;
	*/
	
}










@end
