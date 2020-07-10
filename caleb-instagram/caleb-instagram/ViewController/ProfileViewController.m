//
//  ProfileViewController.m
//  caleb-instagram
//
//  Created by Caleb Caviness on 7/9/20.
//  Copyright © 2020 Caleb Caviness. All rights reserved.
//

#import "ProfileViewController.h"
#import <Parse/Parse.h>
#import "Post.h"
#import "UserPostCell.h"
@import Parse;
@interface ProfileViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UILabel *profileUsername;
@property (strong, nonatomic) IBOutlet PFImageView *profilePicture;
@property (strong, nonatomic) UIImage *imagePost;
@property (strong, nonatomic) NSArray *posts;
@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.profileUsername.text = PFUser.currentUser.username;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self queryPosts];
    
}



- (void) queryPosts {
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query includeKey:@"author"];
    [query whereKey:@"author" equalTo:PFUser.currentUser];
    [query orderByDescending:@"createdAt"];
    query.limit = 20;

    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            // do something with the array of object returned by the call
            self.posts = posts;
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
        [self.tableView reloadData];
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserPostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserPostCell"];
    Post *post = self.posts[indexPath.row];
    cell.post = post;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}


@end
