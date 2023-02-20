//
//  AppDelegate.m
//  WKWebViewLocalAssetsObjC
//
//  Created by Sergey Vasilevkin on 09/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate () <UNUserNotificationCenterDelegate>
@end

static const int ddLogLevel = LOG_LEVEL_VERBOSE;

HTTPServer *httpServer;

@implementation AppDelegate

NSString *const kGCMMessageIDKey = @"gcm.message_id";

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

   
    
    // Configure our logging framework.
    // To keep things simple and fast, we're just going to log to the Xcode console.
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    // Create server using our custom MyHTTPServer class
    httpServer = [[HTTPServer alloc] init];
    
    // Tell the server to broadcast its presence via Bonjour.
    // This allows browsers such as Safari to automatically discover our service.
    [httpServer setType:@"_http._tcp."];
    
    // Normally there's no need to run our server on any specific port.
    // Technologies like Bonjour allow clients to dynamically discover the server's port at runtime.
    // However, for easy testing you may want force a certain port so you can just hit the refresh button.
     
    if([[LocalizeHelper readUserDefaults:@"port_number"] isEqual:@"null"]){
        [LocalizeHelper saveToUserDefaults:@"port_number" obj:@"4040"];
        [httpServer setPort:4040];
        
     
    }else{
        
        NSString *a = [LocalizeHelper readUserDefaults:@"port_number"];
        NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];

        UInt16 portNumber = [[formatter numberFromString:a] unsignedShortValue];
        
        //NSLog(@"jomaaaaaaaaart%@",a);
        
        [a integerValue];
        [httpServer setPort:portNumber];
        
        
    }
    
    
    //[httpServer setPort:4040];
    
    // Serve files from our embedded Web folder
    NSString *webPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"app"];
    DDLogInfo(@"Setting document root: %@", webPath);
    
    [httpServer setDocumentRoot:webPath];

    if(![[LocalizeHelper readUserDefaults:@"server_error"] isEqual:@"null"] || [[LocalizeHelper readUserDefaults:@"server_error"] isEqual:@"false"]){
        
        [self startServer];
    }
    else{
        
        [LocalizeHelper saveToUserDefaults:@"server_error" obj:@"true"];
    }
    
    
    
    
    self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    ViewController *mainViewController = [[ViewController alloc] init];
    self.window.rootViewController = mainViewController;
    [self.window makeKeyAndVisible];

    
    
   /* [launchOptions valueForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)])
        {
            [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]];
        }
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else
    {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes: (UIRemoteNotificationTypeNewsstandContentAvailability| UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    }
    */
    
   
    [FIRApp configure];
    // [END configure_firebase]

    // [START set_messaging_delegate]
    [FIRMessaging messaging].delegate = self;
    // [END set_messaging_delegate]

    // Register for remote notifications. This shows a permission dialog on first run, to
    // show the dialog at a more appropriate time move this registration accordingly.
    // [START register_for_notifications]

    [UNUserNotificationCenter currentNotificationCenter].delegate = self;
    UNAuthorizationOptions authOptions = UNAuthorizationOptionAlert |
        UNAuthorizationOptionSound | UNAuthorizationOptionBadge;
    [[UNUserNotificationCenter currentNotificationCenter]
        requestAuthorizationWithOptions:authOptions
        completionHandler:^(BOOL granted, NSError * _Nullable error) {
          // ...
        }];

    [application registerForRemoteNotifications];
    // [END register_for_notifications]
    
    
    return YES;
}


// [START receive_message]
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
    fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
  // If you are receiving a notification message while your app is in the background,
  // this callback will not be fired till the user taps on the notification launching the application.
  // TODO: Handle data of notification

  // With swizzling disabled you must let Messaging know about the message, for Analytics
  // [[FIRMessaging messaging] appDidReceiveMessage:userInfo];

  // [START_EXCLUDE]
  // Print message ID.
  if (userInfo[kGCMMessageIDKey]) {
    NSLog(@"Message ID: %@", userInfo[kGCMMessageIDKey]);
  }
  // [END_EXCLUDE]

  // Print full message.
  NSLog(@"%@", userInfo);

  completionHandler(UIBackgroundFetchResultNewData);
}


- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
  // If you are receiving a notification message while your app is in the background,
  // this callback will not be fired till the user taps on the notification launching the application.
  // TODO: Handle data of notification

  // With swizzling disabled you must let Messaging know about the message, for Analytics
  // [[FIRMessaging messaging] appDidReceiveMessage:userInfo];

  // [START_EXCLUDE]
  // Print message ID.
  if (userInfo[kGCMMessageIDKey]) {
    NSLog(@"Message ID: %@", userInfo[kGCMMessageIDKey]);
  }
  // [END_EXCLUDE]

  // Print full message.
  NSLog(@"%@", userInfo);
}



- (void)messaging:(FIRMessaging *)messaging didReceiveRegistrationToken:(NSString *)fcmToken {
    NSLog(@"FCM registration token: %@", fcmToken);
    // Notify about received token.
    NSDictionary *dataDict = [NSDictionary dictionaryWithObject:fcmToken forKey:@"token"];
    [[NSNotificationCenter defaultCenter] postNotificationName:
     @"FCMToken" object:nil userInfo:dataDict];
    // TODO: If necessary send token to application server.
    // Note: This callback is fired at each app startup and whenever a new token is generated.
}


// With "FirebaseAppDelegateProxyEnabled": NO
- (void)application:(UIApplication *)application
    didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [FIRMessaging messaging].APNSToken = deviceToken;
}


- (bool)checkServer :(NSString *)port{
    //[DDLog addLogger:[DDTTYLogger sharedInstance]];
    

    [httpServer setType:@"_http._tcp."];
   
        NSString *a = port;
        NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];

        UInt16 portNumber = [[formatter numberFromString:a] unsignedShortValue];
        
        //NSLog(@"jomaaaaaaaaart%@",a);
        
        [a integerValue];
        [httpServer setPort:portNumber];
        
    
    
    NSError *error;
    if([httpServer start:&error])
    {
        DDLogInfo(@"Started HTTP Server on port %hu", [httpServer listeningPort]);
        
        
        
        return true;
    }
    else
    {
       
        
        DDLogError(@"Error starting HTTP Server: %@", error);
        return false;
    }
}



- (void)startServer
{
    //[DDLog addLogger:[DDTTYLogger sharedInstance]];
    

    [httpServer setType:@"_http._tcp."];
    
     
    if([[LocalizeHelper readUserDefaults:@"port_number"] isEqual:@"null"]){
        [LocalizeHelper saveToUserDefaults:@"port_number" obj:@"4040"];
        [httpServer setPort:4040];
        
     
    }else{
        
        NSString *a = [LocalizeHelper readUserDefaults:@"port_number"];
        NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];

        UInt16 portNumber = [[formatter numberFromString:a] unsignedShortValue];
        
        //NSLog(@"jomaaaaaaaaart%@",a);
        
        [a integerValue];
        [httpServer setPort:portNumber];
        
        
    }
    
    
    NSError *error;
    if([httpServer start:&error])
    {
        DDLogInfo(@"Started HTTP Server on port %hu", [httpServer listeningPort]);
        
       // [LocalizeHelper saveToUserDefaults:@"server_error" obj:@"true"];
        
    }
    else
    {
        DDLogError(@"Error starting HTTP Server: %@", error);
        
        [LocalizeHelper saveToUserDefaults:@"server_error" obj:@"true"];
        [self stopServer];
        
    }
}

- (void)stopServer
{
    // Start the server (and check for problems)
    

    [httpServer stop];
       
   
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void (^)(void))completionHandler{
    
    
    NSString * userInfo = response.notification.request.content.userInfo[@"path"];
           if (userInfo) {
               NSString * userid1 = userInfo;
          
               NSURL *resourceToOpen = [NSURL fileURLWithPath:userid1];
               
        
               NSString* path = userid1;
            
                  NSURL* url = [NSURL fileURLWithPath:path];
                  UIDocumentInteractionController* docController = [UIDocumentInteractionController interactionControllerWithURL:url];
                  docController.delegate = self;
                  //[docController presentPreviewAnimated:YES];
            
              // [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"photos-redirect://"]];
               
               UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                   picker.delegate = self;
                   picker.allowsEditing = NO;
              // picker.
               picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

              [self.window.rootViewController presentViewController:picker animated:YES completion:nil];
               
              /* UIImageView *dot =[[UIImageView alloc] initWithFrame:CGRectMake(50,50,20,20)];
                 dot.image=[UIImage imageNamed:path];
                 [self.window addSubview:dot];*/
               
               
               
    /*UIAlertView *notificationAlert = [[UIAlertView alloc] initWithTitle:userid1
        message:userid1
    delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];

    [notificationAlert show];*/
               
           }
    
 
}

-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification:(UNNotificationResponse *)response withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {

    
    
    NSDictionary *userInfo = notification.request.content.userInfo;

    // With swizzling disabled you must let Messaging know about the message, for Analytics
    // [[FIRMessaging messaging] appDidReceiveMessage:userInfo];

    // [START_EXCLUDE]
    // Print message ID.
    if (userInfo[kGCMMessageIDKey]) {
      NSLog(@"Message ID: %@", userInfo[kGCMMessageIDKey]);
    }
    // [END_EXCLUDE]

    // Print full message.
    NSLog(@"%@", userInfo);

  
    
    completionHandler(UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionBadge);
      
    
    
    
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

    [httpServer stop];
}



- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
  NSLog(@"Unable to register for remote notifications: %@", error);
}





- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    [self startServer];

}



- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
