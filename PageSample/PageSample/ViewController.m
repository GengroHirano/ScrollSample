//
//  ViewController.m
//  PageSample
//
//  Created by oota akihiro on 2013/07/14.
//  Copyright (c) 2013年 akihiro oota. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // leftViewとrightViewの幅は320
    _scView.contentSize = CGSizeMake(1280, 300) ;
    _scView.pagingEnabled = YES ;
    _leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    _midView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)] ;
    _mid2View = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 300)] ;
    _rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    // 右の画面に配置されるビューは左のビューの幅だけ右にずらしてあげる必要がある。
    _leftView.backgroundColor = [UIColor redColor] ;
    _midView.backgroundColor = [UIColor yellowColor] ;
    _mid2View.backgroundColor = [UIColor orangeColor] ;
    _rightView.backgroundColor = [UIColor blueColor] ;
    
    CGRect rect ;
    
    rect = _midView.frame;
    //隣のViewのx座標と隣のViewの幅を足す、コレにより確実にとなりに配置できる
    rect.origin.x = _leftView.frame.origin.x + _leftView.frame.size.width;
    rect.origin.y = 0;
    _midView.frame = rect;
    
    rect = _mid2View.frame;
    rect.origin.x = _midView.frame.origin.x + _midView.frame.size.width;
    rect.origin.y = 0;
    _mid2View.frame = rect;
    
    rect =  _rightView.frame ;
    rect.origin.x = _mid2View.frame.origin.x + _mid2View.frame.size.width ;
    rect.origin.y = 0 ;
    _rightView.frame = rect ;
    
    [_scView addSubview:_leftView];
    [_scView addSubview:_midView] ;
    [_scView addSubview:_mid2View] ;
    [_scView addSubview:_rightView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pageAction:(id)sender {
    CGRect fream = _scView.frame ;
    fream.origin.x = fream.size.width * _pageControll.currentPage ;
    fream.origin.y = 0 ;
    [_scView scrollRectToVisible:fream animated:YES] ;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"swipe %f,  %f", scrollView.contentOffset.x, scrollView.frame.size.width) ;
    CGFloat pageWidth = scrollView.frame.size.width ; //スクロールビューの外側の幅をとっている
    NSLog(@"%f", scrollView.contentOffset.x) ; //スクロールビューの中身のx座標をとっている
    
    //最初のページなら0 / 320, 次ページならば320 / 320と言った具合にページをとる事が出来る 
    _pageControll.currentPage = (floor(scrollView.contentOffset.x / pageWidth));
}

@end
