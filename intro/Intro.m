//
//  ViewController.m

#import <EAIntroView/EAIntroView.h>
#import <SMPageControl/SMPageControl.h>

#import "Intro.h"

static NSString * const sampleDescription1 = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
static NSString * const sampleDescription2 = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.";
static NSString * const sampleDescription3 = @"Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.";
static NSString * const sampleDescription4 = @"Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit.";

@interface Intro () <EAIntroDelegate,UITextFieldDelegate> {
    UIView *rootView;
    EAIntroView *_intro;
    NSString *lang;
    ViewController *vc;
    
    NSString *bookmark;
    NSString *jsonString;
    UILabel *port_state;
    
    
}
@end

@implementation Intro

@synthesize show_sett;
@synthesize show_intro;

UITextField *mTextField;
NSDictionary *dict;
NSString *current_path;
UIButton *butt;
UILabel* server_active;
AppDelegate *appDelegate;
#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

   
    
    
    // using self.navigationController.view - to display EAIntroView above navigation bar
    rootView = self.view;
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
    if(show_sett){
        
        [self showIntroSett];
        
    }
    
    if(show_intro){
        
        [self showIntroWithCrossDissolve];
        
    }
    _islunch = false;
    _islunch2 = false;
    
    WKWebViewConfiguration* configuration = [WKWebViewConfiguration new];
    [configuration.userContentController addScriptMessageHandler:(id <WKScriptMessageHandler>)self name:@"observer"];
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:_webView.frame configuration:configuration];
    [webView.configuration.preferences setValue:@TRUE forKey:@"allowFileAccessFromFileURLs"];
  
    webView.backgroundColor = [UIColor lightGrayColor];
    webView.translatesAutoresizingMaskIntoConstraints = NO;
   
    self.webView = webView;
    [rootView addSubview:self.webView];
    
    
  
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidLoad];
  
    if([[LocalizeHelper readUserDefaults:@"lang"] isEqual:@"ar"]){
        
   
        LocalizationSetLanguage(@"ar");
            rootView.semanticContentAttribute= UISemanticContentAttributeForceRightToLeft;
        
        
        
    }

    dict = [[NSDictionary alloc] initWithObjectsAndKeys:
    [LocalizeHelper readUserDefaults:@"cell_tag_0"], @"cell_tag_0",
    [LocalizeHelper readUserDefaults:@"cell_tag_1"], @"cell_tag_1",
    [LocalizeHelper readUserDefaults:@"cell_tag_2"], @"cell_tag_2",
    [LocalizeHelper readUserDefaults:@"cell_tag_3"], @"cell_tag_3",
    [LocalizeHelper readUserDefaults:@"cell_tag_4"], @"cell_tag_4",
    [LocalizeHelper readUserDefaults:@"cell_tag_5"], @"cell_tag_5",
    [LocalizeHelper readUserDefaults:@"cell_tag_6"], @"cell_tag_6",
    [LocalizeHelper readUserDefaults:@"cell_tag_7"], @"cell_tag_7",
    [LocalizeHelper readUserDefaults:@"cell_tag_8"], @"cell_tag_8",
    [LocalizeHelper readUserDefaults:@"cell_tag_9"], @"cell_tag_9",
    [LocalizeHelper readUserDefaults:@"cell_tag_10"], @"cell_tag_10",
    [LocalizeHelper readUserDefaults:@"cell_tag_11"], @"cell_tag_11",
            nil];
    
    
    NSArray *array = [NSArray arrayWithObjects:dict, nil];

   // NSString *jsonString = [array JSONRepresentation];
    
    //NSArray *myArray;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:nil];
    jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    
    
    lang = [LocalizeHelper readUserDefaults:@"lang"];
    
  
   
    

  
    
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
    
    
    if([[LocalizeHelper readUserDefaults:@"server_error"] isEqual:@"true"]){
        
        [LocalizeHelper load_webview:self.webView name:@"hidden" type:@"local" port:[LocalizeHelper readUserDefaults:@"port_number"]];
        
    }
    else{
        [LocalizeHelper load_webview:self.webView name:@"hidden.html" type:@"server" port:[LocalizeHelper readUserDefaults:@"port_number"]];
        
    }
    
    
}


- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
}
#pragma mark - Demo

- (void)showIntroSett {
   
    if([[LocalizeHelper readUserDefaults:@"lang"] isEqual:@"ar"]){
        
   
        LocalizationSetLanguage(@"ar");
            rootView.semanticContentAttribute= UISemanticContentAttributeForceRightToLeft;
        
        
    }
    
    EAIntroPage *page1 = [EAIntroPage pageWithCustomViewFromNibNamed:@"IntroPage"];
    page1.bgImage = [UIImage imageNamed:@"bg2"];

    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:rootView.bounds andPages:@[page1]];
    [intro setDelegate:self];

    UISwitch *switchControl = (UISwitch *)[page1.pageView viewWithTag:1];
    
    port_state = (UILabel *)[page1.pageView viewWithTag:4];
    server_active = (UILabel *)[page1.pageView viewWithTag:5];
    
    UILabel* change_port = (UILabel *)[page1.pageView viewWithTag:6];
    
    change_port.text=LocalizedString(@"change_port");
    
    if(switchControl) {
        [switchControl addTarget:self action:@selector(switchFlip2:) forControlEvents:UIControlEventValueChanged];
    }
    
   
    port_state.hidden =true;
    butt = (UIButton *)[page1.pageView viewWithTag:2];
    
    mTextField = (UITextField *)[page1.pageView viewWithTag:3];
    
 
    
    [butt addTarget:self
             action:@selector(save_port)
   forControlEvents:UIControlEventTouchUpInside];
    
    [mTextField setKeyboardType:UIKeyboardTypeNumberPad];
   // [mTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents: UIControlEventEditingChanged];
    mTextField.delegate = self;
    
    switchControl.hidden=false;
    
    intro.semanticContentAttribute= UISemanticContentAttributeForceRightToLeft;
    intro.pageControl.hidden=true;
    intro.skipButton.hidden=true;
    
    
     mTextField.text = [LocalizeHelper readUserDefaults:@"port_number"];
        
    server_active.text =LocalizedString(@"");
    if([[LocalizeHelper readUserDefaults:@"server_error"] isEqual:@"true"]){
        
        mTextField.enabled =NO;
                [switchControl setOn:NO];
        
        port_state.hidden =false;
        server_active.text =LocalizedString(@"off_server_state");
        server_active.textColor = [UIColor redColor];
        
        [butt setTitle:LocalizedString(@"exit_port_butt") forState:UIControlStateNormal];
        
       
        
    }
    else{
       
        mTextField.enabled =YES;
                [switchControl setOn:YES];
        
        server_active.text =LocalizedString(@"on_server_state");
        server_active.textColor = [UIColor  blueColor];
        port_state.hidden =false;
        
        [butt setTitle:LocalizedString(@"save_port_butt") forState:UIControlStateNormal];
        
    }
    
    
    [intro showInView:rootView animateDuration:0.3];
    _intro = intro;
    [_intro setScrollingEnabled:NO];
    
    
    
    
}









- (void)showIntroWithCrossDissolve {
    
    if([[LocalizeHelper readUserDefaults:@"lang"] isEqual:@"ar"]){
        
   
        LocalizationSetLanguage(@"ar");
            rootView.semanticContentAttribute= UISemanticContentAttributeForceRightToLeft;
        
        
    }
    
    
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = LocalizedString(@"page1_title");
    page1.desc = LocalizedString(@"page1_desc");
    page1.bgImage = [UIImage imageNamed:@"bg1"];
    page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img/noon"]];
    page1.titleFont = [UIFont fontWithName:@"Georgia-BoldItalic" size:20];
    page1.descFont = [UIFont fontWithName:@"Arial" size:15];
    
    
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = LocalizedString(@"features_title");
    page2.desc = LocalizedString(@"features_desc");
    page2.bgImage = [UIImage imageNamed:@"bg2"];
    
    UIImage * image = [UIImage imageNamed:@"img/app"];
        CGSize sacleSize = CGSizeMake(150, 250);
        UIGraphicsBeginImageContextWithOptions(sacleSize, NO, 0.0);
        [image drawInRect:CGRectMake(0, 0, sacleSize.width, sacleSize.height)];
        UIImage * resizedImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    
    
    page2.titleIconView = [[UIImageView alloc] initWithImage:resizedImage];
    
    page2.titleIconView.contentMode = UIViewContentModeScaleAspectFill;
    page2.titleIconView.clipsToBounds = YES;
  
    
    page2.titleFont = [UIFont fontWithName:@"Georgia-BoldItalic" size:20];
    page2.descFont = [UIFont fontWithName:@"Arial" size:15];

    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = LocalizedString(@"function_title");
    page3.desc = LocalizedString(@"function_desc");
    page3.bgImage = [UIImage imageNamed:@"bg3"];
    page3.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img/fun"]];
    
    page3.titleFont = [UIFont fontWithName:@"Georgia-BoldItalic" size:20];
    page3.descFont = [UIFont fontWithName:@"Arial" size:15];
    

    EAIntroPage *page4 = [EAIntroPage page];
    page4.title = @"This is page 4";
    page4.desc = sampleDescription4;
    page4.bgImage = [UIImage imageNamed:@"bg4"];
    page4.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title4"]];

    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:rootView.bounds andPages:@[page1,page2,page3]];
    intro.skipButtonAlignment = EAViewAlignmentCenter;
    intro.skipButtonY = 70.f;
    intro.pageControlY = 42.f;
    [intro.skipButton setTitle:LocalizedString(@"skip_butt") forState:UIControlStateNormal];

    [intro setDelegate:self];

    [intro showInView:rootView animateDuration:0.3];
}

- (void)showIntroWithFixedTitleView {
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello world";
    page1.desc = sampleDescription1;

    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"This is page 2";
    page2.desc = sampleDescription2;

    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"This is page 3";
    page3.desc = sampleDescription3;

    EAIntroPage *page4 = [EAIntroPage page];
    page4.title = @"This is page 4";
    page4.desc = sampleDescription4;

    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:rootView.bounds andPages:@[page1,page2,page3,page4]];
    [intro setDelegate:self];
    UIImageView *titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title1"]];
    intro.titleView = titleView;
    intro.titleViewY = 90;
    intro.backgroundColor = [UIColor colorWithRed:0.f green:0.49f blue:0.96f alpha:1.f]; //iOS7 dark blue

    [intro showInView:rootView animateDuration:0.3];
}

- (void)showIntroWithCustomPages {
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello world";
    page1.desc = sampleDescription1;
    page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title1"]];

    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"This is page 2";
    page2.titlePositionY = self.view.bounds.size.height/2 - 10;
    page2.desc = sampleDescription2;
    page2.descPositionY = self.view.bounds.size.height/2 - 50;
    page2.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title2"]];
    page2.titleIconPositionY = 70;

    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"This is page 3";
    page3.titleFont = [UIFont fontWithName:@"Georgia-BoldItalic" size:20];
    page3.titlePositionY = 220;
    page3.desc = sampleDescription2;
    page3.descFont = [UIFont fontWithName:@"Georgia-Italic" size:18];
    page3.descPositionY = 200;
    page3.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title3"]];
    page3.titleIconPositionY = 100;

    EAIntroPage *page4 = [EAIntroPage page];
    page4.title = @"This is page 4";
    page4.desc = sampleDescription4;
    page4.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title4"]];

    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:rootView.bounds andPages:@[page1,page2,page3,page4]];
    intro.bgImage = [UIImage imageNamed:@"bg2"];

    intro.pageControlY = 250.f;

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(0, 0, 230, 40)];
    [btn setTitle:@"SKIP NOW" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.layer.borderWidth = 2.f;
    btn.layer.cornerRadius = 10;
    btn.layer.borderColor = [[UIColor whiteColor] CGColor];
    intro.skipButton = btn;
    intro.skipButtonY = 60.f;
    intro.skipButtonAlignment = EAViewAlignmentCenter;

    [intro setDelegate:self];
    [intro showInView:rootView animateDuration:0.3];
}

- (void)showIntroWithCustomView {
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello world";
    page1.desc = sampleDescription1;
    page1.bgImage = [UIImage imageNamed:@"bg1"];
    page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title1"]];

    UIView *viewForPage2 = [[UIView alloc] initWithFrame:rootView.bounds];
    UILabel *labelForPage2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, rootView.bounds.size.width, 30)];
    labelForPage2.text = @"Some custom view";
    labelForPage2.font = [UIFont systemFontOfSize:32];
    labelForPage2.textColor = [UIColor whiteColor];
    labelForPage2.backgroundColor = [UIColor clearColor];
    labelForPage2.transform = CGAffineTransformMakeRotation(M_PI_2*3);
    [viewForPage2 addSubview:labelForPage2];
    EAIntroPage *page2 = [EAIntroPage pageWithCustomView:viewForPage2];
    page2.bgImage = [UIImage imageNamed:@"bg2"];

    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"This is page 3";
    page3.desc = sampleDescription3;
    page3.bgImage = [UIImage imageNamed:@"bg3"];
    page3.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title3"]];

    EAIntroPage *page4 = [EAIntroPage page];
    page4.title = @"This is page 4";
    page4.desc = sampleDescription4;
    page4.bgImage = [UIImage imageNamed:@"bg4"];
    page4.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title4"]];

    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:rootView.bounds andPages:@[page1,page2,page3,page4]];
    [intro.skipButton setTitle:@"Skip now" forState:UIControlStateNormal];
    [intro setDelegate:self];
    intro.tapToNext = YES;

    [intro showInView:rootView animateDuration:0.3];
}

- (void)showIntroWithCustomViewFromNib {
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello world";
    page1.desc = sampleDescription1;
    page1.bgImage = [UIImage imageNamed:@"bg1"];
    page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title1"]];

    EAIntroPage *page2 = [EAIntroPage pageWithCustomViewFromNibNamed:@"IntroPage"];
    page2.bgImage = [UIImage imageNamed:@"bg2"];

    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"This is page 3";
    page3.desc = sampleDescription3;
    page3.bgImage = [UIImage imageNamed:@"bg3"];
    page3.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title3"]];

    EAIntroPage *page4 = [EAIntroPage page];
    page4.title = @"This is page 4";
    page4.desc = sampleDescription4;
    page4.bgImage = [UIImage imageNamed:@"bg4"];
    page4.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title4"]];

    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:rootView.bounds andPages:@[page1,page2,page3,page4]];
    [intro setDelegate:self];

    UISwitch *switchControl = (UISwitch *)[page2.pageView viewWithTag:1];
    if(switchControl) {
        [switchControl addTarget:self action:@selector(switchFlip:) forControlEvents:UIControlEventValueChanged];
    }

    [intro showInView:rootView animateDuration:0.3];
    _intro = intro;
}

- (void)showIntroWithSeparatePagesInitAndPageCallback {
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello world";
    page1.desc = sampleDescription1;
    page1.bgImage = [UIImage imageNamed:@"bg1"];
    page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title1"]];

    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"This is page 2";
    page2.desc = sampleDescription2;
    page2.bgImage = [UIImage imageNamed:@"bg2"];
    page2.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title2"]];
    page2.onPageDidAppear = ^{
        NSLog(@"Page 2 did appear block");
    };

    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"This is page 3";
    page3.desc = sampleDescription3;
    page3.bgImage = [UIImage imageNamed:@"bg3"];
    page3.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title3"]];

    EAIntroPage *page4 = [EAIntroPage page];
    page4.title = @"This is page 4";
    page4.desc = sampleDescription4;
    page4.bgImage = [UIImage imageNamed:@"bg4"];
    page4.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title4"]];

    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:rootView.bounds];
    [intro setDelegate:self];

    // show skipButton only on 3rd page + animation
    intro.skipButton.alpha = 0.f;
    intro.skipButton.enabled = NO;
    page3.onPageDidAppear = ^{
        intro.skipButton.enabled = YES;
        [UIView animateWithDuration:0.3f animations:^{
            intro.skipButton.alpha = 1.f;
        }];
    };
    page3.onPageDidDisappear = ^{
        intro.skipButton.enabled = NO;
        [UIView animateWithDuration:0.3f animations:^{
            intro.skipButton.alpha = 0.f;
        }];
    };

    [intro setPages:@[page1,page2,page3,page4]];

    [intro showInView:rootView animateDuration:0.3];
}

- (void)showCustomIntro {
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello world";
    page1.titlePositionY = 240;

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    paragraphStyle.lineSpacing = 7;
    NSDictionary *attrsDictionary = @{ NSParagraphStyleAttributeName: paragraphStyle,
                                       NSFontAttributeName: [UIFont systemFontOfSize:14],
                                       NSForegroundColorAttributeName: UIColor.whiteColor };
    NSMutableAttributedString *mutableAttrString = [[NSMutableAttributedString alloc] initWithString:sampleDescription1 attributes:attrsDictionary];
    [mutableAttrString addAttribute:NSForegroundColorAttributeName value:[UIColor systemRedColor] range:NSMakeRange(0, 11)];
    page1.attributedDesc = [mutableAttrString copy];

    page1.descPositionY = 220;
    page1.bgImage = [UIImage imageNamed:@"bg1"];
    page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title1"]];
    page1.titleIconPositionY = 100;
    page1.showTitleView = NO;

    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"This is page 2";
    page2.titlePositionY = 240;
    page2.desc = sampleDescription2;
    page2.descPositionY = 220;
    page2.bgImage = [UIImage imageNamed:@"bg2"];
    page2.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon1"]];
    page2.titleIconPositionY = 260;

    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"This is page 3";
    page3.titlePositionY = 240;
    page3.desc = sampleDescription3;
    page3.descPositionY = 220;
    page3.bgImage = [UIImage imageNamed:@"bg3"];
    page3.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon2"]];
    page3.titleIconPositionY = 260;

    EAIntroPage *page4 = [EAIntroPage page];
    page4.title = @"This is page 4";
    page4.titlePositionY = 240;
    page4.desc = sampleDescription4;
    page4.descPositionY = 220;
    page4.bgImage = [UIImage imageNamed:@"bg4"];
    page4.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon3"]];
    page4.titleIconPositionY = 260;

    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:rootView.bounds andPages:@[page1,page2,page3,page4]];
    intro.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bigLogo"]];
    intro.titleViewY = 120;
    intro.tapToNext = YES;
    [intro setDelegate:self];

    SMPageControl *pageControl = [[SMPageControl alloc] init];
    pageControl.pageIndicatorImage = [UIImage imageNamed:@"pageDot"];
    pageControl.currentPageIndicatorImage = [UIImage imageNamed:@"selectedPageDot"];
    [pageControl sizeToFit];

    // This is a hack - not recommended for Swift, more information: https://github.com/ealeksandrov/EAIntroView/issues/161
    intro.pageControl = (UIPageControl *)pageControl;
    intro.pageControlY = 130.f;

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"skipButton"] forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(0, 0, 270, 50)];
    intro.skipButton = btn;
    intro.skipButtonY = 80.f;
    intro.skipButtonAlignment = EAViewAlignmentCenter;

    [intro showInView:rootView animateDuration:0.3];
}

#pragma mark - EAIntroView delegate

- (void)introDidFinish:(EAIntroView *)introView wasSkipped:(BOOL)wasSkipped {
    if(wasSkipped) {
        NSLog(@"Intro skipped");
    } else {
        NSLog(@"Intro finished");
        
       // [self showIntroSett];
        
    }
    
    [LocalizeHelper saveToUserDefaults:@"show_intro" obj:@"done"];
    
    ViewController*vc = [[ViewController alloc] init];
    //vc.showAlertEnabled= true;
    [LocalizeHelper go_to_vc:vc];

    
}

#pragma mark - Custom actions

- (IBAction)switchFlip:(id)sender {
    UISwitch *switchControl = (UISwitch *) sender;
    NSLog(@"%@", switchControl.on ? @"On" : @"Off");

    // limit scrolling on one, currently visible page (can't go previous or next page)
    //[_intro setScrollingEnabled:switchControl.on];

    if(!switchControl.on) {
        // scroll no further selected page (can go previous pages, but not next)
        _intro.limitPageIndex = _intro.visiblePageIndex;
    } else {
        [_intro setScrollingEnabled:YES];
    }
}

- (IBAction)switchFlip2:(id)sender {
    UISwitch *switchControl = (UISwitch *) sender;
    NSLog(@"%@", switchControl.on ? @"On" : @"Off");

    // limit scrolling on one, currently visible page (can't go previous or next page)
    //[_intro setScrollingEnabled:switchControl.on];

    if ([mTextField.text isEqualToString:@""]) {
        mTextField.text= [LocalizeHelper readUserDefaults:@"port_number"];
 
    }

    [appDelegate stopServer];
    
    if(!switchControl.on) {
     
        [LocalizeHelper saveToUserDefaults:@"server_error" obj:@"true"];
        
        server_active.text =LocalizedString(@"off_server_state");
        server_active.textColor = [UIColor redColor];
        mTextField.enabled =false;
        
        [butt setTitle:LocalizedString(@"exit_port_butt") forState:UIControlStateNormal];
        
        port_state.text =LocalizedString(@"");
        
        //_intro.limitPageIndex = _intro.visiblePageIndex;
    } else {
        //[_intro setScrollingEnabled:YES];
        
        [LocalizeHelper saveToUserDefaults:@"server_error" obj:@"false"];
        
        server_active.text =LocalizedString(@"on_server_state");
        server_active.textColor = [UIColor  blueColor];
        
        mTextField.enabled =true;
        
        
        [butt setTitle:LocalizedString(@"save_port_butt") forState:UIControlStateNormal];
        
        _islunch2 =true;
        [self save_port];
        
    }
}

#pragma mark - UITableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        // all settings are basic, pages with custom packgrounds, title image on each page
        [self showIntroWithCrossDissolve];
    } else if (indexPath.row == 1) {
        // all settings are basic, introview with colored background, fixed title image
        [self showIntroWithFixedTitleView];
    } else if (indexPath.row == 2) {
        // basic pages with custom settings
        [self showIntroWithCustomPages];
    } else if (indexPath.row == 3) {
        // using page with custom view
        [self showIntroWithCustomView];
    } else if (indexPath.row == 4) {
        // using page with custom view from nib
        [self showIntroWithCustomViewFromNib];
    } else if (indexPath.row == 5) {
        // pages separate init and using block callback in one of pages
        [self showIntroWithSeparatePagesInitAndPageCallback];
    } else if (indexPath.row == 6) {
        // show custom intro
        [self showCustomIntro];
    }

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string  {

    
    port_state.text =LocalizedString(@"");
    
    /* for backspace */
        if([string length]==0){
           return YES;
        }

    /*  limit to only numeric characters  */

        NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
        for (int i = 0; i < [string length]; i++) {
           unichar c = [string characterAtIndex:i];
           if ([myCharSet characterIsMember:c]) {
              
               if(range.length + range.location > textField.text.length)
                  {
                      return NO;
                  }
                      
                  NSUInteger newLength = [textField.text length] + [string length] - range.length;
                  return newLength <= 4;
               return YES;
          }
        }

    
   
    
    
    
    
    
    
    return NO;

}

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
     [WKWebViewPanelManager presentAlertOnController:self title:@"Alert" message:message handler:completionHandler];
 }
 - (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler {
     [WKWebViewPanelManager presentConfirmOnController:self title:@"Confirm" message:message handler:completionHandler];
 }
 - (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * __nullable result))completionHandler {
     [WKWebViewPanelManager presentPromptOnController:self title:@"Prompt" message:prompt defaultText:defaultText handler:completionHandler];
 }


- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
    //NSLog(@"cccccccc");
    if (_islunch ==true){
         
      //  NSString *script = @"save_Setting('lang','%@', 'all');";
        

        NSString *script  = [NSString stringWithFormat:@"save_all_data(%@,'%@','%@','%@','%@');", jsonString,self->bookmark,[LocalizeHelper readUserDefaults:@"mode_type"],[LocalizeHelper readUserDefaults:@"lang"],current_path];
        
      
        
       // NSLog(@"xxxxxxxxxxxx5");
        
        NSLog(@"aaaaaaaaaaa %@",[LocalizeHelper readUserDefaults:@"lang"]);
        [self.webView evaluateJavaScript:script completionHandler:^(id _Nullable result, NSError * _Nullable error) {
           
            if (error) {
                NSLog(@"evaluateJavaScript error: %@", error.localizedDescription);
                
                self->port_state.text =LocalizedString(@"port_in_use");
                self->port_state.textColor = [UIColor redColor];
            } else {
                NSLog(@"evaluateJavaScript result: %@", result);
                
                if(result){
                   
                    [LocalizeHelper saveToUserDefaults:@"port_number" obj:mTextField.text];
                    self->port_state.text =LocalizedString(@"port_not_use");
                    self->port_state.textColor = [UIColor blueColor];
                    self->port_state.hidden =false;
                    
                    
                    
                    if(_islunch2 == false){
                        [butt setTitle:LocalizedString(@"now_is_closing") forState:UIControlStateNormal];
                        self->vc = [[ViewController alloc] init];
                       
                        dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 1);
                        dispatch_after(delay, dispatch_get_main_queue(), ^(void){
                        [LocalizeHelper go_to_vc:self->vc];
                        });
                    }
                    
                    
                    
                    _islunch2 = false;
                }
                else{
                    
                    self->port_state.text =LocalizedString(@"port_in_use");
                    self->port_state.textColor = [UIColor redColor];
                }
                
            }
            
        }];
        
        
        _islunch =false;
    }
    else{
       
        
        
        
        [self.webView evaluateJavaScript:@"read_Setting('currPATH', 'index.html', 'all')" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
           
            if (error) {
                NSLog(@"evaluateJavaScript error: %@", error.localizedDescription);
            } else {
                NSLog(@"evaluateJavaScript result: %@", result);
                
                current_path = result;
            }
            
        }];
        
        [self.webView evaluateJavaScript:@"read_Setting('bookmarks', null, 'all')" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
           
            if (error) {
                NSLog(@"evaluateJavaScript error: %@", error.localizedDescription);
            } else {
                NSLog(@"evaluateJavaScript result: %@", result);
                
                self->bookmark = result;
            }
            
        }];
    }
    
    [self.webView evaluateJavaScript:@"window.scrollBy(1, 1);window.scrollBy(-1, -1);" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
       
    }];
    
}

- (void) save_port {
  
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
    
    if ([mTextField.text isEqualToString:@""]) {
        mTextField.text= [LocalizeHelper readUserDefaults:@"port_number"];
 
    }

        
    //AppDelegate *dela = [[AppDelegate alloc] init];
    
  
    [appDelegate stopServer];
    //[appDelegate startServer];
    
    if([[LocalizeHelper readUserDefaults:@"server_error"] isEqual:@"false"]){
        
        //if(mTextField.text != [LocalizeHelper readUserDefaults:@"port_number"]){
  // if (![mTextField.text isEqualToString:[LocalizeHelper readUserDefaults:@"port_number"]])
       // {
    
    if([appDelegate checkServer:mTextField.text]==false){
        
        port_state.hidden =false;
        port_state.text =LocalizedString(@"port_in_use");
        port_state.textColor = [UIColor redColor];
        
        //[appDelegate stopServer];
        
    }
    else{
        //[LocalizeHelper saveToUserDefaults:@"port_number" obj:mTextField.text];
     
       // [appDelegate startServer];
        _islunch =true;
        
      
        
    }
    }
    else{
       
        port_state.text =LocalizedString(@"");
        _islunch =false;
        
        [butt setTitle:LocalizedString(@"now_is_closing") forState:UIControlStateNormal];
        
        self->vc = [[ViewController alloc] init];
       
        dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 1);
        dispatch_after(delay, dispatch_get_main_queue(), ^(void){
        [LocalizeHelper go_to_vc:self->vc];
        });
        
        
    }
  
   
    
    
    
    
  
    
   
    if(self->_islunch==true){
    dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 0);
    dispatch_after(delay, dispatch_get_main_queue(), ^(void){
            
          

       
        if([[LocalizeHelper readUserDefaults:@"server_error"] isEqual:@"true"]){
            
            [LocalizeHelper load_webview:self.webView name:@"hidden" type:@"local" port:mTextField.text];
            
        }
        else{
            [LocalizeHelper load_webview:self.webView name:@"hidden.html" type:@"server" port:mTextField.text];
            
        }
        
              
                
           
           
        
        

        
    
    });
        
    }
    
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


-(BOOL)shouldAutorotate
{
return NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
return NO;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
return UIInterfaceOrientationPortrait;
}

@end
