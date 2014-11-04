//
//  LoginViewController.m
//  CHRiudoms
//
//  Created by Roger Gras on 4/11/14.
//  Copyright (c) 2014 rogras. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse.h>
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    PFLogInViewController *logInController = [[PFLogInViewController alloc] init];
    logInController.delegate = self;
    
    logInController.fields = PFLogInFieldsUsernameAndPassword
    | PFLogInFieldsFacebook
    | PFLogInFieldsTwitter
    | PFLogInFieldsSignUpButton
    | PFLogInFieldsLogInButton
    | PFLogInFieldsPasswordForgotten;
    
    [self  presentModalViewController:logInController animated:YES];
}


- (void)logInViewController:(PFLogInViewController *)controller
               didLogInUser:(PFUser *)user {
    
    // Hacemos aquello que queramos cuando se produce el login
    [self dismissModalViewControllerAnimated:YES];
}

- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    
    // Hacemos aquello que queramos cuando el usuario pulsa cancelar (la x superior izquierda)
    [self dismissModalViewControllerAnimated:YES];
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
