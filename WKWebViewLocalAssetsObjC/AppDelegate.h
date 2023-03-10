//
//  AppDelegate.h
//  WKWebViewLocalAssetsObjC
//
//  Created by Sergey Vasilevkin on 09/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>
#import "HTTPServer.h"
#import "DDLog.h"
#import "DDTTYLogger.h"
#import "LocalizeHelper.h"


@import UserNotifications;
@import FirebaseCore;
@import FirebaseMessaging;

@import UIKit;

@protocol FIRMessagingDelegate;

@interface AppDelegate : UIResponder <UIApplicationDelegate  ,UIDocumentInteractionControllerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,FIRMessagingDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)startServer;
- (void)stopServer;
- (bool)checkServer :(NSString *)port;

@end



