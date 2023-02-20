
#import <Foundation/Foundation.h>
#import <WebKit/WKWebView.h>
#import <WebKit/WKWebViewConfiguration.h>

@interface WKWebViewPanelManager : NSObject

+ (void) presentAlertOnController:(nonnull UIViewController*)parentController title:(nullable NSString*)title message:(nullable NSString *)message handler:(nonnull void (^)())completionHandler;
+ (void) presentConfirmOnController:(nonnull UIViewController*)parentController title:(nullable NSString*)title message:(nullable NSString *)message handler:(nonnull void (^)(BOOL result))completionHandler;
+ (void) presentPromptOnController:(nonnull UIViewController*)parentController title:(nullable NSString*)title message:(nullable NSString *)message defaultText:(nullable NSString*)defaultText handler:(nonnull void (^)(NSString * __nullable result))completionHandler;

@end
