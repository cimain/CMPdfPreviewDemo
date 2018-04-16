# CMPdfPreviewDemo
CMPdfPreviewDemo


通常我们用到的pdf文档的加载方式有2种：

- UIWebView加载本地或者网络pdf文档
- QLPreviewController加载pdf文档

## 1.UIWebView加载本地或者网络pdf文档

UIWebView加载pdf文档比较简单，加载本地文档和网络文档用法几乎差不多。
浏览方式是上下拖动，支持放大缩小，以及选择copy等。

加载本地文档：
```
    //初始化myWebView
    UIWebView *myWebView = [[UIWebView alloc] init];
    myWebView.backgroundColor = [UIColor whiteColor];
    NSURL *filePath = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"myHome" ofType:@"pdf"]];
    NSURLRequest *request = [NSURLRequest requestWithURL: filePath];
    [myWebView loadRequest:request];
    //使文档的显示范围适合UIWebView的bounds
    [myWebView setScalesPageToFit:YES];
```
加载网络文档：
```
    //初始化myWebView
    UIWebView *myWebView = [[UIWebView alloc] init];
    myWebView.backgroundColor = [UIColor whiteColor];
    NSURL *filePath = [NSURL URLWithString:@"https://www.tutorialspoint.com/ios/ios_tutorial.pdf"];
    NSURLRequest *request = [NSURLRequest requestWithURL: filePath];
    [myWebView loadRequest:request];
    //使文档的显示范围适合UIWebView的bounds
    [myWebView setScalesPageToFit:YES];
```

## 2.QLPreviewController加载pdf文档

在iOS 4 SDK之后苹果退出了QLPreviewControllerAPI，组件允许用户浏览许多不同的文件类型，如XLS文件，Word文档文件，PDF文件等，但是使用此API之前用户必须导入QuickLook.framework框架，使用的QLPreviewController时，你必须实现此协议QLPreviewControllerDataSource的两个代理方法。
上下滑动支持单个文档的浏览，左右滑动支持不同文档间的切换，还支持苹果自带的分享打印等。
QLPreviewControllerDataSource的两个代理方法：
```
/*
 *所要加载pdf文档的个数
 */
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller;

/*
 * 返回每个index pdf文档所对应的文档路径
 */
- (id <QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index;
```
QLPreviewController加载pdf文档
```
//QLPreviewController初始化,需要导入QuickLook.framework
QLPreviewController *QLPVC = [[QLPreviewController alloc] init];
QLPVC.dataSource = self;
[self presentViewController:QLPVC animated:YES completion:nil];

#pragma mark QLPreviewControllerDataSource
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller{
    return 2;
}
- (id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index{
    NSArray *arr = @[FILE_PATH,FILE_PATH1];
    
    return [NSURL fileURLWithPath:arr[index]];
}

```

