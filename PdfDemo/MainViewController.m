//
//  ViewController.m
//  PdfDemo
//
//  Created by 满 陈 on 2017/5/25.
//  Copyright © 2017年 满 陈. All rights reserved.
//

#import "MainViewController.h"
#import "QLViewController.h"
#import "WBViewController.h"

#import <Quicklook/Quicklook.h>
//#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"

@interface MainViewController ()

@property (nonatomic,copy) NSString *pathOfPdf;
@property BOOL isWriten;
@property (nonatomic,strong) QLPreviewController *previewController;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)WebViewAction:(id)sender {
    
    [self.navigationController pushViewController:[WBViewController new] animated:YES];
}

- (IBAction)QucikLookAction:(id)sender {
    
    [self.navigationController pushViewController:[QLViewController new] animated:YES];
    
    //[self presentViewController:[QLViewController new] animated:YES completion:nil];
    
//    [self DownloadPdfAndSave];
//    [self presentPdfVC];
}

//- (void)presentPdfVC{
//    
//    //    // Do any additional setup after loading the view from its nib.
//    //
//    self.previewController = [[QLPreviewController alloc] init];
//    /** 这里我们要使用QLPreviewController的代理方法 */
//    self.previewController.dataSource = self;
//    self.previewController.delegate = self;
//    self.previewController.view.frame = self.view.frame;
//    /** 这里需要注意的是，我们不使用Controller，而是使用Controller的View，为的是避免QLController在Navgation等Controller中带来的坑 */
//    [self presentViewController:self.previewController animated:YES completion:nil];
//    //[self.navigationController pushViewController:previewController animated:YES];
//}
//
//
//#pragma mark - QuickLook代理
//-(NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController*)previewController {
//    return 1;
//}
//
//-(id)previewController:(QLPreviewController*)previewController previewItemAtIndex:(NSInteger)idx {
//    
////    NSURL *fileURL = nil;
////    fileURL = [NSURL fileURLWithPath:@"/Users/ChenMan/Documents/lmccfca.pdf"];
////    return fileURL;
//    
//    NSURL *URL = nil;
//    if (self.isWriten) {
//         URL = [NSURL fileURLWithPath:[self pathOfPdf]];
//    }
//    return URL;
//}
//
//#pragma mark - 数据保存操作
//
//-(NSString *)pathOfPdf{
//    
//    return [NSTemporaryDirectory() stringByAppendingPathComponent:@"temp.pdf"];
//}
//
//- (void)DownloadPdfAndSave{
//    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager alloc];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/pdf"];
//    __weak __typeof__(self) weakSelf = self;
//    [manager GET:@"http://10.20.201.25/liaomengcheng_cfca_hetong.pdf" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        __strong __typeof__(weakSelf) strongSelf = weakSelf;
//        strongSelf.isWriten = [responseObject writeToFile:[self pathOfPdf] atomically:YES encoding:NSUnicodeStringEncoding error:NULL];
//        [strongSelf.previewController reloadData];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",error.userInfo);
//    }];
//}



@end
