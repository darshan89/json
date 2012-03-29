//
//  GdataParser.m
//  TestWebService
//
//  Created by apple on 8/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GdataParser.h"


@implementation GdataParser
@synthesize tagDic,arrRootTag;
- (void)downloadAndParse:(NSURL *)url withRootTag:(NSArray *)root withTags:(NSDictionary*)tags sel:(SEL)seletor andHandler:(NSObject*)handler{
	self.tagDic =tags;
	self.arrRootTag=root;
	targetSelector=seletor;
	MainHandler=handler;
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
    
        

    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:nil];
    NSMutableArray *finalResult = [[NSMutableArray alloc] init];
	
    dictionaryFinal =[[NSMutableDictionary alloc]init];
    
    for (int k=0; k<[arrRootTag count]; k++) {
    
	NSArray *items = [doc nodesForXPath:[NSString stringWithFormat:@"//%@",[arrRootTag objectAtIndex:k]] error:nil];
        
       // NSLog(@"itemas %@",items);
        
        
    for (GDataXMLElement *item in items) {
		
		NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        
		NSArray *ar= [tagDic allKeys];
		for (int i=0; i < [ar count]; i++) {
			 NSArray *tmpArray = [item elementsForName:[NSString stringWithFormat:@"%@",[tagDic objectForKey:[ar objectAtIndex:i]]]];
			for(GDataXMLElement *aID in tmpArray) {
                tempDict=[[aID attributesAsDictionary] retain];
              
                
                [dic addEntriesFromDictionary:tempDict];
                
				[dic setValue:aID.stringValue forKey:[NSString stringWithFormat:@"%@",[tagDic objectForKey:[ar objectAtIndex:i]]]];
				break;
			}
		}
        
        [finalResult addObject:dic];
        
               
    }
        [dictionaryFinal setObject:[finalResult copy]forKey:[arrRootTag objectAtIndex:k]];
        [finalResult removeAllObjects];
        
    }
      /*
		NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        NSArray *ids = [item elementsForName:kName_Title];
        for(GDataXMLElement *aID in ids) {

			[dic setValue:aID.stringValue forKey:@"id"];
            break;
        }
        NSArray *descr = [item elementsForName:kName_Category];
        for(GDataXMLElement *category in descr) {
           
			[dic setValue:category.stringValue forKey:@"desc"];
            break;
        }
		[finalResult addObject:dic];
	*/
       
	
	[MainHandler performSelector:targetSelector withObject:dictionaryFinal];

    xmlData = nil;
    // Set the condition which ends the run loop.
 
}



- (void)dealloc {

    [super dealloc];
}

@end
