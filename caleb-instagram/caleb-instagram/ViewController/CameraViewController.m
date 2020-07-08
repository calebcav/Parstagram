//
//  CameraViewController.m
//  caleb-instagram
//
//  Created by Caleb Caviness on 7/7/20.
//  Copyright © 2020 Caleb Caviness. All rights reserved.
//

#import "CameraViewController.h"
#import "Post.h"
#import <Parse/Parse.h>

@interface CameraViewController ()
@property (weak, nonatomic) IBOutlet UITextField *captionField;
@property (strong, nonatomic) UIImage *imagePost;

@end

@implementation CameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];

    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
}

- (IBAction)choosePhoto:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];

    // Do something with the images (based on your use case)
    self.imagePost = editedImage;
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)submitButton:(id)sender {
    [Post postUserImage:self.imagePost withCaption:self.captionField.text withCompletion:^(BOOL succeeded, NSError *error){
        NSLog(@"Works!");
    }];
}

-(void)dismissKeyboard
{
    [_captionField resignFirstResponder];
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
