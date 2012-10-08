//
//  ADController.m
//  AddAD
//
//  Created by Ibokan on 12-8-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ADController.h"

@implementation ADController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)loadView{
    self.view=[[UIView alloc]initWithFrame:CGRectMake(0, 20, 320, 460)];
    self.view.backgroundColor=[UIColor whiteColor];
    
    [NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(addZero) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(addOne) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(addTwo) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(addAD) userInfo:nil repeats:NO];
    
    
    
}
-(void)addZero{
    UILabel *label0=[[UILabel alloc]initWithFrame:CGRectMake(40, 50, 240, 350)];
    label0.text=@"0";
    label0.font=[UIFont fontWithName:@"Helvetica" size:150];
    label0.tag=0;
    label0.textAlignment=UITextAlignmentCenter;
    [self.view addSubview:label0];
}
-(void)addOne{
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(40, 50, 240, 350)];
    label1.text=@"1";
    label1.font=[UIFont fontWithName:@"Helvetica" size:150];
    label1.tag=1;
    label1.textAlignment=UITextAlignmentCenter;
    [self.view addSubview:label1];
}
-(void)addTwo{
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(40, 50, 240, 350)];
    label2.text=@"2";
    label2.font=[UIFont fontWithName:@"Helvetica" size:150];
    label2.tag=2;
    label2.textAlignment=UITextAlignmentCenter;
    [self.view addSubview:label2];
}
-(void)addAD{
    
    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(40, 50, 240, 350)];
    view1.tag=3;
    view1.backgroundColor=[UIColor redColor];
    [self.view addSubview:view1];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(30, 100, 200, 50)];
    label.backgroundColor=[UIColor greenColor];
    label.text=@"加多宝";
    label.textAlignment=UITextAlignmentCenter;
    [view1 addSubview:label];
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(90, 220, 50, 50)];
    [button setTitle:@"关闭" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [view1 addSubview:button];
}
-(void)close{
    
    [[self.view viewWithTag:3] removeFromSuperview];
    [[self.view viewWithTag:0] removeFromSuperview];
    [[self.view viewWithTag:1] removeFromSuperview];
    [[self.view viewWithTag:2] removeFromSuperview];
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
