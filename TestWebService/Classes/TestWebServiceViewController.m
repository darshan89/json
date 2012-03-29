//
//  TestWebServiceViewController.m
//  TestWebService
//
//  Created by apple on 8/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TestWebServiceViewController.h"

@implementation TestWebServiceViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	date = [NSDate date];
    [progressValue setProgress:0.0];
    
}

-(IBAction)startJSONWebservice{
	[self JSON];
}
-(IBAction)startXMLWebservice{
	start1=[NSDate timeIntervalSinceReferenceDate];
	[self GDATA];
}


-(void)JSON{
	start = [NSDate timeIntervalSinceReferenceDate];

	NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.openxcellaus.info/test_json.php"]];
	JSONParser *parser = [[JSONParser alloc] initWithRequestForThread:request sel:@selector(searchResult:) andHandler:self];
	

	
}
-(void)searchResult:(NSDictionary*)dictionary{
    
    
	NSTimeInterval timePassed_ms1 = [NSDate timeIntervalSinceReferenceDate] - start;
	timeJson.text=[NSString stringWithFormat:@"%f",timePassed_ms1];
   
}
-(void)XML{
	
	start1 = [NSDate timeIntervalSinceReferenceDate];
	
	WSPContinuous *wspcontinuous;
	wspcontinuous = [[WSPContinuous alloc] initWithRequestForThread:[webService getURq_getansascreen:[webService getWS_testXML]] 
															rootTag:@"Record" 
														startingTag:[NSDictionary dictionaryWithObjectsAndKeys:nil] 
														  endingTag:[NSDictionary dictionaryWithObjectsAndKeys:@"id",@"id",@"description",@"description",nil] 
														  otherTags:[NSDictionary dictionaryWithObjectsAndKeys:nil] 
																sel:@selector(finisheParsing:) 
														 andHandler:self];
	
}

-(void)finisheParsing:(NSDictionary*)dictionary{
	
    
    
	NSTimeInterval timePassed_ms1 = [date timeIntervalSinceNow] - start1;
	
	NSLog(@"finisheParsing");
}


-(void)GDATA{
	
	GdataParser *parser = [[GdataParser alloc] init];
    
    NSString *strpath=[[NSBundle mainBundle] pathForResource:@"section1" ofType:@"xml"];
	[parser downloadAndParse:[NSURL fileURLWithPath:strpath] 
				 withRootTag:[NSArray arrayWithObjects:@"Chapter",@"questions",nil]
					withTags:[NSDictionary dictionaryWithObjectsAndKeys:@"Chaptername",@"Chaptername",@"question",@"question",nil] 
						 sel:@selector(finishGetData:) 
				  andHandler:self];
	 
	/*
	TBxmlParser *parser = [[TBxmlParser alloc] init];
	[parser downloadAndParse:[NSURL URLWithString:@"http://openxcellaus.info/krupal_webservices_test/taxiApp/pull_Data.php?currentLat=11.11&currentLon=10.10"] 
				 withRootTag:@"Record"
					withTags:[NSDictionary dictionaryWithObjectsAndKeys:@"reqID",@"reqID",@"currentLat",@"currentLat",nil] 
						 sel:@selector(finishGetData:) 
				  andHandler:self];
	*/
}
-(void)finishGetData:(NSMutableDictionary *)dictionary{
    NSLog(@"dictionary:%@",dictionary);
    
      
    
	NSTimeInterval timePassed_ms1 = [NSDate timeIntervalSinceReferenceDate] - start1;
	time.text=[NSString stringWithFormat:@"%f",timePassed_ms1];
	
    
}
-(IBAction)btnDownload:(id)sender
{
    [self downloadimages];
       
    

}
-(void)downloadimages
{
    
    for (int k=0; k<[arrURl count]; k++) 
    {
        
        UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[arrURl objectAtIndex:k]]]];
        
        NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        
        // If you go to the folder below, you will find those pictures
        //  NSLog(@"%@",docDir);
        
        // NSLog(@"saving png");
        NSString *pngFilePath = [NSString stringWithFormat:@"%@/%d%@",docDir,k,@"test.png"];
        NSLog(@"%d",k);
        NSData *data1 = [NSData dataWithData:UIImagePNGRepresentation(image)];
        [data1 writeToFile:pngFilePath atomically:YES];
        
         // NSLog(@"%f",m);
        
        [self performSelectorInBackground:@selector(down) withObject:nil];
        
               
    }
  

}
-(void)down
{
    NSAutoreleasePool *pool=[[NSAutoreleasePool alloc] init];
    
    
    [progressValue setProgress:progressValue.progress+0.0087];
    [pool release];
}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
