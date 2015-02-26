//
//  SecondLoginWebViewController.m
//  fluxPay
//
//  Created by Rameez Remsudeen  on 2/27/15.
//  Copyright (c) 2015 Rameez Remsudeen. All rights reserved.
//

#import "SecondLoginWebViewController.h"

@interface SecondLoginWebViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) NSURLRequest * oldRequest;
@end

@implementation SecondLoginWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.webView.delegate = self;
    
    [self.webView setScalesPageToFit:YES];
    
    
    NSURL * url = [[NSURL alloc] initWithString:@"http://hax.sg:8000/bank/1"];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:4.0]];
    
    
}

- (NSURLRequest *)connection: (NSURLConnection *)connection
             willSendRequest: (NSURLRequest *)request
            redirectResponse: (NSURLResponse *)redirectResponse;
{
    if (redirectResponse) {
        // we don't use the new request built for us, except for the URL
        NSURL *newURL = [request URL];
        // Previously, store the original request in _originalRequest.
        // We rely on that here!
        NSMutableURLRequest *newRequest = [_oldRequest mutableCopy];
        [newRequest setURL: newURL];
        return newRequest;
    } else {
        return request;
    }
}

- (void)updateAddress:(NSURLRequest*)request
{
    NSURL* url = [request mainDocumentURL];
    NSString* absoluteString = [url absoluteString];
//    self.addressField.text = absoluteString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma Web View Delegate Methods

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"Heyy");
    
    NSLog(@"xyy url is %@", [request mainDocumentURL]);

    [self updateAddress:request];
    
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    NSString * currentURL = webView.request.URL.absoluteString;
    
    if ([currentURL containsString:@"success"]) {
        
    
    NSLog(@"sycess url is %@", currentURL);
    }
    
    else
        
    {
        NSLog(@"Fail");
        NSLog(@"%@ hello", currentURL);
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
