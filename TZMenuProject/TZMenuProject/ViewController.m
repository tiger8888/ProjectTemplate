//
//  ViewController.m
//  TZMenuProject
//
//  Created by MYL-SOFTWARE on 14-11-28.
//  Copyright (c) 2014年 com.ilovejuly. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong)UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10, 100, 200, 200);
    label.backgroundColor = [UIColor orangeColor];
    label.text = @"Long Press Me!";
    label.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
 
    [label addGestureRecognizer: longPress];
    self.label = label;

    [self.view addSubview:label];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuViewWillHide:) name:UIMenuControllerWillHideMenuNotification object:nil];
}
- (void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark - UIMenuController
- (void)longPress:(UILongPressGestureRecognizer *)press{
    
    if (press.state == UIGestureRecognizerStateBegan) {
        UIMenuController *menu = [UIMenuController sharedMenuController];
        
        // UIMenuItem 对象  action 和 title 都不能为nil
        UIMenuItem *item1 = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(item1Action:)];
        UIMenuItem *item2 = [[UIMenuItem alloc] initWithTitle:@"赞" action:@selector(item2Action:)];
        UIMenuItem *item3 = [[UIMenuItem alloc] initWithTitle:@"举报" action:@selector(item3Action:)];
        
        [menu setMenuItems:@[item1, item2, item3]];
        
        // 设置显示的位置和父试图
        CGPoint point = [press locationInView:self.label];
        self.label.backgroundColor = [UIColor grayColor];
        [menu setTargetRect:CGRectMake(point.x, point.y, 0,0) inView:self.label];
        // 显示
        [menu setMenuVisible:YES animated:YES];
    }
}

- (void)item1Action:(id)sender
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)item2Action:(id)sender
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)item3Action:(id)sender
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

#pragma mark - 为了使用UIMenuController 必须重写以下的方法

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    // 如果 UIMenuController 的 item 的 action，返回YES
    if ( action==@selector(item1Action:)
        || action==@selector(item2Action:)
        || action==@selector(item3Action:) ) {
        return YES;
    }
    else {
        return [super canPerformAction:action withSender:sender];
    }
}
#pragma mark - 菜单隐藏
- (void)menuViewWillHide:(NSNotification *)notification{
    self.label.backgroundColor = [UIColor orangeColor];
}
@end
