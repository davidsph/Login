//
//  sdsViewController.m
//  Login
//
//  Created by david on 12-10-8.
//  Copyright (c) 2012年 davidsph. All rights reserved.
//

#import "sdsViewController.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
@implementation sdsViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)LoginBn:(id)sender {

    NSLog(@"function %s line=%d",__FUNCTION__,__LINE__);
    NSURL *url=[NSURL URLWithString:@"http://wapinterface.zhaopin.com/iphone/myzhaopin/loginmgr/login.aspx?loginname=daviddjy@163.com&password=abc123589&t=1349666653.678475&e=E51A68E3777E8AD64837247800F77ABF&f=p&d=61605AAA-E689-5D79-BCE2-C2AADB86127F"];
    
    ASIFormDataRequest *newRequest=[ASIFormDataRequest requestWithURL:url];
        
    [newRequest startSynchronous];
    NSError *error=[newRequest error];
        
        
    if (!error) {
        NSLog(@"w无错误");
        NSString *response=[newRequest responseString];
        NSLog(@"%@",response);
        
        NSData *data=[newRequest responseData];
        
        NSString *dataString=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"收到的数据为：%@",dataString);
    }
    




}
@end
