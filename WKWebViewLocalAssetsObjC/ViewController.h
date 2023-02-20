//
//  ViewController.h
//  WKWebViewLocalAssetsObjC
//
//  Created by jomart mirza on 02/02/2023.
//  Copyright © 2023 Sergey Vasilevkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocalizeHelper.h"
#import <WebKit/WebKit.h>
#import <MessageUI/MessageUI.h>
#import "AppDelegate.h"
#import "MainViewController.h"
#import <WebKit/WKWebViewConfiguration.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewController : UIViewController <WKScriptMessageHandler,WKUIDelegate,WKNavigationDelegate, MFMailComposeViewControllerDelegate>
@property (nonatomic, assign) BOOL showAlertEnabled;
@property (nonatomic, assign) BOOL showAlertEnabled2;
- (void)save_sett;
@end



NS_ASSUME_NONNULL_END
