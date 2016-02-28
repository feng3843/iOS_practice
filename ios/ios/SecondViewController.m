//
//  SecondViewController.m
//  ios
//
//  Created by ivy.sun on 16/2/26.
//  Copyright © 2016年 zxh. All rights reserved.
//

#import "SecondViewController.h"
#import "UIImageView+WebCache.h"
#import "NSString+URL.h"
#import "NSString+MD5.h"
#import "AFNetworking.h"


@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *imgURLLabel;
- (IBAction)change2image:(id)sender;
- (IBAction)change1image:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
- (IBAction)clearmomery:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *querytext;
- (IBAction)query:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *queryResultLabel;
- (IBAction)queryFromZHtoEN:(id)sender;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)change2image:(id)sender {
    NSString *str = @"http://img0.ph.126.net/uj1RFk7mKbF9Ve-uAV5SAw==/2673167853921119283.gif";
//    NSString *ecodestr = [str URLEncodedString];
    NSURL *url = [NSURL URLWithString:str];
//    NSLog(@"%@",url);
    [self.imageV  sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"1"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.imgURLLabel.text = url.absoluteString;
//        NSLog(@"%@",image);
    }];
}
- (IBAction)change1image:(id)sender {
    NSString *str = @"http://www.sznews.com/humor/attachement/gif/site3/20140415/4487fcd7fc6614b6bfaa17.gif";
    //    NSString *ecodestr = [str URLEncodedString];
    NSURL *url = [NSURL URLWithString:str];
    //    NSLog(@"%@",url);
    [self.imageV  sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"1"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.imgURLLabel.text = url.absoluteString;
        //        NSLog(@"%@",image);
    }];

}

- (IBAction)clearmomery:(id)sender {
    [[SDImageCache sharedImageCache]clearDisk];
    
    [[SDImageCache sharedImageCache]clearMemory];
}


//APP ID: 20160226000013636
//密钥: 7P2M1NUt0F4vTI42d72k
//创建时间: 2016-02-26 14:22:16
//
//网站或应用名称: iOS_practice
//网站或应用简介:一
//服务器地址:
- (IBAction)query:(id)sender {
    NSString *str =  self.querytext.text;
        if (str==nil || [str isEqualToString:@"" ] ) {
        self.queryResultLabel.text = @"请输入要翻译的字段！";
        return;
    }
    NSString *from = @"en";
    NSString *to = @"zh";
 
    
    


    [self queryWITHstr:str from:from  to:to];
}

-(void)queryWITHstr:(NSString *)str from:(NSString *)from  to:(NSString *)to
{
    NSString *appid = @"20160226000013636";
    NSString *key = @"7P2M1NUt0F4vTI42d72k";
    NSString *salt =@"123456";
    
    NSString *encodestr = [str URLEncodedString];
    
//    拼接appid=2015063000000001+q=apple+salt=1435660288+密钥=12345678
    
    NSString *queryL = [NSString stringWithFormat:@"%@%@%@%@",appid,str,salt,key];
//    NSString *utf8queryL = [queryL stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

    NSString *sign = [queryL MD5Digest];
   
    NSLog(@"\n\n%@----->%@",queryL,sign);
    
//    http://api.fanyi.baidu.com/api/trans/vip/translate?q=apple&from=en&to=zh&appid=2015063000000001&salt=1435660288&sign=f89f9594663708c1605f3d736d01d2d4
//    ios[5251:195507] ----
//    %E6%AD%A3%E5%9C%A8%E8%81%94
//    9883c44e59bbf239c13a5f284d2113f8----
    
//    应该对 appid+q+salt+密钥 拼接成的字符串做MD5得到32位小写的sign。确保要翻译的文本q为UTF-8编码。
//    注意在生成签名拼接 appid+q+salt+密钥 字符串时，q不需要做URL encode，在生成签名之后，发送HTTP请求之前才需要对要发送的待翻译文本字段q做URL encode。
   
//    NSMutableDictionary *parms = [NSMutableDictionary dictionary];
//    parms[@"q"]= encodeStr;
//    parms[@"from"]= from;
//    parms[@"to"]= to;
//    parms[@"appid"]= appid;
//    parms[@"salt"]= salt;
//    parms[@"sign"]= sign;
    
    
    NSDictionary *parms2 = @{
                             @"q":encodestr,
                             @"from":from,
                             @"to":to,
                             @"appid":appid,
                             @"salt":salt,
                             @"sign":sign
                             };
    NSLog(@"----%@--11111--%@----",parms2[@"q"],parms2[@"sign"]);
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    NSURL *baseurl = [NSURL URLWithString:@"http://api.fanyi.baidu.com/api/trans/vip/translate"];
    [manger POST:baseurl.absoluteString parameters:parms2 progress:^(NSProgress * _Nonnull uploadProgress) {
//        NSLog(@">>>>%@",uploadProgress);
        if (uploadProgress.fractionCompleted < 1) {
            
            self.queryResultLabel.text = @"正在联网翻译，大人请稍后...";
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
        NSArray *arry =  responseObject[@"trans_result"];
        NSDictionary *dict2 = arry[0];
        
        NSString *src = dict2[@"src"];
        NSString *dst = dict2[@"dst"];
        self.queryResultLabel.text = [NSString stringWithFormat:@"%@-->：%@",src,dst];
        
        
        NSLog(@"-----\n\n%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    

    
    
}


- (IBAction)queryFromZHtoEN:(id)sender {
    
    NSString *str =  self.querytext.text;
//    NSString *utfStr = [NSString stringWithCString:[str UTF8String] encoding:NSUTF8StringEncoding];
    if (str==nil || [str isEqualToString:@"" ] ) {
        self.queryResultLabel.text = @"请输入要翻译的字段！";
        return;
    }
    NSString *from = @"auto";
    NSString *to = @"kor";
    [self queryWITHstr:str from:from  to:to];
//    NSString *str =  self.querytext.text;
//    if (str==nil || [str isEqualToString:@"" ] ) {
//        self.queryResultLabel.text = @"请输入要翻译的字段！";
//        return;
//    }
//    NSString *appid = @"20160226000013636";
//    NSString *key = @"7P2M1NUt0F4vTI42d72k";
//    NSString *salt =@"123456";
//    NSString *encodeStr = [str URLEncodedString];
//    
//    //    拼接appid=2015063000000001+q=apple+salt=1435660288+密钥=12345678
//    
//    NSString *queryL = [NSString stringWithFormat:@"%@%@%@%@",appid,str,salt,key];
//    NSString *sign = [queryL MD5Digest];
//    NSMutableDictionary *parms = [NSMutableDictionary dictionary];
//    parms[@"q"]= encodeStr;
//    parms[@"from"]= @"en";
//    parms[@"to"]= @"zh";
//    parms[@"appid"]= appid;
//    parms[@"salt"]= salt;
//    parms[@"sign"]= sign;
//    NSURL *baseurl = [NSURL URLWithString:@"http://api.fanyi.baidu.com/api/trans/vip/translate"];
//    NSURLSession *session  = [NSURLSession sharedSession];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:baseurl];
//    request.HTTPMethod = @"POST";
//    NSData *data = [NSJSONSerialization dataWithJSONObject:parms options:0 error:nil];
//    [request setHTTPBody:data];
//    NSURLSessionDataTask *task =[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            id dict =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//            NSLog(@"%@<><><>%@",data,response);
////
//            NSLog(@"%@",dict);
//
//        });
//            }];
//    
//    
//    
//    
//         [task resume];
//    
//    
//    
////    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
////    [manger POST:baseurl.absoluteString parameters:parms progress:^(NSProgress * _Nonnull uploadProgress) {
////        self.queryResultLabel.text = @"正在联网翻译，大人请稍后...";
////    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
////        //        NSDictionary *dict =  [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
////        NSArray *arry =  responseObject[@"trans_result"];
////        NSDictionary *dict2 = arry[0];
////        
////        NSString *src = dict2[@"src"];
////        NSString *dst = dict2[@"dst"];
////        self.queryResultLabel.text = [NSString stringWithFormat:@"%@-->：%@",src,dst];
////        
////        
////        NSLog(@"-----\n\n%@",responseObject);
////    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
////        
////    }];
//    
    

}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
