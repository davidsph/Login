//
//  CycleScrollView.h
//  CycleScrollView
//
//  Created by Ibokan on 12-9-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    CycleDirectionPortait,
    cycleDirectionLandscape
}CycleDirection;
@protocol CycleScrollViewDelegate;
@interface CycleScrollView : UIView<UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    UIImageView *curImageView;
    
    int totalPage;
    int curPage;
    CGRect scrollFrame;
    
    CycleDirection scrollDirection;
    NSArray *imagesArray;
    NSMutableArray *curImages;
    id delgate;
}
@property(nonatomic,assign)id delegate;
-(int)validPageValue:(NSInteger)value;
-(id)initWithFrame:(CGRect)frame cycleDirection:(CycleDirection)direction pictures:(NSArray*)pictureArray;
-(NSArray *)getDisplayImagesWithCurpage:(int)page;
@end
@protocol CycleScrollViewDelegate <NSObject>

-(void)cycleScrollViewDelegate:(CycleScrollView *) cycleScrollView didSelectImageView:(int) index;
-(void)cycleScrollViewDelegate:(CycleScrollView *)cycleScrollView didScrollImageView:(int)index;
@end