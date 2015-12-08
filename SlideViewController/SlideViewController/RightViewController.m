//
//  RightViewController.m
//  SlideViewController
//
//  Created by mac on 15/12/8.
//  Copyright (c) 2015年 dqy. All rights reserved.
//

#import "RightViewController.h"
static BOOL isOpen;
@interface RightViewController ()

@end

@implementation RightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    
    
    
    
    isOpen = NO;
    //拖动
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    
    [self.view addGestureRecognizer:pan];
    
    
    
    
    
    //点击
    UITapGestureRecognizer * singleGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleAction:)];
    
    singleGesture.numberOfTapsRequired = 1;
    singleGesture.numberOfTouchesRequired = 1;
    
    [self.view addGestureRecognizer:singleGesture];
    
    // Do any additional setup after loading the view.
}

- (void)singleAction:(UITapGestureRecognizer *) sender {
    
    
    if (isOpen == NO) {
        [UIView animateWithDuration:.5f animations:^{
            
            self.view.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width - 40, 0,40 , [[UIScreen mainScreen] bounds].size.height);
            
            
        }];
        
        isOpen = YES;
    }
    else {
        [UIView animateWithDuration:.5f animations:^{
            
            self.view.frame = CGRectMake( 0, 0,[[UIScreen mainScreen] bounds].size.width , [[UIScreen mainScreen] bounds].size.height);
            
            
        }];
        
        isOpen = NO;
        
    }
    
    
    
}



- (void)panAction:(UIPanGestureRecognizer *) sender {
    
    CGPoint point = [sender translationInView:self.view];
    
    self.view.center = CGPointMake(sender.view.center.x + point.x, sender.view.center.y);
    
    [sender setTranslation:CGPointZero  inView:self.view];
    
    
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

@end
