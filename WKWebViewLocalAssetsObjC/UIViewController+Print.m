//
//  UIViewController+Print.m
//  WKWebView-Print
//
//  http://github.com/sergemoskalenko/WKWebView-Print-Simple
//  Created by Serge Moskalenko on 19.07.2018.
//  Copyright © 2018 Serge Moskalenko. All rights reserved.
//

#import "UIViewController+Print.h"

@interface UIViewController()

@property (nonatomic, assign) WKWebView *webView;

@end


@implementation UIViewController(Print)

- (void)printTitle:(NSString *)title webView:(WKWebView *)webView {
    
    WKWebViewConfiguration* configuration = [WKWebViewConfiguration new];
    [configuration.userContentController addScriptMessageHandler:(id <WKScriptMessageHandler>)self name:@"observer"];
    
    WKWebView *webView2 = [[WKWebView alloc] initWithFrame:webView.frame configuration:configuration];
    [webView2.configuration.preferences setValue:@TRUE forKey:@"allowFileAccessFromFileURLs"];

    webView2.backgroundColor = [UIColor lightGrayColor];
    webView2.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    webView2.navigationDelegate = self;
    webView2.UIDelegate = self;
    
    webView2 = webView;
    
    NSString *urlstring22 =  [NSString stringWithFormat:@"http://192.168.1.108:%@/app/dir.html", [LocalizeHelper readUserDefaults:@"port_number"]];
    
    
    
    
    
    
    NSURL *nsurl22=[NSURL URLWithString:urlstring22];
    NSURLRequest *nsrequest22=[NSURLRequest requestWithURL:nsurl22];
 
    
    
    if(webView.URL!= NULL){
        NSLog(@"cool");
       // [webView2 reload];
    }
    else{
        //[webView2 loadRequest:nsrequest22];
        
    }
    
    
    
   // dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 3);
    // dispatch_after(delay, dispatch_get_main_queue(), ^(void){
         
        // [webView evaluateJavaScript:@"window.location.href;reload();" completionHandler:^(id result, NSError *error) {
            
             
             UIPrintInteractionController *controller = [UIPrintInteractionController sharedPrintController];
             void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) =
             ^(UIPrintInteractionController *printController, BOOL completed, NSError *error) {
                 if(!completed && error){
                     NSLog(@"FAILED! due to error in domain %@ with error code %ld",
                           error.domain, (long)error.code);
                 }
             };
             UIPrintInfo *printInfo = [UIPrintInfo printInfo];
             printInfo.outputType = UIPrintInfoOutputGeneral;
             printInfo.jobName = title;
             printInfo.duplex = UIPrintInfoDuplexLongEdge;
             controller.printInfo = printInfo;
             controller.showsPageRange = YES;
             
             UIViewPrintFormatter *viewFormatter = webView2.viewPrintFormatter;
             viewFormatter.startPage = 0;
             controller.printFormatter = viewFormatter;
         
             
             
             if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
                 [controller presentFromBarButtonItem:nil animated:YES completionHandler:completionHandler];
             else
                 [controller presentAnimated:YES completionHandler:completionHandler];
           
        // }];
         
    // });
    

}


- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
        NSLog(@"tttttttt");
}


@end
