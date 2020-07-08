//
//  DetailedViewController.m
//  caleb-instagram
//
//  Created by Caleb Caviness on 7/8/20.
//  Copyright © 2020 Caleb Caviness. All rights reserved.
//

#import "DetailedViewController.h"
@import Parse;
@interface DetailedViewController ()
@property (strong, nonatomic) IBOutlet PFImageView *postPhoto;
@property (strong, nonatomic) IBOutlet UILabel *postTimestamp;
@property (strong, nonatomic) IBOutlet UILabel *postName;
@property (strong, nonatomic) IBOutlet UILabel *postCaption;

@end

@implementation DetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.postName.text = self.post.author.username;
    self.postCaption.text = self.post.caption;
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"dd MM yyyy HH:mm"];
    self.postTimestamp.text = [formatter stringFromDate:self.post.createdAt];
    self.postPhoto.file = self.post.image;
    [self.postPhoto loadInBackground];
    // Do any additional setup after loading the view.
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
