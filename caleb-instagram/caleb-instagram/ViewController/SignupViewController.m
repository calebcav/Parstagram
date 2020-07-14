//
//  SignupViewController.m
//  caleb-instagram
//
//  Created by Caleb Caviness on 7/6/20.
//  Copyright © 2020 Caleb Caviness. All rights reserved.
//

#import "SignupViewController.h"
#import <Parse/Parse.h>
@interface SignupViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation SignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)signupButton:(id)sender {
    PFUser *newUser = [PFUser user];
    newUser.username = self.usernameField.text;
    newUser.password = self.passwordField.text;
    
     [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
         if (error != nil) {
             NSLog(@"Error: %@", error.localizedDescription);
         } else {
             NSLog(@"User registered successfully");
             [self dismissViewControllerAnimated:true completion:nil];
             // manually segue to logged in view
         }
     }];
}

- (IBAction)closeButton:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
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
