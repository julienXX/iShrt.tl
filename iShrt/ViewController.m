#define shrtBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

#define shrtURL [NSURL URLWithString: @"http://shrt.tl/v1/analytics?url=http://shrt.tl/"]

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dispatch_async(shrtBgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL: shrtURL];
        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
    });
}

- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization 
                          JSONObjectWithData:responseData
                          
                          options:kNilOptions 
                          error:&error];
    
    NSArray* hit = [json objectForKey:@"hit"];
    NSArray* hitFromFacebook = [json objectForKey:@"hit_from_facebook"];
    
    NSLog(@"hit: %@", hit);
    NSLog(@"hit_from_facebook: %@", hitFromFacebook);
    
    jsonSummary.text = [NSString stringWithFormat:@"Hits: %@\nHits from Facebook: %@",
                        [json objectForKey:@"hit"],
                        [json objectForKey:@"hit_from_facebook"]];
}

@end

