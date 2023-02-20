//
//  ViewController.m
//  WKWebViewLocalAssetsObjC
//
//  Created by jomart mirza on 02/02/2023.
//  Copyright © 2023 Sergey Vasilevkin. All rights reserved.
//

#import "ViewController.h"
#import "Intro.h"

@interface ViewController ()
@property (nonatomic, assign) WKWebView *webView;
@end

MainViewController *controler;
Intro *intro;

@implementation ViewController

@synthesize showAlertEnabled;
@synthesize showAlertEnabled2;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidLoad];
   
    intro = [[Intro alloc] init];
    [intro showIntroWithCrossDissolve];
    intro.show_intro = true;
    //[LocalizeHelper go_to_vc:intro];
    
   // @[][1];
    
    
    WKWebViewConfiguration* configuration = [WKWebViewConfiguration new];
    [configuration.userContentController addScriptMessageHandler:(id <WKScriptMessageHandler>)self name:@"observer"];
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:_webView.frame configuration:configuration];
    [webView.configuration.preferences setValue:@TRUE forKey:@"allowFileAccessFromFileURLs"];

    webView.backgroundColor = [UIColor lightGrayColor];
    webView.translatesAutoresizingMaskIntoConstraints = NO;
    self.webView = webView;
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
   
   
    
    
    if([[LocalizeHelper readUserDefaults:@"server_error"] isEqual:@"true"]){
        
        [LocalizeHelper load_webview:self.webView name:@"hidden" type:@"local" port:[LocalizeHelper readUserDefaults:@"port_number"]];
        
    }
    else{
        [LocalizeHelper load_webview:self.webView name:@"hidden.html" type:@"server" port:[LocalizeHelper readUserDefaults:@"port_number"]];
        
    }
    
    
    
    
    self.webView.hidden=true;
    [self.view addSubview:webView];
    
    
    controler = [[MainViewController alloc] init];
    
    //controler.getvalue =@"show_lang_dilog";
    
   
       
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



#pragma mark - WKScriptMessageHandler

- (void)choose_lang_alert{
    
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Choose language : اختر لغة التطبيق"
                                          message:@""
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *ar= [UIAlertAction actionWithTitle:@"Arabic" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        NSLog(@"ar");
        
        NSString *script = @"save_Setting('lang','ar', 'all');";
        
        [self.webView evaluateJavaScript:script completionHandler:^(id _Nullable result, NSError * _Nullable error) {
            if (error) {
                NSLog(@"evaluateJavaScript error: %@", error.localizedDescription);
            } else {
                NSLog(@"evaluateJavaScript result: %@", result);
                
                [LocalizeHelper saveToUserDefaults:@"lang_choose" obj:@"done"];
                
                [LocalizeHelper saveToUserDefaults:@"lang" obj:@"ar"];
                
                dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 0.8);
                dispatch_after(delay, dispatch_get_main_queue(), ^(void){
                   
                   
                        
                        ViewController*vc = [[ViewController alloc] init];
                        //vc.showAlertEnabled= true;
                        [LocalizeHelper go_to_vc:vc];
                        //[LocalizeHelper go_to_vc:controler];
                    
                });
                
            }
        }];
        
        
        
    }];
    [alertController addAction:ar];
    
    
    UIAlertAction *en= [UIAlertAction actionWithTitle:@"English" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        NSLog(@"en");
        
      
        
        NSString *script = @"save_Setting('lang','en', 'all');";
        
        [self.webView evaluateJavaScript:script completionHandler:^(id _Nullable result, NSError * _Nullable error) {
            if (error) {
                NSLog(@"evaluateJavaScript error: %@", error.localizedDescription);
            } else {
                NSLog(@"evaluateJavaScript result: %@", result);
                
                [LocalizeHelper saveToUserDefaults:@"lang_choose" obj:@"done"];
                [LocalizeHelper saveToUserDefaults:@"lang" obj:@"en"];
                
                dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 0.8);
                dispatch_after(delay, dispatch_get_main_queue(), ^(void){
                   
                  
                    
                   
                        
                        
                        //[LocalizeHelper go_to_vc:controler];
                        
                        ViewController*vc = [[ViewController alloc] init];
                        //vc.showAlertEnabled= true;
                        [LocalizeHelper go_to_vc:vc];
                        
                  
                       
                     
                  
                    
                    
                });
                
                
            }
        }];
        
        
        
    }];
    
    [alertController addAction:en];
    
    
    [self presentViewController:alertController animated:YES completion:nil];
    
    
}




- (void)choose_mode_alert{
    
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:LocalizedString(@"mode_type_choose")
                                          message:@""
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *web_type= [UIAlertAction actionWithTitle:LocalizedString(@"mode_type_web") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
   
        
        
        NSString *script = @"save_Setting('mode_type','web', 'all');";
        
        [self.webView evaluateJavaScript:script completionHandler:^(id _Nullable result, NSError * _Nullable error) {
            if (error) {
                NSLog(@"evaluateJavaScript error: %@", error.localizedDescription);
            } else {
                NSLog(@"evaluateJavaScript result: %@", result);
                
               
                [LocalizeHelper saveToUserDefaults:@"mode_type" obj:@"web"];
                
                dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 0.5);
                dispatch_after(delay, dispatch_get_main_queue(), ^(void){
                    [LocalizeHelper go_to_vc:controler];
                });
                
                
            }
        }];
        
        
        
        
    }];
    [alertController addAction:web_type];
    
    
    UIAlertAction *native_type= [UIAlertAction actionWithTitle:LocalizedString(@"mode_type_native") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){

        
        
        NSString *script = @"save_Setting('mode_type','native', 'all');";
        
        [self.webView evaluateJavaScript:script completionHandler:^(id _Nullable result, NSError * _Nullable error) {
            if (error) {
                NSLog(@"evaluateJavaScript error: %@", error.localizedDescription);
            } else {
                NSLog(@"evaluateJavaScript result: %@", result);
                
               
                [LocalizeHelper saveToUserDefaults:@"mode_type" obj:@"native"];
                
                dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 0.5);
                dispatch_after(delay, dispatch_get_main_queue(), ^(void){
                    [LocalizeHelper go_to_vc:controler];
                });
                
                
            }
        }];
        
        
        
        
        
        
    }];
    
    [alertController addAction:native_type];
    
    
    [self presentViewController:alertController animated:YES completion:nil];
    
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
 
    
    
    
    if(![[LocalizeHelper readUserDefaults:@"lang_choose"] isEqual:@"done"]){
       
        [LocalizeHelper saveToUserDefaults:@"mode_type" obj:@"native"];
  
    }
    
    
    
    if(showAlertEnabled == true){
        
        [self choose_lang_alert];
        
    }
    else if(showAlertEnabled2 == true){
        
        [self choose_mode_alert];
        
    }
    //else if([[LocalizeHelper readUserDefaults:@"lang_choose"] isEqual:@"done"]){
    else{
        
        if([[LocalizeHelper readUserDefaults:@"lang"] isEqual:@"ar"]){
            LocalizationSetLanguage(@"ar");
        }
        
        if([[LocalizeHelper readUserDefaults:@"lang"] isEqual:@"en"]){
            LocalizationSetLanguage(@"en");
        }
        
        [LocalizeHelper go_to_vc:controler];
        
        NSLog(@"frfffffffffffff");
        
    }
    
}


- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    
}




@end
