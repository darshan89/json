//
//  TestWebServiceAppDelegate.h
//  TestWebService
//
//  Created by apple on 8/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TestWebServiceViewController;

@interface TestWebServiceAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TestWebServiceViewController *viewController;
}
//
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TestWebServiceViewController *viewController;

@end

