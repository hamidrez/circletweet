//
//  MainVC.h
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

#import "KMXMLParser.h"

@interface MainVC : UITableViewController <KMXMLParserDelegate> {
    
    UIImageView *postImage;
}

@property (nonatomic, retain) CLLocationManager *locationManager;

@property (strong, nonatomic) NSMutableArray *parseResults;

@property (strong, nonatomic) NSMutableString *url;


@end
