//
//  MainViewController.m
//  WKWebViewLocalAssetsObjC
//
//  Created by Sergey Vasilevkin on 09/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()


@property (nonatomic, assign) WKWebView *webView;
@property (nonatomic, assign) WKWebView *webView2;
@property (nonatomic, assign) UIButton *loadHtmlAsFileButton;
@property (nonatomic, assign) UIButton *loadHtmlAsStringButton;
@property (nonatomic, assign) UIButton *zoomButton;
@property (nonatomic, assign) UIButton *runJavaScriptButton;
@property (nonatomic, assign) BOOL zoomEnabled;
@property (weak, nonatomic) IBOutlet UITextField *urlTextView;
@property (nonatomic, assign) NSUserDefaults *defaults;
@end

ViewController *vc;
UIStackView *headerStackView;
UIStackView *mainStackView;
UIStackView *footerStackView;
bool isGrantedNotificationAccess;
bool isfullwhenlunch;
bool isLandwhenlunch;
bool isPrintlunch;
float stat_bar;

WKProcessPool *pro;
UITextField *searchTextField ;
UITextField *favTextField ;


UIImage *favimage;

UIImage *menu;
UIButton *menuButton;



UIButton *spacerButton;
UIButton *searchButton;
UIButton *favButton;

UIImage *up;
UIImage *down;
UIImage *left;
UIImage *right;

UIButton *upButton;
UIButton *downButton;
UIButton *leftButton;
UIButton *rightButton;

UIImage *closeImage;
UIButton *closeButton;

UIImage *noonImage;
UIButton *noonButton;

UISearchBar *searchBar;
UISearchBar *favBar;


UIImage *homeImage;
UIButton *homeButton_footer;

UIImage *favImage;
UIButton *favButton_footer;

UIImage *searchImage;
UIButton *searchButton_footer;

UIImage *hideImage;
UIButton *hideButton_footer;

UIButton *prvsearchButton;
UIButton *prvfavButton;


DropDownMenu *sb;

bool statusBarHidden = false;

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    pro = [[WKProcessPool alloc] init];
    
    if([[LocalizeHelper readUserDefaults:@"lang"] isEqual:@"ar"]){
        
   
        LocalizationSetLanguage(@"ar");
    }
    
    isPrintlunch =false;
    
    [self configureUI];
    [self addActions];
    
    // Refresh main view
    [self.view layoutIfNeeded];
    
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
    //[self.webView.configuration.userContentController addScriptMessageHandler:self name:@"observer"];
   
    
    self.webView2.navigationDelegate = self;
    self.webView2.UIDelegate = self;
    //[self.webView2.configuration.userContentController addScriptMessageHandler:self name:@"observer"];
    
    
   
    
    
    self.zoomEnabled = YES;
    [self loadWebViewContent];
    
    
    _urlTextView.delegate = self;
    
    
    _defaults = [NSUserDefaults standardUserDefaults];
   
    
    /*UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];*/
    
    
    isGrantedNotificationAccess = false;
   
   
     
        
        
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;

       if(orientation == UIDeviceOrientationLandscapeRight)
       {
            
           isLandwhenlunch =true;
       }
        if(orientation == UIDeviceOrientationLandscapeLeft)
        {
             
            isLandwhenlunch =true;
        }
    
    NSString *cell_tag_2 = [[NSUserDefaults standardUserDefaults]
        stringForKey:@"cell_tag_2"];
    
      if( [cell_tag_2 isEqual:@"on"]){
    
          isfullwhenlunch = true;
          //[self hide_state_bar];
      }
      else{
         // [self show_state_bar];
      }
    
    
    
    
    UITapGestureRecognizer *singleFingerTap =
      [[UITapGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(handleSingleTap:)];
    [spacerButton addGestureRecognizer:singleFingerTap];
    
    
      
    
    
  stat_bar =  [self statusBarHeight];
    
       

     
}

- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"viewDidAppear loaded successfully");
   
    
    /*dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 5);
    dispatch_after(delay, dispatch_get_main_queue(), ^(void){
        Intro *intro = [[Intro alloc] init];
        [intro showIntroWithCrossDissolve];
        intro.show_sett= true;
        [LocalizeHelper go_to_vc:intro];
    });*/
    
    if([[LocalizeHelper readUserDefaults:@"lang"] isEqual:@"ar"]){
        
       
        self.view.transform = CGAffineTransformMakeScale(-1.0, 1.0);
        self.webView.transform = CGAffineTransformMakeScale(-1.0, 1.0);
        searchBar.transform = CGAffineTransformMakeScale(-1.0, 1.0);
        favBar.transform = CGAffineTransformMakeScale(-1.0, 1.0);
        searchButton.transform = CGAffineTransformMakeScale(-1.0, 1.0);
        favButton.transform = CGAffineTransformMakeScale(-1.0, 1.0);
        noonButton.transform = CGAffineTransformMakeScale(-1.0, 1.0);
        
    }

    
    NSString *cell_tag_1 = [[NSUserDefaults standardUserDefaults]
        stringForKey:@"cell_tag_1"];
    
    if( [cell_tag_1 isEqual:@"on"]){
    
        [self set_night_mode];

    }
    
    
}



#pragma mark - Private

- (void)configureUI {
    
    // UI constants
    CGFloat const kSizeMainStackViewOffset = 8;
    CGFloat const kButtonHeight = 50;
    CGFloat const kStackViewSpacing = 8;
    CGFloat const kFontSizeButtonText = 15;
    
    NSString * const kTitleLoadHtmlAsFileButton = @"Load html as File";
    UIColor * const kColorLoadHtmlAsFileButton = [UIColor colorWithRed:4/255.0 green:51/255.0 blue:255/255.0 alpha:1.0];
    UIColor * const kColorLoadHtmlAsFileButtonText = [UIColor whiteColor];
    
    NSString * const kTitleLoadHtmlAsStringButton = @"Load html as String";
    UIColor * const kColorLoadHtmlAsStringButton = [UIColor colorWithRed:148/255.0 green:33/255.0 blue:146/255.0 alpha:1.0];
    UIColor * const kColorLoadHtmlAsStringButtonText = [UIColor whiteColor];
    
    NSString * const kTitleZoomButton = @"Zoom ON";
    UIColor * const kColorZoomButton = [UIColor colorWithRed:0 green:249/255.0 blue:0 alpha:1.0];
    UIColor * const kColorZoomButtonText = [UIColor darkGrayColor];
    
    NSString * const kTitleRunJavaScriptButton = @"Run JavaScript";
    UIColor * const kColorRunJavaScriptButton = [UIColor colorWithRed:0 green:249/255.0 blue:0 alpha:1.0];
    UIColor * const kColorRunJavaScriptButtonText = [UIColor whiteColor];
    

    
    headerStackView = [[UIStackView alloc] init];
    headerStackView.axis = UILayoutConstraintAxisHorizontal;
    //headerStackView.alignment = UIStackViewAlignmentFill;
    headerStackView.distribution =UIStackViewDistributionFill;
    //headerStackView.spacing = kStackViewSpacing;
    //headerStackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    spacerButton = [[UIButton alloc] init];
        [spacerButton setContentHuggingPriority:UILayoutPriorityFittingSizeLevel forAxis:UILayoutConstraintAxisHorizontal];
        [spacerButton setContentCompressionResistancePriority:UILayoutPriorityFittingSizeLevel forAxis:UILayoutConstraintAxisHorizontal];
    
    closeImage = [UIImage imageNamed:@"img/close.png"];
    closeButton= [[UIButton alloc] init];
    [closeButton setImage:[closeImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [closeButton setTintColor:[UIColor blackColor]];
    
    [closeButton.heightAnchor constraintEqualToConstant:30].active = true;
    [closeButton.widthAnchor constraintEqualToConstant:45].active = true;
    closeButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [closeButton addTarget:self
           action:@selector(do_close)forControlEvents:UIControlEventTouchDown];
    
    
    noonImage = [UIImage imageNamed:@"img/noon.png"];
    noonButton= [[UIButton alloc] init];
    [noonButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [noonButton setImage:noonImage forState:UIControlStateNormal];
    [noonButton.heightAnchor constraintEqualToConstant:30].active = true;
    [noonButton.widthAnchor constraintEqualToConstant:45].active = true;
    noonButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [noonButton addTarget:self
           action:@selector(do_home)forControlEvents:UIControlEventTouchDown];
    
    left = [UIImage imageNamed:@"img/left.png"];
    leftButton =[[UIButton alloc] init];
    [leftButton setImage:[left imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [leftButton setTintColor:[UIColor blackColor]];
    
    [leftButton.heightAnchor constraintEqualToConstant:30].active = true;
    [leftButton.widthAnchor constraintEqualToConstant:45].active = true;
    leftButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    
        [leftButton addTarget:self
               action:@selector(go_prev)forControlEvents:UIControlEventTouchDown];
        
    
    
    right = [UIImage imageNamed:@"img/right.png"];
    rightButton = [[UIButton alloc] init];
    [rightButton setImage:[right imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [rightButton setTintColor:[UIColor blackColor]];
    
    [rightButton.heightAnchor constraintEqualToConstant:30].active = true;
    [rightButton.widthAnchor constraintEqualToConstant:45].active = true;
    rightButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    
        [rightButton addTarget:self
               action:@selector(go_next)forControlEvents:UIControlEventTouchDown];
 
    
    
    up = [UIImage imageNamed:@"img/up.png"];
    upButton = [[UIButton alloc] init];

    
    [upButton setImage:[up imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [upButton setTintColor:[UIColor blackColor]];
    
    upButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [upButton.heightAnchor constraintEqualToConstant:30].active = true;
    [upButton.widthAnchor constraintEqualToConstant:45].active = true;
    upButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [upButton addTarget:self
           action:@selector(go_up)forControlEvents:UIControlEventTouchDown];
    
    down = [UIImage imageNamed:@"img/down.png"];
    downButton= [[UIButton alloc] init];
  
    [downButton setImage:[down imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [downButton setTintColor:[UIColor blackColor]];
    
    [downButton.heightAnchor constraintEqualToConstant:30].active = true;
    [downButton.widthAnchor constraintEqualToConstant:35].active = true;
    downButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [downButton addTarget:self
           action:@selector(go_down)forControlEvents:UIControlEventTouchDown];
    
    favButton= [[UIButton alloc] init];
    [favButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [favButton setTitle:LocalizedString(@"fav_butt") forState:UIControlStateNormal];
    [favButton.heightAnchor constraintEqualToConstant:30].active = true;
    [favButton.widthAnchor constraintEqualToConstant:60].active = true;
    favButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [favButton addTarget:self
           action:@selector(do_fav)forControlEvents:UIControlEventTouchDown];
    
    
    searchButton = [[UIButton alloc] init];
    [searchButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [searchButton setTitle:LocalizedString(@"search_butt") forState:UIControlStateNormal];
    [searchButton.heightAnchor constraintEqualToConstant:30].active = true;
    [searchButton.widthAnchor constraintEqualToConstant:60].active = true;
    searchButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [searchButton addTarget:self
           action:@selector(do_search)forControlEvents:UIControlEventTouchDown];
    

    
    favBar= [[UISearchBar alloc] init];
    favimage = [UIImage imageNamed:@"img/fav.png"];
    favimage = [UIImage imageWithCGImage:[favimage CGImage] scale:25 orientation:UIImageOrientationUp];
    
    [favBar setImage:favimage forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    
    [favBar setBackgroundImage:[UIImage new]];
    favBar.placeholder = LocalizedString(@"fav_placholder");
    favBar.delegate = self;
    favBar.tag = 5;
    
    
    searchBar = [[UISearchBar alloc] init];
    [searchBar setBackgroundImage:[UIImage new]];
    searchBar.delegate = self;
    searchBar.placeholder = LocalizedString(@"search_placholder");
   
    searchBar.tag= 6;

    
    menu = [UIImage imageNamed:@"img/menu.png"];
    menuButton = [[UIButton alloc] init];
  
    [menuButton setImage:[menu imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [menuButton setTintColor:[UIColor  blackColor]];
    
    [menuButton.heightAnchor constraintEqualToConstant:30].active = true;
    [menuButton.widthAnchor constraintEqualToConstant:45].active = true;
    menuButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [menuButton addTarget:self action:@selector(toggle_drop_menu) forControlEvents:UIControlEventTouchUpInside];
    menuButton.tag= 55;
    
    
    if([[LocalizeHelper readUserDefaults:@"lang"] isEqual:@"ar"]){
        searchBar.semanticContentAttribute= UISemanticContentAttributeForceRightToLeft;
        favBar.semanticContentAttribute= UISemanticContentAttributeForceRightToLeft;
        
        
        if (@available(iOS 13, *)) {
         
            searchBar.searchTextField.textAlignment=NSTextAlignmentRight;
            favBar.searchTextField.textAlignment=NSTextAlignmentRight;
            
            searchBar.searchTextField.font=[UIFont systemFontOfSize:20];
            favBar.searchTextField.font=[UIFont systemFontOfSize:20];
            
        } else {
           
            searchTextField = [searchBar valueForKey:@"_searchField"];
            
            //searchTextField.layer.cornerRadius = 10.0f;
            searchTextField.textAlignment = NSTextAlignmentRight;
            
            favTextField = [favBar valueForKey:@"_searchField"];
            
            //favTextField.layer.cornerRadius = 10.0f;
            favTextField.textAlignment = NSTextAlignmentRight;
            
            searchTextField.font = [UIFont systemFontOfSize:20];
            favTextField.font = [UIFont systemFontOfSize:20];
            
           
            
        }
        
    }
    
    if([[LocalizeHelper readUserDefaults:@"lang"] isEqual:@"en"]){
     
        searchBar.semanticContentAttribute=UISemanticContentAttributeForceLeftToRight;
        
        favBar.semanticContentAttribute=UISemanticContentAttributeForceLeftToRight;
       
        
        if (@available(iOS 13, *)) {
         
            
            favBar.searchTextField.font=[UIFont systemFontOfSize:20];
            searchBar.searchTextField.font=[UIFont systemFontOfSize:20];

        } else {
           
        
            
            searchTextField.font = [UIFont systemFontOfSize:20];
            favTextField.font = [UIFont systemFontOfSize:20];
            
        }
        
    }
    
    [headerStackView addArrangedSubview:menuButton];
    [headerStackView addArrangedSubview:favButton];
    [headerStackView addArrangedSubview:searchButton];
    [headerStackView addArrangedSubview:favBar];
    [headerStackView addArrangedSubview:searchBar];
   // if([[LocalizeHelper readUserDefaults:@"lang"] isEqual:@"ar"]){
    
     [headerStackView addArrangedSubview:leftButton];
     [headerStackView addArrangedSubview:rightButton];
   
    //}
    
   
    [headerStackView addArrangedSubview:downButton];
    [headerStackView addArrangedSubview:upButton];
    [headerStackView addArrangedSubview:spacerButton];
    [headerStackView addArrangedSubview:noonButton];
    [headerStackView addArrangedSubview:closeButton];
    
    // Main Stack View
    mainStackView = [[UIStackView alloc] init];
    mainStackView.axis = UILayoutConstraintAxisVertical;
    mainStackView.alignment = UIStackViewAlignmentFill;
    mainStackView.distribution = UIStackViewDistributionFill;
    mainStackView.spacing = kStackViewSpacing;
    mainStackView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:mainStackView];
    // Layout for Main Stack View
    UILayoutGuide *guide = self.view.safeAreaLayoutGuide;
    [mainStackView.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor constant:kSizeMainStackViewOffset].active = YES;
    [mainStackView.topAnchor constraintEqualToAnchor:guide.topAnchor constant:kSizeMainStackViewOffset].active = YES;
    [guide.trailingAnchor constraintEqualToAnchor:mainStackView.trailingAnchor constant:kSizeMainStackViewOffset].active = YES;
    [guide.bottomAnchor constraintEqualToAnchor:mainStackView.bottomAnchor constant:kSizeMainStackViewOffset].active = YES;
    
    WKWebViewConfiguration* configuration = [WKWebViewConfiguration new];
    [configuration.userContentController addScriptMessageHandler:(id <WKScriptMessageHandler>)self name:@"observer"];
    configuration.processPool = pro;
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:_webView.frame configuration:configuration];
    [webView.configuration.preferences setValue:@TRUE forKey:@"allowFileAccessFromFileURLs"];

    webView.backgroundColor = [UIColor lightGrayColor];
    webView.translatesAutoresizingMaskIntoConstraints = NO;
    self.webView = webView;
    
    
    WKWebView *webView2 = [[WKWebView alloc] initWithFrame:_webView.frame configuration:configuration];
    [webView2.configuration.preferences setValue:@TRUE forKey:@"allowFileAccessFromFileURLs"];
    webView2.backgroundColor = [UIColor lightGrayColor];
    webView2.translatesAutoresizingMaskIntoConstraints = NO;
    self.webView2 = webView2;
    webView2.hidden = true;
    
    
 
    footerStackView = [[UIStackView alloc] init];
    footerStackView.axis = UILayoutConstraintAxisHorizontal;
    //footerStackView.alignment = UIStackViewAlignmentFill;
    footerStackView.distribution =UIStackViewDistributionFillEqually;
    //footerStackView.spacing = kStackViewSpacing;
    //footerStackView.translatesAutoresizingMaskIntoConstraints = NO;
    


    homeImage = [UIImage imageNamed:@"img/home.png"];
    homeButton_footer = [UIButton buttonWithType:UIButtonTypeCustom];
   
    [homeButton_footer setImage:[homeImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [homeButton_footer setTintColor:[UIColor blackColor]];
    
    homeButton_footer.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [homeButton_footer addTarget:self action:@selector(buttonTouch:withEvent:) forControlEvents:UIControlEventTouchUpInside];
    homeButton_footer.tag= 11;
    //[homeButton_footer setEnabled: NO];

    searchImage = [UIImage imageNamed:@"img/search.png"];
    searchButton_footer= [UIButton buttonWithType:UIButtonTypeCustom];
    [searchButton_footer setImage:[searchImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [searchButton_footer setTintColor:[UIColor blackColor]];
    searchButton_footer.imageView.contentMode = UIViewContentModeScaleAspectFit;

    [searchButton_footer addTarget:self action:@selector(buttonTouch:withEvent:) forControlEvents:UIControlEventTouchUpInside];
    searchButton_footer.tag= 22;
    
    
   
    favImage = [UIImage imageNamed:@"img/fav.png"];
    favButton_footer = [UIButton buttonWithType:UIButtonTypeCustom];
   
    [favButton_footer setImage:[favImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [favButton_footer setTintColor:[UIColor blackColor]];
    
    favButton_footer.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [favButton_footer addTarget:self action:@selector(buttonTouch:withEvent:) forControlEvents:UIControlEventTouchUpInside];
    favButton_footer.tag= 33;
    
    
    hideImage = [UIImage imageNamed:@"img/hide.png"];
    hideButton_footer = [UIButton buttonWithType:UIButtonTypeCustom];
    [hideButton_footer setImage:[hideImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [hideButton_footer setTintColor:[UIColor blackColor]];
    hideButton_footer.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [hideButton_footer addTarget:self action:@selector(buttonTouch:withEvent:) forControlEvents:UIControlEventTouchUpInside];
    hideButton_footer.tag= 44;
    
    
    
    
    
    [searchButton_footer.heightAnchor constraintEqualToConstant:35].active = true;
    [homeButton_footer.heightAnchor constraintEqualToConstant:35].active = true;
    [favButton_footer.heightAnchor constraintEqualToConstant:35].active = true;
    
    homeButton_footer.imageEdgeInsets = UIEdgeInsetsMake(0,  0,  0, 0);
    favButton_footer.imageEdgeInsets = UIEdgeInsetsMake(0,  0,  0, 0);
    searchButton_footer.imageEdgeInsets = UIEdgeInsetsMake(0,  0,  0, 0);

    [homeButton_footer setEnabled: NO];
    [searchButton_footer setEnabled: NO];
    [favButton_footer setEnabled: NO];
    [hideButton_footer setEnabled: NO];
    
    [noonButton setEnabled: NO];
    [menuButton setEnabled: NO];
    [upButton setEnabled: NO];
    [downButton setEnabled: NO];
    [rightButton setEnabled: NO];
    [leftButton setEnabled: NO];
    
    
    
    
    
    
    
    [footerStackView addArrangedSubview:searchButton_footer];
    [footerStackView addArrangedSubview:favButton_footer];
    [footerStackView addArrangedSubview:hideButton_footer];
    [footerStackView addArrangedSubview:homeButton_footer];

    headerStackView.hidden =true;
    footerStackView.hidden = true;
    
    
    [mainStackView addArrangedSubview:headerStackView];
    [mainStackView addArrangedSubview:webView];
    [mainStackView addArrangedSubview:webView2];
    [mainStackView addArrangedSubview:footerStackView];
    
    
    
    
    
    [self hide_search_section];
    [self hide_fav_section];
    [self show_home_section];
    
    
    // Load html as File and Load html as String Stack View
   /* UIStackView *loadHtmlFileAndLoadHtmlStringStackView = [[UIStackView alloc] init];
    loadHtmlFileAndLoadHtmlStringStackView.axis = UILayoutConstraintAxisHorizontal;
    loadHtmlFileAndLoadHtmlStringStackView.alignment = UIStackViewAlignmentFill;
    loadHtmlFileAndLoadHtmlStringStackView.distribution = UIStackViewDistributionFillEqually;
    loadHtmlFileAndLoadHtmlStringStackView.spacing = kStackViewSpacing;
    loadHtmlFileAndLoadHtmlStringStackView.translatesAutoresizingMaskIntoConstraints = NO;
    [mainStackView addArrangedSubview:loadHtmlFileAndLoadHtmlStringStackView];
    
    // Load html as File Button
    UIButton *loadHtmlAsFileButton = [[UIButton alloc] init];
    loadHtmlAsFileButton.backgroundColor = kColorLoadHtmlAsFileButton;
    [loadHtmlAsFileButton setTitleColor:kColorLoadHtmlAsFileButtonText forState:UIControlStateNormal];
    [loadHtmlAsFileButton setTitle:kTitleLoadHtmlAsFileButton forState:UIControlStateNormal];
    [loadHtmlAsFileButton.titleLabel setFont:[UIFont systemFontOfSize:kFontSizeButtonText]];
    loadHtmlAsFileButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.loadHtmlAsFileButton = loadHtmlAsFileButton;
    [loadHtmlFileAndLoadHtmlStringStackView addArrangedSubview:loadHtmlAsFileButton];
    // Layout for Load html as File Button
    [loadHtmlAsFileButton.heightAnchor constraintEqualToConstant:kButtonHeight].active = YES;
    
    // Load html as String Button
    UIButton *loadHtmlAsStringButton = [[UIButton alloc] init];
    loadHtmlAsStringButton.backgroundColor = kColorLoadHtmlAsStringButton;
    [loadHtmlAsStringButton setTitleColor: kColorLoadHtmlAsStringButtonText forState:UIControlStateNormal];
    [loadHtmlAsStringButton setTitle:kTitleLoadHtmlAsStringButton forState:UIControlStateNormal];
    [loadHtmlAsStringButton.titleLabel setFont:[UIFont systemFontOfSize:kFontSizeButtonText]];
    loadHtmlAsStringButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.loadHtmlAsStringButton = loadHtmlAsStringButton;
    [loadHtmlFileAndLoadHtmlStringStackView addArrangedSubview:loadHtmlAsStringButton];
    // Layout for Load html as String Button
    [loadHtmlAsStringButton.heightAnchor constraintEqualToConstant:kButtonHeight].active = YES;
    
    // Zoom and Run Javascript Stack View
    UIStackView *zoomAndRunJavascriptStackView = [[UIStackView alloc] init];
    zoomAndRunJavascriptStackView.axis = UILayoutConstraintAxisHorizontal;
    zoomAndRunJavascriptStackView.alignment = UIStackViewAlignmentFill;
    zoomAndRunJavascriptStackView.distribution = UIStackViewDistributionFillProportionally;
    zoomAndRunJavascriptStackView.spacing = kStackViewSpacing;
    zoomAndRunJavascriptStackView.translatesAutoresizingMaskIntoConstraints = NO;
    [mainStackView addArrangedSubview:zoomAndRunJavascriptStackView];
    
    // Zoom Button
    UIButton *zoomButton = [[UIButton alloc] init];
    zoomButton.backgroundColor = kColorZoomButton;
    [zoomButton setTitleColor:kColorZoomButtonText forState:UIControlStateNormal];
    [zoomButton setTitle:kTitleZoomButton forState:UIControlStateNormal];
    zoomButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.zoomButton = zoomButton;
    [zoomAndRunJavascriptStackView addArrangedSubview:zoomButton];
    // Layout for Zoom Button
    [zoomButton.heightAnchor constraintEqualToConstant:kButtonHeight].active = YES;
    
    // Run JavaScript Button
    UIButton *runJavaScriptButton = [[UIButton alloc] init];
    runJavaScriptButton.backgroundColor = kColorRunJavaScriptButton;
    [runJavaScriptButton setTitleColor: kColorRunJavaScriptButtonText forState:UIControlStateNormal];
    [runJavaScriptButton setTitle:kTitleRunJavaScriptButton forState:UIControlStateNormal];
    runJavaScriptButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.runJavaScriptButton = runJavaScriptButton;
    [zoomAndRunJavascriptStackView addArrangedSubview:runJavaScriptButton];
    // Layout for Run JavaScript Button
    [runJavaScriptButton.heightAnchor constraintEqualToConstant:kButtonHeight].active = YES;*/
}

/// Load local html resource as File or as String
- (void)loadWebViewContent: (NSString *)file asFile:(BOOL)asFile {
    
    
    
    if([[LocalizeHelper readUserDefaults:@"server_error"] isEqual:@"true"]){
        
        [LocalizeHelper load_webview:self.webView name:@"dir" type:@"local" port:[LocalizeHelper readUserDefaults:@"port_number"]];
        
    }
    else{
        [LocalizeHelper load_webview:self.webView name:@"dir.html" type:@"server" port:[LocalizeHelper readUserDefaults:@"port_number"]];
        
    }
    
    
    NSLog(@"lllllhttp://localhost:%@/index.html", [LocalizeHelper readUserDefaults:@"port_number"]);
  
    
    NSString *urlstring2 = [NSString stringWithFormat:@"http://192.168.1.108:%@/app/dir.html", [LocalizeHelper readUserDefaults:@"port_number"]];
    
    
    
   // NSLog(@"uuuuuuuuuuuuuuuu:%hu", [httpServer listeningPort]);
    
    //NSURL *nsurl2=[NSURL URLWithString:urlstring2];
    //NSURLRequest *nsrequest2=[NSURLRequest requestWithURL:nsurl2];
   
    //[self.webView loadRequest:nsrequest];
   // [self.webView2 loadRequest:nsrequest2];
    
    
    /*UIButton *share_butt = [[UIButton alloc]initWithFrame:CGRectMake(10, 0, 300, 300)];
    [share_butt setTitle:@"Zoom OFF" forState:UIControlStateNormal];

    UIView *popupView=[[UIView alloc]initWithFrame:CGRectMake(10, 10, 300, 350)]; // set popup frame your require position
        [popupView addSubview:share_butt];
        [self.view addSubview:popupView];*/
    
    
   /* NSString *filePath = [[NSBundle mainBundle] pathForResource:file ofType:@"html" inDirectory:@"LocalWebAssets"];
    if ([filePath isEqual: @""] || filePath == nil || filePath == (id)[NSNull null]) {
        NSLog(@"Unable to load local html file: %@", file);
        return;
    }
    
    if (asFile) {
        // load local file
        NSURL *filePathURL = [NSURL fileURLWithPath:filePath];
        NSURL *fileDirectoryURL = [filePathURL URLByDeletingLastPathComponent];
        [self.webView loadFileURL:filePathURL allowingReadAccessToURL:fileDirectoryURL];
    } else {
        @try {
            // load html string. baseURL is required for local files to load correctly
            NSString *html = [NSString stringWithContentsOfFile:filePath encoding:kCFStringEncodingUTF8 error:nil];
            [self.webView loadHTMLString:html baseURL:[[[NSBundle mainBundle] resourceURL] URLByAppendingPathComponent:@"LocalWebAssets"]];
        }
        @catch (NSException *exception) {
            NSLog(@"Unable to load local html resource as string");
        }
    }*/
}

- (void)loadWebViewContent {
    [self loadWebViewContent:@"index" asFile:YES];
}

- (void)addActions {
    [self.loadHtmlAsFileButton addTarget:self
                                  action:@selector(loadWebViewContentAsFile)
                        forControlEvents:UIControlEventTouchUpInside];
    [self.loadHtmlAsStringButton addTarget:self
                                    action:@selector(loadWebViewContentAsString)
                          forControlEvents:UIControlEventTouchUpInside];
    [self.zoomButton addTarget:self
                        action:@selector(tapZoomButton)
              forControlEvents:UIControlEventTouchUpInside];
    [self.runJavaScriptButton addTarget:self
                                 action:@selector(tapRunJavascript)
                       forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Button actions

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    
    
    if(searchBar.tag ==5)
     {
         [self do_fav];
     }
    
   if(searchBar.tag ==6)
    {
        [self do_search];
       
        
    }
    
    [self touchesBegan];
    
}


- (void)go_next{
    [self.view endEditing:YES];
    NSString *script = @"next_prev('next')";
        
        [self.webView evaluateJavaScript:script completionHandler:^(id _Nullable result, NSError * _Nullable error) {
         
            
        }];


    [self touchesBegan];

}






- (void)go_prev{
    
    [self.view endEditing:YES];
    NSString *script = @"next_prev('prev')";
        
        [self.webView evaluateJavaScript:script completionHandler:^(id _Nullable result, NSError * _Nullable error) {
          
            
        }];
    
    [self touchesBegan];
    
}
- (void)go_down{
    [self.view endEditing:YES];
    NSString *script = @"up_down('down');";
        
        [self.webView evaluateJavaScript:script completionHandler:^(id _Nullable result, NSError * _Nullable error) {
           
            
        }];
    
    [self touchesBegan];
    
    
}

- (void)go_up{
    [self.view endEditing:YES];
    NSString *script = @"up_down('up');";
        
        [self.webView evaluateJavaScript:script completionHandler:^(id _Nullable result, NSError * _Nullable error) {
          
            
        }];
    
    [self touchesBegan];
    
    
}

- (void)do_home{
    [self hide_search_section];
    [self hide_fav_section];
    [self show_home_section];
    
    searchButton_footer.backgroundColor = [UIColor clearColor];
    favButton_footer.backgroundColor = [UIColor clearColor];
    
    prvfavButton=favButton_footer;
    prvsearchButton=searchButton_footer;
    searchButton_footer.selected = false;
    favButton_footer.selected = false;
    [self.view endEditing:YES];
    
    
    NSString *script = @"go_main();";
        
        [self.webView evaluateJavaScript:script completionHandler:^(id _Nullable result, NSError * _Nullable error) {
          
            
        }];
    
    [self touchesBegan];
    
}

- (void)do_close{
    
NSString *script  = [NSString stringWithFormat:@"hide_snpit();"];
    
    [self.webView evaluateJavaScript:script completionHandler:^(id _Nullable result, NSError * _Nullable error) {
       
        
    }];
}

- (void)do_search{

    [self.view endEditing:YES];
    
    NSString *search_value = searchBar.text;
    NSString *script  = [NSString stringWithFormat:@"search_run(null, searchBox,'%@');", search_value];
    
        
        [self.webView evaluateJavaScript:script completionHandler:^(id _Nullable result, NSError * _Nullable error) {
          
            
        }];
    
    [self touchesBegan];
    
    
}

- (void)do_fav{

    [self.view endEditing:YES];

    NSString *fav_value = favBar.text;
    NSString *script  = [NSString stringWithFormat:@"saveBookmark(null,'%@');", fav_value];
    
        
        [self.webView evaluateJavaScript:script completionHandler:^(id _Nullable result, NSError * _Nullable error) {
          
            
        }];
    
    [self touchesBegan];
    
    
    
}
- (void)show_snipt_section {
    [self hide_search_section];
    [self hide_fav_section];
    
    spacerButton.hidden = false;
    noonButton.hidden = false;
    leftButton.hidden = true;
    rightButton.hidden = true;
    menuButton.hidden= true;
    closeButton.hidden= false;
    downButton.hidden = false;
    upButton.hidden = false;
    searchBar.hidden =true;
    favBar.hidden =true;
}

- (void)hide_snipt_section {
    [self show_search_section];
    [self hide_fav_section];
    
   
}



- (void)hide_search_section {
    searchBar.hidden =true;
    searchButton.hidden =true;
    leftButton.hidden = true;
    rightButton.hidden = true;
    spacerButton.hidden = true;
    menuButton.hidden= true;
    closeButton.hidden= true;
    
}
- (void)show_search_section {
    searchBar.hidden =false;
    searchButton.hidden =false;
    leftButton.hidden = true;
    rightButton.hidden = true;
    spacerButton.hidden = true;
    menuButton.hidden= true;
    closeButton.hidden= true;
    
}

- (void)show_fav_section {
    favBar.hidden =false;
    favButton.hidden =false;
    leftButton.hidden = true;
    rightButton.hidden = true;
    spacerButton.hidden = true;
    menuButton.hidden= true;
    closeButton.hidden= true;
    
}

- (void)hide_fav_section {
    favBar.hidden =true;
    favButton.hidden =true;
    leftButton.hidden = true;
    rightButton.hidden = true;
    spacerButton.hidden = true;
    menuButton.hidden= true;
    closeButton.hidden= true;
}

- (void)show_home_section {
    [self hide_search_section];
    [self hide_fav_section];
    spacerButton.hidden = false;
    leftButton.hidden = false;
    rightButton.hidden = false;
    menuButton.hidden= false;
    closeButton.hidden= true;
}




- (void)loadWebViewContentAsFile {
    [self loadWebViewContent:@"htmlAsFile" asFile:YES];
}

- (void)loadWebViewContentAsString {
    [self loadWebViewContent:@"htmlAsString" asFile:YES];
}

- (void)tapZoomButton {
    if (self.zoomEnabled) {
        self.zoomEnabled = NO;
        [self.zoomButton setTitle:@"Zoom OFF" forState:UIControlStateNormal];
        [self.zoomButton setBackgroundColor:UIColor.redColor];
        
        // Disable zoom in web view
        // I wish NSString has more simple concatenation
        NSString *source = [NSString stringWithFormat:@"%@ %@ %@ %@ %@",
                            @"var meta = document.createElement('meta');",
                            @"meta.name = 'viewport';",
                            @"meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';",
                            @"var head = document.getElementsByTagName('head')[0];",
                            @"head.appendChild(meta);"];
        
        WKUserScript *script  = [[WKUserScript alloc] initWithSource:source injectionTime: WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
        
        [self.webView.configuration.userContentController addUserScript:script];
        [self.webView reload];
    } else {
        self.zoomEnabled = YES;
        
        [self.zoomButton setTitle:@"Zoom ON" forState:UIControlStateNormal];
        [self.zoomButton setBackgroundColor:UIColor.greenColor];
        
        // Enable zoom in web view
        [self.webView.configuration.userContentController removeAllUserScripts];
        [self.webView reload];
    }
}

- (void)tapRunJavascript {
    NSString *script = @"textMessageJS()";
    
    [self.webView evaluateJavaScript:script completionHandler:^(id _Nullable result, NSError * _Nullable error) {
       
        
    }];
}

- (void)sendEmail {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *email = [[MFMailComposeViewController alloc] init];
        email.mailComposeDelegate = self;
        [email setSubject:@"Feedback"];
        NSString *appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
        NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        NSString *buildNumber = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
        
        if (appName && version && buildNumber) {
            NSString *subject = [NSString stringWithFormat:@"Feedback for %@, Version: %@, Build: %@", appName, version, buildNumber];
            [email setSubject:subject];
        }
        
        NSArray *recipients = [NSArray arrayWithObject:@"svasilevkin@gmail.com"];
        [email setToRecipients:recipients];
        [email setMessageBody:@"<p>This is message text.</p>" isHTML:YES];
        [self presentViewController:email animated:YES completion:nil];
    } else {
        // show failure alert
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"No email account"
                                              message:@"Please configure email account first."
                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:nil];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
   
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:webView.URL];
    [request setHTTPMethod:@"HEAD"];

    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    
    //if ([webView.URL.absoluteString hasPrefix:@"http://192.168.1.108/app/print.html"]) {
    
    if (isPrintlunch ==true){
         //NSLog(@"iiiiiiiii %@",webView.URL.absoluteString);
        [self printTitle:_urlTextView.text webView:self.webView2];
        
        isPrintlunch =false;
    }
    
    [self.webView evaluateJavaScript:@"window.scrollBy(1, 1);window.scrollBy(-1, -1);" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
       
    }];
    
}



- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
   
     NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:navigationAction.request.URL.absoluteString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0];
       [request setHTTPMethod:@"HEAD"];
       NSHTTPURLResponse* response = nil;
       NSError* error = nil;
       [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
       NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    NSLog(@"statusCode = %ld", (long)[response statusCode]);
    
    
    if([response statusCode] == 0 ){
        
       
       if([[LocalizeHelper readUserDefaults:@"server_error"] isEqual:@"true"]){
            
            [LocalizeHelper load_webview:self.webView name:@"index" type:@"local" port:[LocalizeHelper readUserDefaults:@"port_number"]];
            
        }
        else{
            [LocalizeHelper load_webview:self.webView name:@"index.html" type:@"server" port:[LocalizeHelper readUserDefaults:@"port_number"]];
            
        }
    }
        
    
    /*NSURL *ns=[NSURL URLWithString:navigationAction.request.URL.absoluteString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:ns];
    [request setHTTPMethod:@"HEAD"];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];*/
    
    
    
    if (navigationAction.navigationType == WKNavigationTypeLinkActivated) {
        NSURL *url = navigationAction.request.URL;
        NSString *host = url.host;
        NSLog(@"%@", url);
        if ([url isEqual: @""] || url == nil || url == (id)[NSNull null]) {
            NSLog(@"Link is not a url.");
            decisionHandler(WKNavigationActionPolicyAllow);
            return;
        }
        if ([url.absoluteString hasPrefix:@"file:"]) {
            NSLog(@"Open link locally.");
            decisionHandler(WKNavigationActionPolicyAllow);
        }
        else if (![url.absoluteString hasPrefix: @"http://localhost"]) {
           
            
        
                    [UIApplication.sharedApplication openURL:url options:@{} completionHandler:nil];
               

            NSLog(@"%@", url);
            NSLog(@"Redirected to browser.");
            decisionHandler(WKNavigationActionPolicyCancel);
        }
        
        /*else if ((![host isEqual: @""] || !(host == nil) || !(host == (id)[NSNull null])) &&
                   !([host hasPrefix:@"svasilevkin.wordpress.com"]) &&
                   
    [UIApplication.sharedApplication canOpenURL:url]) {
           
            
        
                if (@available(iOS 10.0, *)) {
                    [UIApplication.sharedApplication openURL:url options:@{} completionHandler:nil];
                } else {
                    [[UIApplication sharedApplication] openURL:url];
                }

            NSLog(@"%@", url);
            NSLog(@"Redirected to browser.");
            decisionHandler(WKNavigationActionPolicyCancel);
        } */else if ([url.absoluteString hasPrefix:@"mailto:"]) {
            NSLog(@"Send email locally");
            [self sendEmail];
            decisionHandler(WKNavigationActionPolicyAllow);
        } else {
            NSLog(@"Open link locally");
            decisionHandler(WKNavigationActionPolicyAllow);
        }
    } else {
        
        
        
        
        NSLog(@"not a user click");
        decisionHandler(WKNavigationActionPolicyAllow);
    }
    
    
    
    
}

#pragma mark - WKScriptMessageHandler




- (void)processImage:(UIImage*)image
    {
        
       /* UIImage *viewImage = image ;// --- mine was made from drawing context
        ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
        // Request to save the image to camera roll
        [library writeImageToSavedPhotosAlbum:[viewImage CGImage] orientation:(ALAssetOrientation)[viewImage imageOrientation] completionBlock:^(NSURL *assetURL, NSError *error){
            if (error) {
                NSLog(@"error");
            } else {
                
                NSString *path = assetURL.absoluteString;
                
                
               // [self scheduleNotification:path];
                NSLog(@"url %@", assetURL);
            }
        }];*/
     
    
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    }


- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
{
    if (!error) {
        // saved successfully

        PHFetchOptions *fetchOptions = [PHFetchOptions new];
        fetchOptions.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
        PHAsset *asset = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:fetchOptions].firstObject;
        if (asset != nil) {
            // here you can use asset of your image
            
            PHContentEditingInputRequestOptions *options = [PHContentEditingInputRequestOptions new];
                options.canHandleAdjustmentData = ^BOOL(PHAdjustmentData *adjustmentData) { return NO; };
           
            [asset requestContentEditingInputWithOptions:options completionHandler:^(PHContentEditingInput *contentEditingInput, NSDictionary *info) {

                CIImage *fullImage = [CIImage imageWithContentsOfURL:contentEditingInput.fullSizeImageURL];
                NSLog(@"%@",contentEditingInput.fullSizeImageURL);//get url
                //NSLog(@"%@", fullImage.properties.description);//get {TIFF}, {Exif}
                
                NSString *path = contentEditingInput.fullSizeImageURL.absoluteString;
                
                [self scheduleNotification:path];
            }];
        }
    } else {
        NSLog(@"save image error: %@", error);
    }
}

#pragma mark - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [controller dismissViewControllerAnimated:YES completion:nil];
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


- (void)scheduleNotification:(NSString*)path{
    NSLog( @"Handle push from foreground1" );
/*
    if(isGrantedNotificationAccess){
        
        NSLog( @"Handle push from foreground2" );
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];

        UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
        content.title = @"Notification Title";
        content.subtitle = @"Notification Subtitle";
        content.body = @"This is Obj-C Local Notification";
        content.sound = [UNNotificationSound defaultSound];
        content.userInfo=        @{@"path":path};
                                       
        UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:1 repeats:NO];
        
        
        // Actions
            UNNotificationAction *snoozeAction = [UNNotificationAction actionWithIdentifier:@"Snooze"
        title:@"Snooze" options:UNNotificationActionOptionNone];
        
        
        UNNotificationCategory *category = [UNNotificationCategory categoryWithIdentifier:@"UYLReminderCategory"
                                                                                      actions:@[snoozeAction] intentIdentifiers:@[]
                                                                                      options:UNNotificationCategoryOptionNone];
        
        
        
        NSSet *categories = [NSSet setWithObject:category];

          // Objective-C
          [center setNotificationCategories:categories];
       
        content.categoryIdentifier = @"UYLReminderCategory";
        
        UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"UYLLocalNotification" content:content trigger:trigger];
        [center addNotificationRequest:request withCompletionHandler:nil];
    }*/
    
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];

 UNAuthorizationOptions options = UNAuthorizationOptionAlert +UNAuthorizationOptionSound;
 
 [center requestAuthorizationWithOptions:options        completionHandler:^(BOOL granted, NSError * _Nullable error) {
         isGrantedNotificationAccess = granted;
 }];

    
    
    if(isGrantedNotificationAccess){
    UNMutableNotificationContent* content = [[UNMutableNotificationContent alloc] init];
    content.title = [NSString localizedUserNotificationStringForKey:LocalizedString(@"download_done") arguments:nil];
    content.body = [NSString localizedUserNotificationStringForKey:LocalizedString(@"download_done_desc")
                arguments:nil];
    content.sound = [UNNotificationSound defaultSound];
    
    content.userInfo=        @{@"path":path};
    
    // Deliver the notification in five seconds.
    UNTimeIntervalNotificationTrigger* trigger = [UNTimeIntervalNotificationTrigger
                triggerWithTimeInterval:1 repeats:NO];
    UNNotificationRequest* request = [UNNotificationRequest requestWithIdentifier:@"FiveSecond"
                content:content trigger:nil];
     
    // Schedule the notification.
    UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
    [center addNotificationRequest:request withCompletionHandler:nil];
    
    }
    
}

- (UIViewController *) documentInteractionControllerViewControllerForPreview: (UIDocumentInteractionController *) controller {
return self;
}


- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    //do stuff
  
    if(searchBar.tag ==5)
     {
         downButton.hidden = YES;
         upButton.hidden = YES;
         noonButton.hidden = YES;
     }
    
   if(searchBar.tag ==6)
    {
        downButton.hidden = YES;
        upButton.hidden = YES;
        noonButton.hidden = YES;
        
    }
    
    //NSLog(@"%ld", searchBar.tag);

    return YES;
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
  
    
    if(searchBar.tag ==5)
     {
         downButton.hidden = NO;
         upButton.hidden = NO;
         noonButton.hidden = NO;
     }
    
   if(searchBar.tag ==6)
    {
        downButton.hidden = NO;
        upButton.hidden = NO;
        noonButton.hidden = NO;
        
    }
    
    
    
    return YES;
}




- (void)buttonTouch:(UIButton *)aButton withEvent:(UIEvent *)event
{
    prvsearchButton.layer.borderWidth = 0.0;
    prvfavButton.layer.borderWidth = 0.0;
    prvsearchButton.backgroundColor = [UIColor clearColor];
    prvfavButton.backgroundColor = [UIColor clearColor];
    NSString *cell_tag = [[NSUserDefaults standardUserDefaults]
        stringForKey:@"cell_tag_1"];
    
    [self hide_search_section];
    [self hide_fav_section];
    
    if(aButton.tag==11){
        
        [self show_home_section];
        
        searchButton_footer.selected= false;
        favButton_footer.selected= false;
        NSString *script = @"change_style()";
            
            [self.webView evaluateJavaScript:script completionHandler:^(id _Nullable result, NSError * _Nullable error) {
               
                
            }];
        
        
    }
    
    
    
    
    
    if(aButton.tag==22){
    
        prvfavButton.selected=false;
        //favButton.selected=false;
        aButton.selected = !aButton.selected;
        
        
        
        if(aButton.selected){
           NSLog(@"you clicked on button");
         
            [self.webView evaluateJavaScript:@"toggle_view_wkwebview('show','search_view')" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
                   
                
                }];
            
           
            
           
            
            if(cell_tag==NULL || [cell_tag isEqual:@"off"]){
                
                aButton.backgroundColor = [UIColor grayColor];
                 aButton.layer.borderColor = [UIColor whiteColor].CGColor;
            }
            else{
               
                aButton.layer.borderColor = [UIColor whiteColor].CGColor;
                aButton.layer.borderWidth = 1.0;
                aButton.layer.cornerRadius = 10;
                
                
            }
            
            
            
            
            [self show_search_section];
            
            
        }
        else{
            
            [self.webView evaluateJavaScript:@"toggle_view_wkwebview('hide','search_view')" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
                   
                
                }];
            aButton.backgroundColor = [UIColor clearColor];
            [self show_home_section];
            
        }
    
       
        prvsearchButton=aButton;
        
    }
    
    
    if(aButton.tag==33){
    
        prvsearchButton.selected=false;
        //searchButton.selected=false;
        aButton.selected = !aButton.selected;
        
        
        
        if(aButton.selected){
           NSLog(@"you clicked on button");
         
            if(cell_tag==NULL || [cell_tag isEqual:@"off"]){
                
                aButton.backgroundColor = [UIColor grayColor];
               
            }
            else{
               
                aButton.layer.borderColor = [UIColor whiteColor].CGColor;
                aButton.layer.borderWidth = 1.0;
                aButton.layer.cornerRadius = 10;
                
                
            }
            
            [self show_fav_section];
            
            [self.webView evaluateJavaScript:@"toggle_view_wkwebview('show','fav_view')" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
                   
                
                }];
            
            
        }
        else{
            
            [self.webView evaluateJavaScript:@"toggle_view_wkwebview('hide','fav_view')" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
                   
                
                }];
            
            aButton.backgroundColor = [UIColor clearColor];
            [self show_home_section];
            
        }
    
        prvfavButton=aButton;

        
    }
    
    
    if(aButton.tag==44){
        
        headerStackView.hidden =true;
        footerStackView.hidden = true;

        NSString *script = @"hide_style()";
        
        [self.webView evaluateJavaScript:script completionHandler:^(id _Nullable result, NSError * _Nullable error) {
           
            
        }];
    }
    
    [self touchesBegan];
    
}
-(void)toggle_drop_menu{
    
   UIButton* aButton = menuButton;
    if(aButton.tag==55){
        
        aButton.selected = !aButton.selected;
  
        
       if(aButton.selected){

           [self showDropDown];
           
       }
       else{
           
     
           [self touchesBegan];
           
       }
        
    }
    
}


-(void)touchesBegan
{
    menuButton.selected = false;
    
    //Do what ever you want
        [sb.view removeFromSuperview];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];

    //if(touch.view.tag==99){
        [self touchesBegan];
    //}
}

- (void)showDropDown
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    sb = (DropDownMenu *)[storyboard instantiateViewControllerWithIdentifier:@"DropDownMenu"];
    
    
    sb.view.tag=99;
 

    
    
    
    CGRect newFrame;


    double x =  0.0;
    double y =  0.0;
    
    
  
    double h =  0.0;
    CGPoint position =menuButton.frame.origin;

    
        
        y=(headerStackView.bounds.size.height+(mainStackView.frame.origin.y));
        
   
   
    if(self.view.bounds.size.height >650){
        
        newFrame= CGRectMake(0, y, 220, 650);  //Change this to adjust
    }
    else{
    
        newFrame= CGRectMake(0, y, 220, self.view.bounds.size.height-70);
         

    }
    
        
   
    
    
    
    [sb.view setFrame:newFrame];
    
   
    
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"selectedListItem" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(changeValue:)
                                                 name:@"selectedListItem"
                                              object:nil];
    
    
   
    //[self addChildViewController:sb];
    [self.view addSubview:sb.view];
    [sb didMoveToParentViewController:self];
    
    [self.view layoutIfNeeded];
}

-(float) statusBarHeight
{
    CGSize statusBarSize = [[UIApplication sharedApplication] statusBarFrame].size;
    return MIN(statusBarSize.width, statusBarSize.height);
}




- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [coordinator animateAlongsideTransition:nil completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
        
        dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 0);
        dispatch_after(delay, dispatch_get_main_queue(), ^(void){
            
            stat_bar =  [self statusBarHeight];
            
            
            self.edgesForExtendedLayout = UIRectEdgeNone;
            
            CGRect newFrame;
            
            double x =  0.0;
            double y =  0.0;
            double h =  0.0;
            
            CGPoint position =menuButton.frame.origin;
            [self.view layoutIfNeeded];
            
            y=(headerStackView.bounds.size.height+(mainStackView.frame.origin.y));
            
            

            if(self.view.bounds.size.height >650){
                
                newFrame= CGRectMake(0, y, 220, 650);  //Change this to adjust
            }
            else{
            
                newFrame= CGRectMake(0, y, 220, self.view.bounds.size.height-70);
                 
    
            }
            [sb.view setFrame:newFrame];

            //[self.view addSubview:sb.view];
            //[sb didMoveToParentViewController:self];
            
           // [self.view layoutIfNeeded];
            
            
            
            CGRect screenRect = [[UIScreen mainScreen] bounds];
              CGFloat screenHeight = 0.0;

              screenHeight = screenRect.size.height;
              CGRect screenFrame;
              
              screenFrame = CGRectMake(0, 0, self.view.frame.size.width,screenHeight);
              
              UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;

            if(mainStackView.frame.origin.y ==8.000000){
               
             if (![UIApplication sharedApplication].isStatusBarHidden){
                 
                 NSLog(@"coo11");
                 
                 screenFrame = CGRectMake(0, mainStackView.frame.origin.y+8,
                                                                          self.view.frame.size.width,screenHeight-(8+mainStackView.frame.origin.y));


                 

             }
             else{
                 if([self isLandscape]==false){
                     
                     NSLog(@"coo1111");
                     screenFrame = CGRectMake(0, (mainStackView.frame.origin.y)+8,
                                             self.view.frame.size.width,screenHeight-(8+mainStackView.frame.origin.y));
                     
                 }
                 
                 
                 
                 
                 
             }
              
                
              

            }
            else{
            if ([UIApplication sharedApplication].isStatusBarHidden){

               

                if([self isLandscape]==false){
                   
                    

                    
                }
                else{
                    
                    NSLog(@"coo2");
                    
                    screenFrame = CGRectMake(0, -mainStackView.frame.origin.y+8,
                                                 self.view.frame.size.width,screenHeight-8+mainStackView.frame.origin.y);
                
                 

                    
                }
               
               
                    
               
             }
            }
            
              
                
           
            
            
              self.view.frame = screenFrame;
              self.view.bounds = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            
            [self.view setNeedsDisplay];
            [self.view.layer displayIfNeeded];
            
          
        });
    
        [self.webView evaluateJavaScript:@"$(window).trigger('resize');" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
           
        }];
        
        
        }];
    
  
  
    
   
}




-(void) show_state_bar{
    
   
   
    
    
    dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 0);
    dispatch_after(delay, dispatch_get_main_queue(), ^(void){
   
   
        
        
        [self statusBarShouldHide:false];

        CGRect screenRect = [[UIScreen mainScreen] bounds];
          CGFloat screenHeight = 0.0;

          screenHeight = screenRect.size.height;
          CGRect screenFrame;
          
          screenFrame = CGRectMake(0, 0, self.view.frame.size.width,screenHeight);
          
          UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;

        
        
        if(mainStackView.frame.origin.y ==8.000000){
        
            
            //if (![UIApplication sharedApplication].isStatusBarHidden){
             
             if([self isLandscape] ==false){
                 
                
                     
                 screenFrame = CGRectMake(0, mainStackView.frame.origin.y+8,
                                         self.view.frame.size.width,screenHeight-(8+mainStackView.frame.origin.y));
                  
             }

         //}
         
           
        }
        else{
           
            
            if ([UIApplication sharedApplication].isStatusBarHidden){            if([self isLandscape]==false){
                
                screenFrame = CGRectMake(0,- mainStackView.frame.origin.y+8,
                                        self.view.frame.size.width,screenHeight-(8+mainStackView.frame.origin.y));
                
                
            }
            else{
                
//done
                screenFrame = CGRectMake(0, -mainStackView.frame.origin.y+8,
                                             self.view.frame.size.width,screenHeight-8+mainStackView.frame.origin.y);
                
            
                
            }
            }
                
   
}
        
        
        
        
        
        
          
            
        
        
          self.view.frame = screenFrame;
          self.view.bounds = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
        [self.webView evaluateJavaScript:@"$(window).trigger('resize');" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
           
        }];
    
    });

    
    
    
    
}

-(void)hide_state_bar{

    
    
    
    dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 0);
    dispatch_after(delay, dispatch_get_main_queue(), ^(void){
        
       // [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
        
        [self statusBarShouldHide:true];
        
        CGRect screenRect = [[UIScreen mainScreen] bounds];
          CGFloat screenHeight = 0.0;

          screenHeight = screenRect.size.height;
          CGRect screenFrame;
          
          screenFrame = CGRectMake(0, 0, self.view.frame.size.width,screenHeight);
          
      

        if(mainStackView.frame.origin.y ==8.000000){
           
         

        if ([UIApplication sharedApplication].isStatusBarHidden){
            
            
            if([self isLandscape]){
                
             
                
                
             screenFrame = CGRectMake(0, -mainStackView.frame.origin.y+8,
                                          self.view.frame.size.width,screenHeight-8+mainStackView.frame.origin.y);
            }
            else{
                
                screenFrame = CGRectMake(0, mainStackView.frame.origin.y+8,
                                             self.view.frame.size.width,screenHeight-(8+mainStackView.frame.origin.y));
                
            
               
                
                
            }
          
            
        }
           
            
            
            
        }
        else{
            
            if([self isLandscape]){
                
                
                
                
             screenFrame = CGRectMake(0, -mainStackView.frame.origin.y+8,
                                          self.view.frame.size.width,screenHeight-8+mainStackView.frame.origin.y);
                
            }
            
            
        }
       
        
          
            
        
        
          self.view.frame = screenFrame;
          self.view.bounds = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
        
        [self.webView evaluateJavaScript:@"$(window).trigger('resize');" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
           
        }];
    });
    
   
          
          
   
    
   
    
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
  CGPoint location = [recognizer locationInView:[recognizer.view superview]];

    [self touchesBegan];
}

- (void)set_night_mode{
    
    self.view.window.backgroundColor =[UIColor colorWithRed: 0.13 green: 0.14 blue: 0.26 alpha: 1.00];
    
    
    [searchButton_footer setTintColor:[UIColor whiteColor]];
    [favButton_footer setTintColor:[UIColor whiteColor]];
    [homeButton_footer setTintColor:[UIColor whiteColor]];
    [hideButton_footer setTintColor:[UIColor whiteColor]];
    
    
    [searchButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [favButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [downButton setTintColor:[UIColor whiteColor]];
    [upButton setTintColor:[UIColor whiteColor]];
    [leftButton setTintColor:[UIColor whiteColor]];
    [rightButton setTintColor:[UIColor whiteColor]];
    [closeButton setTintColor:[UIColor whiteColor]];
    
    if (@available(iOS 13, *)) {
     
        searchBar.searchTextField.textColor=[UIColor whiteColor];
        favBar.searchTextField.textColor=[UIColor whiteColor];
        searchBar.searchTextField.leftView.tintColor =[UIColor whiteColor];
        favBar.searchTextField.leftView.tintColor =[UIColor whiteColor];
        favimage = [UIImage imageNamed:@"img/fav_white.png"];        favimage = [UIImage imageWithCGImage:[favimage CGImage] scale:25 orientation:UIImageOrientationUp];
        
        [favBar setImage:favimage forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    }
    else{
        searchTextField.textColor = [UIColor whiteColor];
        favTextField.textColor = [UIColor whiteColor];
        
    }
    

    //[favimage setTintColor:[UIColor redColor]];
    
    
    
    [menuButton setTintColor:[UIColor  whiteColor]];
}

- (void)set_day_mode{
    
    self.view.window.backgroundColor =[UIColor whiteColor];
    [searchButton_footer setTintColor:[UIColor blackColor]];
    [favButton_footer setTintColor:[UIColor blackColor]];
    [homeButton_footer setTintColor:[UIColor blackColor]];
    [hideButton_footer setTintColor:[UIColor blackColor]];
    
    
    [closeButton setTintColor:[UIColor blackColor]];
    [searchButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [favButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [downButton setTintColor:[UIColor blackColor]];
    [upButton setTintColor:[UIColor blackColor]];
    [leftButton setTintColor:[UIColor blackColor]];
    [rightButton setTintColor:[UIColor blackColor]];
    
    
    if (@available(iOS 13, *)) {
     
        searchBar.searchTextField.leftView.tintColor =[UIColor blackColor];
        searchBar.searchTextField.textColor=[UIColor blackColor];
        favBar.searchTextField.textColor=[UIColor blackColor];
        
        favBar.searchTextField.leftView.tintColor =[UIColor whiteColor];
        favimage = [UIImage imageNamed:@"img/fav.png"];        favimage = [UIImage imageWithCGImage:[favimage CGImage] scale:25 orientation:UIImageOrientationUp];
        
        [favBar setImage:favimage forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
        
    }
    else{
        searchTextField.textColor = [UIColor blackColor];
        favTextField.textColor = [UIColor blackColor];
        
    }
    
    [menuButton setTintColor:[UIColor  blackColor]];
}


- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    
    // Callback from JavaScript:
    // window.webkit.messageHandlers.JavaScriptObserver.postMessage(message)
    /*NSString *text = message.body;
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Message from JavaScript"
                                          message:text
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        NSLog(@"OK");
    }];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];*/
    
    
    if([message.name isEqualToString:@"observer"])
   {
      
       NSDictionary *responseObj;
       NSError *jsonError;
       NSString *textt = message.body;

      
       
       
       
       NSData *objectData = [textt dataUsingEncoding:NSUTF8StringEncoding];
       
       responseObj = [NSJSONSerialization JSONObjectWithData:objectData
                                          options:NSJSONReadingMutableContainers
                                           error:&jsonError];
      if(! jsonError) {

          
           
          NSString *event = [responseObj objectForKey:@"event"];
          NSString *arg = [responseObj objectForKey:@"arg"];
         
          
          if([event isEqualToString:@"print"]) {
            
              isPrintlunch =true;
              
             // NSString *urlstring2 = [NSString stringWithFormat:@"http://192.168.1.108:4040/app/print.html"];
              
              
              //NSURL *nsurl2=[NSURL URLWithString:urlstring2];
              //NSURLRequest *nsrequest2=[NSURLRequest requestWithURL:nsurl2];
             
              //[self.webView loadRequest:nsrequest];
              //[self.webView2 loadRequest:nsrequest2];
              
              
              if([[LocalizeHelper readUserDefaults:@"server_error"] isEqual:@"true"]){
                  
                  [LocalizeHelper load_webview:self.webView2 name:@"print" type:@"local" port:[LocalizeHelper readUserDefaults:@"port_number"]];
                  
              }
              else{
                  [LocalizeHelper load_webview:self.webView2 name:@"print.html" type:@"server" port:[LocalizeHelper readUserDefaults:@"port_number"]];
                  
              }
              
              
           // [self printTitle:_urlTextView.text webView:self.webView2];

        }
          
          
          if([event isEqualToString:@"open_link"]){
              
              
              
              NSURL *nsurl2=[NSURL URLWithString:arg];

              //if (@available(iOS 10.0, *)) {
                  [UIApplication.sharedApplication openURL:nsurl2 options:@{} completionHandler:nil];
             
              
          }
          
          
          
          if([event isEqualToString:@"lang_change"]){
              
              vc = [[ViewController alloc] init];
              vc.showAlertEnabled= true;
              [LocalizeHelper go_to_vc:vc];
              
          }
          
          if([event isEqualToString:@"download"]) {

        
              NSString *strImgURLAsString = arg;
              [strImgURLAsString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
              NSURL *imgURL = [NSURL URLWithString:strImgURLAsString];
              [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:imgURL] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                  if (!connectionError) {
                      UIImage *img = [[UIImage alloc] initWithData:data];
                      
                      [self processImage:img];
                    
                      
                  }else{
                      NSLog(@"%@",connectionError);
                  }
              }];
              
              
              
            
         
           }
          
          
          if([event isEqualToString:@"fav_view"]){
              
              if([arg isEqualToString:@"show"]){
                  
                  [self show_fav_section];
                  
                  NSString *cell_tag = [[NSUserDefaults standardUserDefaults]
                          stringForKey:@"cell_tag_1"];
                  
                  if(cell_tag==NULL || [cell_tag isEqual:@"off"]){
                       
                      favButton_footer.backgroundColor = [UIColor grayColor];
                      
                  }
                  else{
                      
                      favButton_footer.layer.borderColor = [UIColor whiteColor].CGColor;
                      favButton_footer.layer.borderWidth = 1.0;
                      favButton_footer.layer.cornerRadius = 10;
                      
                  }
                
                  prvfavButton=favButton_footer;
                  prvsearchButton=searchButton_footer;
                  
                  favButton_footer.selected = true;
                  searchButton_footer.selected = false;
                  
              }
              
          }
          
          if([event isEqualToString:@"search_view"]){
              
              if([arg isEqualToString:@"show"]){
                  
                  [self show_search_section];
                
                 
                  NSString *cell_tag = [[NSUserDefaults standardUserDefaults]
                          stringForKey:@"cell_tag_1"];
                  
                  if(cell_tag==NULL || [cell_tag isEqual:@"off"]){
                       
                      searchButton_footer.backgroundColor = [UIColor grayColor];
                      
                  }
                  else{
                      
                      searchButton_footer.layer.borderColor = [UIColor whiteColor].CGColor;
                      searchButton_footer.layer.borderWidth = 1.0;
                      searchButton_footer.layer.cornerRadius = 10;
                      
                  }
                  
                  prvfavButton=favButton_footer;
                  prvsearchButton=searchButton_footer;
                  searchButton_footer.selected = true;
                  favButton_footer.selected = false;
              }
              
          }
          
          if([event isEqualToString:@"favBox"]){
              
              favBar.text = arg;
          }
          
          if([event isEqualToString:@"search_input"]){
              
              searchBar.text = arg;
          }
          
          if([event isEqualToString:@"go_iframe"]){
              
              [self hide_search_section];
              [self hide_fav_section];
              [self show_home_section];
              
              searchButton_footer.backgroundColor = [UIColor clearColor];
              favButton_footer.backgroundColor = [UIColor clearColor];
              
              prvfavButton=favButton_footer;
              prvsearchButton=searchButton_footer;
              searchButton_footer.selected = false;
              favButton_footer.selected = false;
              
          
          }
          
          if([event isEqualToString:@"button_state"]){
             
              if([arg isEqualToString:@"disabled"]){
                  
               
                  
                  if([[LocalizeHelper readUserDefaults:@"mode_type"] isEqual:@"web"]){
                    
                      
                      headerStackView.hidden =true;
                      footerStackView.hidden =true;
                  }
                  else{
                      headerStackView.hidden =false;
                      footerStackView.hidden = false;
                      
                  }
                  
                  [self show_home_section];
                  [homeButton_footer setEnabled: NO];
                  [searchButton_footer setEnabled: NO];
                  [favButton_footer setEnabled: NO];
                  [hideButton_footer setEnabled: NO];
                  
                  [noonButton setEnabled: NO];
                  [menuButton setEnabled: NO];
                  [upButton setEnabled: NO];
                  [downButton setEnabled: NO];
                  [rightButton setEnabled: NO];
                  [leftButton setEnabled: NO];
                  
                  favImage = [UIImage imageNamed:@"img/fav.png"];
                  [favButton_footer setImage:[favImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
                  
                  NSString *cell_tag = [[NSUserDefaults standardUserDefaults]
                      stringForKey:@"cell_tag_1"];
                  
                  if(cell_tag==NULL || [cell_tag isEqual:@"off"]){
                      [favButton_footer setTintColor:[UIColor blackColor]];
                      
                  }
                  else{
                      [favButton_footer setTintColor:[UIColor whiteColor]];
                      
                  }
                  
              }
              
              if([arg isEqualToString:@"enabled"]){
                  
                  if([[LocalizeHelper readUserDefaults:@"mode_type"] isEqual:@"web"]){
                    
                      
                      headerStackView.hidden =true;
                      footerStackView.hidden =true;
                  }
                  else{
                      headerStackView.hidden =false;
                      footerStackView.hidden = false;
                      
                  }
                 
                  
                  [self show_home_section];
                  [homeButton_footer setEnabled: YES];
                  [searchButton_footer setEnabled: YES];
                  [favButton_footer setEnabled: YES];
                  [hideButton_footer setEnabled: YES];
                  
                  
                  
                  [noonButton setEnabled: YES];
                  [menuButton setEnabled: YES];
                  [upButton setEnabled: YES];
                  [downButton setEnabled: YES];
                  [rightButton setEnabled: YES];
                  [leftButton setEnabled: YES];
                  
                  
              }
              
              
          }
          
          if([event isEqualToString:@"view_state"]){
              
              if([arg isEqualToString:@"hide"]){
                  
                  
                  headerStackView.hidden =true;
                  footerStackView.hidden = true;
                  [homeButton_footer setEnabled: NO];
                  [searchButton_footer setEnabled: NO];
                  [favButton_footer setEnabled: NO];
                  [hideButton_footer setEnabled: NO];
                  
                  [noonButton setEnabled: NO];
                  [menuButton setEnabled: NO];
                  [upButton setEnabled: NO];
                  [downButton setEnabled: NO];
                  [rightButton setEnabled: NO];
                  [leftButton setEnabled: NO];
              }
          }
          
          if([event isEqualToString:@"show_webkit_info"]){
              
          
              const NXArchInfo *info = NXGetLocalArchInfo();
              NSString *typeOfCpu = [NSString stringWithUTF8String:info->description];
              
              NSString *portt;
              
              if([[LocalizeHelper readUserDefaults:@"server_error"] isEqual:@"false"]){
                  
                  portt =[LocalizeHelper readUserDefaults:@"port_number"];
              }
              else{
                  
                  portt =@"null";
              }
              
              NSString *script  = [NSString stringWithFormat:@"show_webkit_info('%@','%@');", typeOfCpu,portt];
                  
                  
              
              
              [self.webView evaluateJavaScript:script completionHandler:^(id _Nullable result, NSError * _Nullable error) {
                     
                  }];
          }
          
          if([event isEqualToString:@"mode_type"]){
              
              vc = [[ViewController alloc] init];
              vc.showAlertEnabled2= true;
              [LocalizeHelper go_to_vc:vc];
          }
          
          
          if([event isEqualToString:@"cell_tag_1"]) {
              
              if([arg isEqualToString:@"on"]) {
                  [LocalizeHelper saveToUserDefaults:@"cell_tag_1" obj:@"on" ];
                  
                  [self set_night_mode];
              }
              else{
                  
                  [LocalizeHelper saveToUserDefaults:@"cell_tag_1" obj:@"off" ];
                  
                  [self set_day_mode];
              }
          }
          
          
          if([event isEqualToString:@"cell_tag_2"]) {
              
              if([arg isEqualToString:@"on"]) {
                  [LocalizeHelper saveToUserDefaults:@"cell_tag_2" obj:@"on"];
                 [self hide_state_bar];
              }
              else{
                  
                  [LocalizeHelper saveToUserDefaults:@"cell_tag_2" obj:@"off"];
                [self show_state_bar];
                
                  
              }
              
              
              if([arg isEqualToString:@"hide_state_bar"]) {
                  [LocalizeHelper saveToUserDefaults:@"cell_tag_2" obj:@"on"];
                  [self hide_state_bar];
                  
              }
              
              if([arg isEqualToString:@"show_state_bar"]) {
                  [LocalizeHelper saveToUserDefaults:@"cell_tag_2" obj:@"off"];
                  [self show_state_bar];
                
                  
              }
              
          }
          
          
          if([event isEqualToString:@"cell_tag_5"]) {
              
              if([arg isEqualToString:@"on"]) {
                  [LocalizeHelper saveToUserDefaults:@"cell_tag_5" obj:@"on"];
              }
              else{
                  
                  [LocalizeHelper saveToUserDefaults:@"cell_tag_5" obj:@"off"];
              }
      
              
          }
          
          if([event isEqualToString:@"cell_tag_6"]) {
              
              if([arg isEqualToString:@"on"]) {
                  [LocalizeHelper saveToUserDefaults:@"cell_tag_6" obj:@"on"];
                
              }
              else{
                  
                  [LocalizeHelper saveToUserDefaults:@"cell_tag_6" obj:@"off"];
                 
              }
      
              
          }
          
          
          if([event isEqualToString:@"cell_tag_7"]) {
              
              if([arg isEqualToString:@"on"]) {
                  [LocalizeHelper saveToUserDefaults:@"cell_tag_7" obj:@"on"];
                 
              }
              else{
                  
                  [LocalizeHelper saveToUserDefaults:@"cell_tag_7" obj:@"off"];
                  
              }
      
              
          }
          
          
          
          if([event isEqualToString:@"cell_tag_8"]) {
              
              if([arg isEqualToString:@"on"]) {
                  [LocalizeHelper saveToUserDefaults:@"cell_tag_8" obj:@"on"];
                 
              }
              else{
                  
                  [LocalizeHelper saveToUserDefaults:@"cell_tag_8" obj:@"off"];
                  
              }
      
              
          }
          
          
          if([event isEqualToString:@"cell_tag_9"]) {
              
              if([arg isEqualToString:@"on"]) {
                  [LocalizeHelper saveToUserDefaults:@"cell_tag_9" obj:@"on"];
                  
              }
              else{
                  
                  [LocalizeHelper saveToUserDefaults:@"cell_tag_9" obj:@"off"];
                  
              }
      
              
          }
          
          
          if([event isEqualToString:@"cell_tag_10"]) {
              
              if([arg isEqualToString:@"on"]) {
                  [LocalizeHelper saveToUserDefaults:@"cell_tag_10" obj:@"on"];
                  
              }
              else{
                  
                  [LocalizeHelper saveToUserDefaults:@"cell_tag_10" obj:@"off"];
                
              }
      
              
          }
          
          
          
          
          
          if([event isEqualToString:@"cell_tag_11"]) {
              
              if([arg isEqualToString:@"on"]) {
                  [LocalizeHelper saveToUserDefaults:@"cell_tag_11" obj:@"on"];
                 
              }
              else{
                  
                  [LocalizeHelper saveToUserDefaults:@"cell_tag_11" obj:@"off"];
                 
              }
      
              
          }
          
          
          if([event isEqualToString:@"hide_menu"]){
              
              [self touchesBegan];
          }
          
          if([event isEqualToString:@"show_snipt_section"]){
              
              [self show_snipt_section];
          }
          
          
          if([event isEqualToString:@"set_image_booked"]){
              
              if([arg isEqualToString:@"on"]){
              
              
                  favImage = [UIImage imageNamed:@"img/fav_yellow.png"];
                  [favButton_footer setImage:favImage forState:UIControlStateNormal];
                  [favButton_footer setTintColor:[UIColor yellowColor]];
                  
              }
              else{
                  
                  favImage = [UIImage imageNamed:@"img/fav.png"];
                  [favButton_footer setImage:[favImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
             
                  NSString *cell_tag = [[NSUserDefaults standardUserDefaults]
                      stringForKey:@"cell_tag_1"];
                  
                  if(cell_tag==NULL || [cell_tag isEqual:@"off"]){
                      [favButton_footer setTintColor:[UIColor blackColor]];
                      
                  }
                  else{
                      [favButton_footer setTintColor:[UIColor whiteColor]];
                      
                  }
                  
              }

              
          }
          
          
          if([event isEqualToString:@"hide_snipt_section"]){
              
              [self hide_snipt_section];
          }
          if([event isEqualToString:@"go_port"]){
              
              Intro *intro = [[Intro alloc] init];
              [intro showIntroWithCrossDissolve];
              intro.show_sett= true;
              [LocalizeHelper go_to_vc:intro];
              
          }
          
          if([event isEqualToString:@"go_intru"]){
              
              Intro *intro = [[Intro alloc] init];
              [intro showIntroWithCrossDissolve];
              intro.show_intro= true;
              [LocalizeHelper go_to_vc:intro];
              
          }
          
          if([event isEqualToString:@"NSURLConnection"]){
              
              NSLog(@"jjjjjjj %@",arg);
              
              NSURL *ns=[NSURL URLWithString:arg];
              
              NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:ns];
              [request setHTTPMethod:@"HEAD"];
              NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
              
          }
          
          
          
          if([event isEqualToString:@"print_done"]){
              
          
          }
          
          
          
      }
   }
    
    
}


- (void)changeValue:(NSNotification *)notify
{
//  NSString *selItem = [[notify userInfo] valueForKey:@"item"];
   // NSLog(@"%@",selItem);
    
    NSDictionary* userInfo = notify.userInfo;
    UITableViewCell *cell = (UITableViewCell*)userInfo[@"cell"];
    
  //  NSIndexPath *indexPath = [NSIndexPath indexPathForRow:2 inSection:0];
    
   // UITableViewCell *cell = (UITableViewCell *)[(UITableView *)self.view cellForRowAtIndexPath:0];
    
   
    
  //  [cell cellForRowAtIndexPath:nowIndex]
    
    if(cell.tag == 0){
       // [self printWebView];
        //
        
        [self.webView evaluateJavaScript:@"print_all();" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
           
        }];
        
        [self touchesBegan];
    }
    if(cell.tag == 1){
        
        
        
        NSString *cell_tag = [[NSUserDefaults standardUserDefaults]
            stringForKey:@"cell_tag_1"];
        
        if(cell_tag==NULL || [cell_tag isEqual:@"off"]){
            
            //[LocalizeHelper saveToUserDefaults:@"on" keys:@"cell_tag_1"];
            cell.textLabel.text = LocalizedString(@"NDmode_on");

        }
        else{
           
           // [LocalizeHelper saveToUserDefaults:@"off" keys:@"cell_tag_1"];
            cell.textLabel.text = LocalizedString(@"NDmode_off");
        }
        
        
        [self.webView evaluateJavaScript:@"toggleNDmode();" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
           
        }];
        
        [self touchesBegan];
    }
    
    
    if(cell.tag == 2){
        
        NSString *cell_tag = [[NSUserDefaults standardUserDefaults]
            stringForKey:@"cell_tag_2"];
        
        if(cell_tag==NULL || [cell_tag isEqual:@"off"]){
            
            //[LocalizeHelper saveToUserDefaults:@"on" keys:@"cell_tag_1"];
            cell.textLabel.text = LocalizedString(@"full_screen_on");

        }
        else{
           
           // [LocalizeHelper saveToUserDefaults:@"off" keys:@"cell_tag_1"];
            cell.textLabel.text = LocalizedString(@"full_screen_off");
        }
        
        
        [self.webView evaluateJavaScript:@"full_screen();" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
           
        }];
        
        [self touchesBegan];
    }
    
    if(cell.tag == 3){
    
    
        [self.webView evaluateJavaScript:@"Remove_highlighting();" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
           
        }];
        
        [self touchesBegan];
    }
    
    
    if(cell.tag == 4){
    
    
        [self.webView evaluateJavaScript:@"Re_highlighting();" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
           
        }];
        
       
        [self touchesBegan];
    }
    
    
    if(cell.tag == 5){
    
        NSString *cell_tag = [[NSUserDefaults standardUserDefaults]
            stringForKey:@"cell_tag_5"];
        
        if(cell_tag==NULL || [cell_tag isEqual:@"off"]){
            
            //[LocalizeHelper saveToUserDefaults:@"on" keys:@"cell_tag_1"];
            cell.textLabel.text = LocalizedString(@"video_on");

        }
        else{
           
           // [LocalizeHelper saveToUserDefaults:@"off" keys:@"cell_tag_1"];
            cell.textLabel.text = LocalizedString(@"video_off");
        }
        
        
        [self.webView evaluateJavaScript:@"remove_vid_source_link();" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
           
        }];
        
       
        [self touchesBegan];
    }
    
    
    
    if(cell.tag == 6){
    
        NSString *cell_tag = [[NSUserDefaults standardUserDefaults]
            stringForKey:@"cell_tag_6"];
        
        if(cell_tag==NULL || [cell_tag isEqual:@"off"]){
            
            //[LocalizeHelper saveToUserDefaults:@"on" keys:@"cell_tag_1"];
            cell.textLabel.text = LocalizedString(@"Topic_on");

        }
        else{
           
           // [LocalizeHelper saveToUserDefaults:@"off" keys:@"cell_tag_1"];
            cell.textLabel.text = LocalizedString(@"Topic_off");
        }
        
        
        [self.webView evaluateJavaScript:@"remove_thread_source_link();" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
           
        }];
        
       
        [self touchesBegan];
    }
    
    
    if(cell.tag == 7){
    
        NSString *cell_tag = [[NSUserDefaults standardUserDefaults]
            stringForKey:@"cell_tag_7"];
        
        if(cell_tag==NULL || [cell_tag isEqual:@"off"]){
            
            //[LocalizeHelper saveToUserDefaults:@"on" keys:@"cell_tag_1"];
            cell.textLabel.text = LocalizedString(@"Statement_on");

        }
        else{
           
           // [LocalizeHelper saveToUserDefaults:@"off" keys:@"cell_tag_1"];
            cell.textLabel.text = LocalizedString(@"Statement_off");
        }
        
        
        [self.webView evaluateJavaScript:@"remove_links_to_the_source_of_the_statement();" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
           
        }];
        
       
        [self touchesBegan];
    }
    
    
    if(cell.tag == 8){
    
        NSString *cell_tag = [[NSUserDefaults standardUserDefaults]
            stringForKey:@"cell_tag_8"];
        
        if(cell_tag==NULL || [cell_tag isEqual:@"off"]){
            
            //[LocalizeHelper saveToUserDefaults:@"on" keys:@"cell_tag_1"];
            cell.textLabel.text = LocalizedString(@"translations_on");

        }
        else{
           
           // [LocalizeHelper saveToUserDefaults:@"off" keys:@"cell_tag_1"];
            cell.textLabel.text = LocalizedString(@"translations_off");
        }
        
        
        [self.webView evaluateJavaScript:@"remove_links_translations();" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
           
        }];
        
       
        [self touchesBegan];
    }
    
    
    if(cell.tag == 9){
    
        NSString *cell_tag = [[NSUserDefaults standardUserDefaults]
            stringForKey:@"cell_tag_9"];
        
        if(cell_tag==NULL || [cell_tag isEqual:@"off"]){
            
            //[LocalizeHelper saveToUserDefaults:@"on" keys:@"cell_tag_1"];
            cell.textLabel.text = LocalizedString(@"formatting_on");

        }
        else{
           
           // [LocalizeHelper saveToUserDefaults:@"off" keys:@"cell_tag_1"];
            cell.textLabel.text = LocalizedString(@"formatting_off");
        }
        
        
        [self.webView evaluateJavaScript:@"remove_format();" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
           
        }];
        
       
        [self touchesBegan];
    }
    
    
    if(cell.tag == 10){
    
        NSString *cell_tag = [[NSUserDefaults standardUserDefaults]
            stringForKey:@"cell_tag_10"];
        
        if(cell_tag==NULL || [cell_tag isEqual:@"off"]){
            
            //[LocalizeHelper saveToUserDefaults:@"on" keys:@"cell_tag_1"];
            cell.textLabel.text = LocalizedString(@"diacritics_on");

        }
        else{
           
           // [LocalizeHelper saveToUserDefaults:@"off" keys:@"cell_tag_1"];
            cell.textLabel.text = LocalizedString(@"diacritics_off");
        }
        
        
        [self.webView evaluateJavaScript:@"Remove_diacritics();" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
           
        }];
        
       
        [self touchesBegan];
    }
    
    
    if(cell.tag == 11){
    
        NSString *cell_tag = [[NSUserDefaults standardUserDefaults]
            stringForKey:@"cell_tag_11"];
        
        if(cell_tag==NULL || [cell_tag isEqual:@"off"]){
            
            //[LocalizeHelper saveToUserDefaults:@"on" keys:@"cell_tag_1"];
            cell.textLabel.text = LocalizedString(@"signature_on");

        }
        else{
           
           // [LocalizeHelper saveToUserDefaults:@"off" keys:@"cell_tag_1"];
            cell.textLabel.text = LocalizedString(@"signature_off");
        }
        
        
        [self.webView evaluateJavaScript:@"Show_or_Hide_random_signature();" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
           
        }];
        
       
        [self touchesBegan];
    }
    
    
    if(cell.tag == 12){
       // [self printWebView];
        //
        
        [self.webView evaluateJavaScript:@"zoomer_text('zoon_in');" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
           
        }];
        
       // [self touchesBegan];
    }
    
    if(cell.tag == 13){
       // [self printWebView];
        //
        
        [self.webView evaluateJavaScript:@"zoomer_text('zoon_out');" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
           
        }];
        
        //[self touchesBegan];
    }
    
    
    if(cell.tag == 14){
       // [self printWebView];
        //
        
        [self.webView evaluateJavaScript:@"zoomer_text('zoon_RESET');" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
           
        }];
        
        //[self touchesBegan];
    }
    
    
    
    
    NSLog(@"%ld",(long)cell.tag);
    
}


/*
- (BOOL)prefersStatusBarHidden {
    return statusBarHidden;
}*/

-(void)statusBarShouldHide:(bool)hide{

    statusBarHidden = hide;
   
    [self setNeedsStatusBarAppearanceUpdate];
    
    
}



- (BOOL)prefersStatusBarHidden
{

    
    
    
    return statusBarHidden;
}


- (BOOL)isLandscape
{
    if (@available(iOS 13.0, *)) {
        UIWindow *firstWindow = [[[UIApplication sharedApplication] windows] firstObject];
        if (firstWindow == nil) { return NO; }

        UIWindowScene *windowScene = firstWindow.windowScene;
        if (windowScene == nil){ return NO; }

        return UIInterfaceOrientationIsLandscape(windowScene.interfaceOrientation);
    } else {
        return (UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication.statusBarOrientation));
    }
}




#pragma mark -
    #pragma mark NSURLConnection Delegate Methods
    - (void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse*)response {
         NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
        NSInteger responseStatusCode = [httpResponse statusCode];
        NSLog(@"jjjjjjjjj  %ld",(long)responseStatusCode);
        
        if(responseStatusCode == 404 || responseStatusCode == 0){
             
           
           if([[LocalizeHelper readUserDefaults:@"server_error"] isEqual:@"true"]){
                
                [LocalizeHelper load_webview:self.webView name:@"index" type:@"local" port:[LocalizeHelper readUserDefaults:@"port_number"]];
                
            }
            else{
                [LocalizeHelper load_webview:self.webView name:@"index.html" type:@"server" port:[LocalizeHelper readUserDefaults:@"port_number"]];
                
            }
            
        }
        
    }



#pragma mark - UIWebViewDelegate Methods
/// 新しいウィンドウ、フレームを指定してコンテンツを開く時
- (WKWebView *)webView:(WKWebView *)webView
createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration
   forNavigationAction:(WKNavigationAction *)navigationAction
        windowFeatures:(WKWindowFeatures *)windowFeatures {
    
    if (navigationAction.targetFrame != nil &&
        !navigationAction.targetFrame.mainFrame) {
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL: [[NSURL alloc] initWithString: navigationAction.request.URL.absoluteString]];
        [webView loadRequest: request];
        
        return nil;
    }
    return nil;
}


/// 指定された要素がプレビューを表示する許可
- (BOOL)webView:(WKWebView *)webView shouldPreviewElement:(WKPreviewElementInfo *)elementInfo {
    return YES;
}

#pragma mark - WKNavigationDelegate Methods
/// ページ遷移前にアクセスを許可
/*- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    NSLog(@"アクセスURL：%@", navigationAction.request.URL.absoluteString);
    
    
    NSURL *ns=[NSURL URLWithString:navigationAction.request.URL.absoluteString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:ns];
    [request setHTTPMethod:@"HEAD"];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    NSURL *url = navigationAction.request.URL;
    NSString *host = url.host;
    
    if ((![host isEqual: @""] || !(host == nil) || !(host == (id)[NSNull null])) &&
               !([host hasPrefix:@"svasilevkin.wordpress.com"]) &&
               
[UIApplication.sharedApplication canOpenURL:url]) {
       
        
    
            if (@available(iOS 10.0, *)) {
                [UIApplication.sharedApplication openURL:url options:@{} completionHandler:nil];
            } else {
                [[UIApplication sharedApplication] openURL:url];
            }

        NSLog(@"%@", url);
        NSLog(@"Redirected to browser.");
        decisionHandler(WKNavigationActionPolicyCancel);
    }else{
        
        // どのページも許可
        decisionHandler(WKNavigationActionPolicyAllow);
    }
    
    
    
    
}*/

// 読み込み開始
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"読み込み開始");
}



// 読み込み失敗
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"読み込み失敗");
}

// 接続失敗
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"エラーコード：%ld", (long)error.code);
    
    if([[LocalizeHelper readUserDefaults:@"server_error"] isEqual:@"true"]){
        
        [LocalizeHelper load_webview:self.webView name:@"index" type:@"local" port:[LocalizeHelper readUserDefaults:@"port_number"]];
        
    }
    else{
        [LocalizeHelper load_webview:self.webView name:@"index.html" type:@"server" port:[LocalizeHelper readUserDefaults:@"port_number"]];
        
    }
    
}


@end


