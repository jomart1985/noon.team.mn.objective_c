// LocalizeHelper.m
#import "LocalizeHelper.h"

// Singleton
static LocalizeHelper* SingleLocalSystem = nil;

// my Bundle (not the main bundle!)
static NSBundle* myBundle = nil;


@implementation LocalizeHelper


//-------------------------------------------------------------
// allways return the same singleton
//-------------------------------------------------------------
+ (LocalizeHelper*) sharedLocalSystem {
    // lazy instantiation
    if (SingleLocalSystem == nil) {
        SingleLocalSystem = [[LocalizeHelper alloc] init];
    }
    return SingleLocalSystem;
}


//-------------------------------------------------------------
// initiating
//-------------------------------------------------------------
- (id) init {
    self = [super init];
    if (self) {
        // use systems main bundle as default bundle
        myBundle = [NSBundle mainBundle];
    }
    return self;
}


//-------------------------------------------------------------
// translate a string
//-------------------------------------------------------------
// you can use this macro:
// LocalizedString(@"Text");
- (NSString*) localizedStringForKey:(NSString*) key {
    // this is almost exactly what is done when calling the macro NSLocalizedString(@"Text",@"comment")
    // the difference is: here we do not use the systems main bundle, but a bundle
    // we selected manually before (see "setLanguage")
    return [myBundle localizedStringForKey:key value:@"" table:nil];
}


//-------------------------------------------------------------
// set a new language
//-------------------------------------------------------------
// you can use this macro:
// LocalizationSetLanguage(@"German") or LocalizationSetLanguage(@"de");
- (void) setLanguage:(NSString*) lang {

    // path to this languages bundle
    NSString *path = [[NSBundle mainBundle] pathForResource:lang ofType:@"lproj" ];
    if (path == nil) {
        // there is no bundle for that language
        // use main bundle instead
        myBundle = [NSBundle mainBundle];
    } else {

        // use this bundle as my bundle from now on:
        myBundle = [NSBundle bundleWithPath:path];

        // to be absolutely shure (this is probably unnecessary):
        if (myBundle == nil) {
            myBundle = [NSBundle mainBundle];
        }
    }
}

+(void)saveToUserDefaults:(NSString *)key_for_the_String obj:(NSString*) string_to_store
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];

    if (standardUserDefaults) {
        [standardUserDefaults setObject:string_to_store forKey:key_for_the_String];
        [standardUserDefaults synchronize];
    }
}


+(NSString*)readUserDefaults:(NSString *)key_for_the_String{
    if(![[NSUserDefaults standardUserDefaults]
       stringForKey:key_for_the_String]){
        
        return @"null";
    }
   
    return [[NSUserDefaults standardUserDefaults]
        stringForKey:key_for_the_String];
}


+(void)go_to_vc:(UIViewController *)vc{
    
    
    
    AppDelegate *delegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    UIWindow *mainWindow = delegate.window;
    
    [mainWindow  insertSubview:vc.view belowSubview:mainWindow.rootViewController.view];

    [UIView transitionWithView:mainWindow
                          duration:0
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            [mainWindow.rootViewController.view removeFromSuperview];
                        }
                        completion:^(BOOL completed){
                            mainWindow.rootViewController=vc;
                        }];
    
    
}

+(void)load_webview:(WKWebView*)wv name:(NSString*) name type:(NSString*) type port:(NSString*) portn
{
    
    
    if([type isEqual:@"local"]){
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:name ofType:@"html" inDirectory:@"app"];
        
        NSURL *filePathURL = [NSURL fileURLWithPath:filePath];
        NSURL *fileDirectoryURL = [filePathURL URLByDeletingLastPathComponent];
        
    
        
        [wv loadFileURL:filePathURL allowingReadAccessToURL:fileDirectoryURL];
        
        
        NSString *urlstring;
        NSString *port;
        
        //port  = [NSString stringWithFormat:@"http://localhost:%@/%@", portn,name];
        
        port  = [NSString stringWithFormat:@"http://192.168.1.108:%@/app/%@%@", @"80",name,@".html"];
        urlstring = port;
        NSURL *nsurl=[NSURL URLWithString:urlstring];
        NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];

        NSLog(@"xxxxxxxxxxx 3 %@",port);
       
        
        
        
       // [wv loadRequest:nsrequest];
        
        
    }else{
        NSString *urlstring;
        NSString *port;
        
        port  = [NSString stringWithFormat:@"http://localhost:%@/%@", portn,name];
        
        //port  = [NSString stringWithFormat:@"http://192.168.1.108:%@/%@", portn,name];
        urlstring = port;
        NSURL *nsurl=[NSURL URLWithString:urlstring];
        NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];

        NSLog(@"xxxxxxxxxxx 3 %@",portn);
       
        
        
        
        [wv loadRequest:nsrequest];
        
    }
    
}
@end
