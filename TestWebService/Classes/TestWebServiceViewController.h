//
//  TestWebServiceViewController.h
//  TestWebService
//
//  Created by apple on 8/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "webService.h"
#import "WSPContinuous.h"
#import "JSON.h"

#import "GdataParser.h"
#import "TBxmlParser.h"
#import "JSONParser.h"
@interface TestWebServiceViewController : UIViewController {

	NSDate *date;
	float JSONTime;
	float XMLTime;
	
	NSTimeInterval start1;
	NSTimeInterval start;
	NSTimeInterval end1;

	IBOutlet UILabel *time;
	IBOutlet UILabel *timeJson;
    IBOutlet UIButton *btnDownload;
    IBOutlet UIProgressView *progressValue;
    NSMutableArray *arrURl;
    float m;
}
-(IBAction)startJSONWebservice;
-(IBAction)startXMLWebservice;
-(IBAction)btnDownload:(id)sender;
-(IBAction)progressChanged:(id)sender;
-(void)JSON;
-(void)XML;
-(void)GDATA;
-(void)downloadimages;
@end

