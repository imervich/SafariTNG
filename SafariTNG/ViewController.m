//
//  ViewController.m
//  SafariTNG
//
//  Created by Iván Mervich on 7/23/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate, UITextFieldDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *myWebView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.homepageUrlString = @"http://www.mobilemakers.co";
    [self loadUrlString:self.homepageUrlString];
}

- (void)loadUrlString:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.myWebView loadRequest:urlRequest];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"Loading...");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"Loaded");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self loadUrlString:textField.text];
    [textField resignFirstResponder];
    return YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    UIAlertView *alertView = [[UIAlertView alloc] init];
    alertView.title = @"ERROR";
    alertView.message = error.localizedDescription;
    alertView.delegate = self;
    [alertView addButtonWithTitle:@"That stinks"];
    [alertView addButtonWithTitle:@"Go home"];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [self loadUrlString:self.homepageUrlString];
    }
}

@end
