//
//  QLViewController.m
//  PdfDemo
//
//  Created by 满 陈 on 2017/5/25.
//  Copyright © 2017年 满 陈. All rights reserved.
//

#import "QLViewController.h"
#import <Quicklook/Quicklook.h>

#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"

//#import "AFHTTPRequestOperationManager.h"

@interface QLViewController ()<QLPreviewControllerDataSource,QLPreviewControllerDelegate>

/** QuickLook预览页面 */
@property(nonatomic,strong) QLPreviewController *previewController;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (nonatomic,assign) NSString *pathOfPdf;
@property BOOL isWriten;

@end

@implementation QLViewController
@synthesize previewController = _zzpreviewController;


- (void)viewDidLoad {
    [super viewDidLoad];
//  Do any additional setup after loading the view from its nib.
    [self DownloadPdfAndSave];
//    [self openPdfByAddingSubView];
}

- (void)openPdfByAddingSubView{
    
    self.previewController = [[QLPreviewController alloc] init];
    /** 这里我们要使用QLPreviewController的代理方法 */
    self.previewController.dataSource = self;
    self.previewController.delegate = self;
    self.previewController.view.frame = self.view.frame;
    /** 这里需要注意的是，我们不使用Controller，而是使用Controller的View，为的是避免QLController在Navgation等Controller中带来的坑 */
    [self.view1 addSubview:self.previewController.view];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.previewController.view.frame = CGRectMake(0,20.f + 44.f, self.view1.bounds.size.width, self.view1.bounds.size.height);
}

-(NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController*)previewController {
    return 1;
}

-(id)previewController:(QLPreviewController*)previewController previewItemAtIndex:(NSInteger)idx {
//    NSURL *fileURL = nil;
//    
//    //fileURL = [NSURL fileURLWithPath:@"/Users/ChenMan/Documents/lmccfca.pdf"];
//    
//    //fileURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"test1" ofType:@"pdf"]];
//    
//    fileURL = [NSURL fileURLWithPath: self.pathOfPdf];
//    return fileURL;
    
    NSURL *URL = nil;
    
    if (self.isWriten) {
        URL = [NSURL fileURLWithPath:[self pathOfPdf]];
    }
    
    return URL;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.previewController.view removeFromSuperview];
}

#pragma mark - 数据保存操作

-(NSString *)pathOfPdf{

    return [NSTemporaryDirectory() stringByAppendingPathComponent:@"temp.pdf"];
}

- (void)DownloadPdfAndSave{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/pdf",@"application/octet-stream",nil];
    __weak __typeof__(self) weakSelf = self;
    
    //临时配置，需要自己根据接口地址改动！！！！！！！！！！！！！！！！！！！！
//    self.urlStr = @"http://10.20.201.252/test3.pdf";
    self.urlStr = @"https://github.com/cimain/iOS_Learning_PDF/raw/master/testPreview.pdf";
    
    NSURLSessionDataTask *dataTask = [manager GET:_urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        __strong __typeof__(weakSelf) strongSelf = weakSelf;
        strongSelf.isWriten = [responseObject writeToFile:[self pathOfPdf] atomically:YES];
        [strongSelf openPdfByAddingSubView];
        //[strongSelf.previewController reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.userInfo);
    }];
    
    [dataTask resume];
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
