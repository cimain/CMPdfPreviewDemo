//
//  WBViewController.m
//  PdfDemo
//
//  Created by 满 陈 on 2017/5/26.
//  Copyright © 2017年 满 陈. All rights reserved.
//

#import "WBViewController.h"

@interface WBViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self openPdfWithUrl];
    // Do any additional setup after loading the view from its nib.
}

- (void)openPdfWithUrl{
    
    NSURL *fileURL = nil;
    self.webView.scalesPageToFit = YES;
//    fileURL = [NSURL fileURLWithPath:@"/Users/ChenMan/Documents/lmccfca.pdf"];
    fileURL = [NSURL URLWithString:@"https://github.com/cimain/iOS_Learning_PDF/raw/master/testPreview.pdf"];
//    fileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"test1" ofType:@"pdf"]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:fileURL];
    [self.webView loadRequest:request];
    [self.webView setScalesPageToFit:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
