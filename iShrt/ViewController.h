//
//  ViewController.h
//  Shrt
//
//  Created by Julien Blanchard on 06/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController {
    IBOutlet UITextField* shortenedURL;
    IBOutlet UILabel* jsonSummary;
    IBOutlet UIButton* goButton;
}

- (IBAction) findResults: (id) sender;

@end
