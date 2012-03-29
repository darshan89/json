#import <Foundation/Foundation.h>
#import "GDataXMLNode.h"

// These methods are not part of the standard NSXML API.
// But any developer working extensively with XML will likely appreciate them.

@interface GDataXMLElement (GDataAdditions)

+ (GDataXMLElement *)elementWithName:(NSString *)name xmlns:(NSString *)ns;

- (GDataXMLElement *)elementForName:(NSString *)name;
- (GDataXMLElement *)elementForName:(NSString *)name xmlns:(NSString *)xmlns;
-(NSString *)valueForElement:(NSString *)name;

- (NSString *)xmlns;
- (void)setXmlns:(NSString *)ns;

- (void)addAttributeWithName:(NSString *)name stringValue:(NSString *)string;

- (NSDictionary *)attributesAsDictionary;

@end
