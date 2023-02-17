//
//  UIViewController+Print.h
//  WKWebView-Print
//
//  http://github.com/sergemoskalenko/WKWebView-Print-Simple
//  Created by Serge Moskalenko on 19.07.2018.
//  Copyright © 2018 Serge Moskalenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
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



@interface UIViewController(Print)<UISearchBarDelegate, WKNavigationDelegate, MFMailComposeViewControllerDelegate,WKUIDelegate,UITextFieldDelegate>

- (void)printTitle:(NSString *)title webView:(WKWebView *)webView;
@end
