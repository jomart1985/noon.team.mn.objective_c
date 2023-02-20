//
//  MainViewController.h
//  WKWebViewLocalAssetsObjC
//
//  Created by Sergey Vasilevkin on 09/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//


#import <AssetsLibrary/AssetsLibrary.h>
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import <MessageUI/MessageUI.h>
#import "WKWebViewPanelManager.h"
#import <WebKit/WKWebViewConfiguration.h>
#import "UIViewController+Print.h"
#import "LocalizeHelper.h"
#import "ViewController.h"
#import <Photos/Photos.h>
#import <mach-o/arch.h>
#import "DropDownMenu.h"
#import <QuartzCore/QuartzCore.h>
#import "Intro.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController <UISearchBarDelegate, WKNavigationDelegate, MFMailComposeViewControllerDelegate,WKUIDelegate,UITextFieldDelegate>

@end

NS_ASSUME_NONNULL_END
