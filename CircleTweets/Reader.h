//
//  ReaderVC.h
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import <CoreLocation/CoreLocation.h>


@interface ReaderVC : UIViewController <MBProgressHUDDelegate, UIGestureRecognizerDelegate, UIWebViewDelegate> {
    
    MBProgressHUD *HUD;
    UIWebView *post;
    UISwipeGestureRecognizer *back;
}

@property (strong, nonatomic) NSMutableArray *parseResults;

@property (nonatomic) int sharedIndex;

@property (strong, nonatomic) NSMutableString *url;

@property (nonatomic, retain) CLLocationManager *locationManager;



-(void)showLoadingView;
-(void)back;

@end
