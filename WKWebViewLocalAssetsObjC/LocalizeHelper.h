#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

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

// some macros (optional, but makes life easy)

// Use "LocalizedString(key)" the same way you would use "NSLocalizedString(key,comment)"
#define LocalizedString(key) [[LocalizeHelper sharedLocalSystem] localizedStringForKey:(key)]

// "language" can be (for american english): "en", "en-US", "english". Analogous for other languages.
#define LocalizationSetLanguage(language) [[LocalizeHelper sharedLocalSystem] setLanguage:(language)]


@interface LocalizeHelper:UIViewController
<NSObject>

// a singleton:
+ (LocalizeHelper*) sharedLocalSystem;

// this gets the string localized:
- (NSString*) localizedStringForKey:(NSString*) key;

//set a new language:
- (void) setLanguage:(NSString *) lang;

+(void)saveToUserDefaults:(NSString*)string_to_store obj:(NSString *)key_for_the_String;

+(NSString*)readUserDefaults:(NSString *)key_for_the_String;

+(void)go_to_vc:(UIViewController *)vc;

+(void)load_webview:(WKWebView*)wv name:(NSString*) name type:(NSString*) type port:(NSString*) portn;
@end
