//
//  ViewController.h

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ViewController.h"
#import <WebKit/WebKit.h>
#import <MessageUI/MessageUI.h>
#import "WKWebViewPanelManager.h"
#import <WebKit/WKWebViewConfiguration.h>
@interface Intro : UITableViewController<UITextFieldDelegate,UISearchBarDelegate, WKNavigationDelegate, MFMailComposeViewControllerDelegate,WKUIDelegate,UITextFieldDelegate>
- (void)showIntroWithCrossDissolve;
@property (nonatomic, assign) BOOL show_sett;
@property (nonatomic, assign) BOOL show_intro;
@property (nonatomic, assign) BOOL islunch;
@property (nonatomic, assign) BOOL islunch2;

@property (nonatomic, assign) WKWebView *webView;
@end

