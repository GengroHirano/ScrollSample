//
//  ViewController.h
//  PageSample
//
//  Created by oota akihiro on 2013/07/14.
//  Copyright (c) 2013年 akihiro oota. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>
@property(strong, nonatomic)UIView *rightView ;
@property(strong, nonatomic)UIView *midView ;
@property(strong, nonatomic)UIView *mid2View ;
@property(strong, nonatomic)UIView *leftView ;

@property (strong, nonatomic) IBOutlet UIScrollView *scView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControll;
- (IBAction)pageAction:(id)sender;

@end
