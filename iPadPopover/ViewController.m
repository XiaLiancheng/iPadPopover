//
//  ViewController.m
//  iPadPopover
//
//  Created by apple on 16/10/9.
//  Copyright © 2016年 Liancheng. All rights reserved.
//

#import "ViewController.h"
#import "YYMenuViewController.h"
@interface ViewController ()<UIPopoverPresentationControllerDelegate,UISearchResultsUpdating>

@property (nonatomic, strong)UIPopoverController * popoverController;
@property (nonatomic, strong)UIPopoverPresentationController * popoverPresentationController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(commit)];
    self.navigationItem.rightBarButtonItem = barButtonItem;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)commit{
    NSLog(@"commit");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    YYMenuViewController * menuVC = [[YYMenuViewController alloc]init];
    
//   1.ipad特有的
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
//        self.popoverController = [[UIPopoverController alloc]initWithContentViewController:menuVC];
//        self.popoverController.popoverContentSize = CGSizeMake(300, 200);
//        [self.popoverController presentPopoverFromBarButtonItem:self.navigationItem.rightBarButtonItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
//    }else{
//        [self presentViewController:menuVC animated:YES completion:nil];
//    }
    
    
//   2.UIPresentationController; popover、alert、action sheet与search的新特性;iOS8出现
//    menuVC.modalPresentationStyle = UIModalPresentationPopover;
//    self.popoverPresentationController = menuVC.popoverPresentationController;
//    self.popoverPresentationController.barButtonItem = self.navigationItem.rightBarButtonItem;
//    self.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
//    self.popoverPresentationController.delegate = self;
//    [self presentViewController:menuVC animated:YES completion:nil];
    
    
//   3.UIAlertController
//    UIAlertController * sheet = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"title1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"action1");
//    }];
//    [sheet addAction:action1];
//    [sheet addAction:[UIAlertAction actionWithTitle:@"title" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"block");
//    }]];
//    [self presentViewController:sheet animated:YES completion:nil];
    
    
//  4.iOS8开始
    UISearchController * searchController = [[UISearchController alloc]initWithSearchResultsController:menuVC];
    searchController.searchResultsUpdater = self;
    self.navigationItem.titleView = searchController.searchBar;
    self.definesPresentationContext = YES;
 
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    return UIModalPresentationPageSheet;
}

- (UIViewController *)presentationController:(UIPresentationController *)controller viewControllerForAdaptivePresentationStyle:(UIModalPresentationStyle)style{
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:self.popoverPresentationController.presentedViewController];
    return nav;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
