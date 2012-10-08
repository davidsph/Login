//
//  CycleScrollView.m
//  CycleScrollView
//
//  Created by Ibokan on 12-9-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CycleScrollView.h"

@implementation CycleScrollView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}
-(id)initWithFrame:(CGRect)frame cycleDirection:(CycleDirection)direction pictures:(NSArray *)pictureArray{
    self=[super initWithFrame:frame];
    if (self) {
        scrollFrame=frame;
        scrollDirection=direction;
        totalPage=pictureArray.count;
        curPage=1;
        curImages=[[NSMutableArray alloc]init ];
        imagesArray=[[NSArray alloc]initWithArray:pictureArray];
        
        scrollView=[[UIScrollView alloc]initWithFrame:frame];
        scrollView.backgroundColor=[UIColor blackColor];
        scrollView.showsVerticalScrollIndicator=NO;
        scrollView.showsHorizontalScrollIndicator=NO;
        scrollView.pagingEnabled=YES;
        scrollView.delegate=self;
        [self addSubview:scrollView];
        
    }
    return self;
}
-(void)refreshScrollView{
    NSArray *subViews=[scrollView subviews];
    if ([subViews count]!=0) {
        [subViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    [self getDisplayImagesWithCurpage:curPage];
    for (int i=0; i<3; i++) {
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:scrollFrame];
        imageView.image=[curImages objectAtIndex:i];
        
        UITapGestureRecognizer *singleTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
        imageView.frame=CGRectOffset(imageView.frame, scrollFrame.size.width*i, 0);
        [imageView addGestureRecognizer:singleTap];
        [singleTap release];
        [scrollView addSubview:imageView];
        [scrollView setContentOffset:CGPointMake(scrollFrame.size.width, 0)];
    }
}
-(void)handleTap:(UIGestureRecognizer *)tap{
    NSLog(@"null");
}
-(NSArray *)getDisplayImagesWithCurpage:(int)page{
    int pre=[self validPageValue:curPage-1];
    int last=[self validPageValue:curPage+1];
    if ([curImages count]!=0) {
        [curImages removeAllObjects];
    }
    [curImages addObject:[imagesArray objectAtIndex:pre-1]];
    [curImages addObject:[imagesArray objectAtIndex:curPage-1]];
    [curImages addObject:[imagesArray objectAtIndex:last-1]];
    return curImages;
}
-(int)validPageValue:(NSInteger)value{
    if (value==0) {
        value=totalPage;
    }
    if (value==totalPage+1) {
        value=1;
    }
    return value;
}
-(void)scrollViewDidScroll:(UIScrollView *)aScrollView{
    int x=aScrollView.contentOffset.x;
    int y=aScrollView.contentOffset.y;
    NSLog(@"did x%d  y=%d",x,y);
    if (scrollDirection==cycleDirectionLandscape) {
        if (x>=(2*scrollFrame.size.width)) {
            curPage=[self validPageValue:curPage +1];
            [self refreshScrollView];
        }
        if (x<=0) {
            curPage = [self validPageValue:curPage-1];
            [self refreshScrollView];
        }
    }
    if ([delgate respondsToSelector:@selector(cycleScrollViewDelegate:didScrollImageView:)]) {
        [delgate cycleScrollViewDelegate:self didSelectImageView:curPage];
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)aScrollView{
    int x=aScrollView.contentOffset.x;
    int y=aScrollView.contentOffset.y;
    
    NSLog(@"--end x=%d y=%d",x,y);
    if (scrollDirection==cycleDirectionLandscape) {
        [scrollView setContentOffset:CGPointMake(scrollFrame.size.width,0)];
    }
}
-(void)dealloc{
    [imagesArray release];
    [curImages release];
    [super dealloc];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
