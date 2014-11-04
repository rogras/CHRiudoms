//
//  ViewController.m
//  CHRiudoms
//
//  Created by Roger Gras on 4/11/14.
//  Copyright (c) 2014 rogras. All rights reserved.
//

#import "ViewController.h"
#import <Parse.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PFLogInViewController *logInController = [[PFLogInViewController alloc] init];
    logInController.delegate = self;
    [self presentModalViewController:logInController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
