//
//  PostCell.h
//  caleb-instagram
//
//  Created by Caleb Caviness on 7/7/20.
//  Copyright © 2020 Caleb Caviness. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
@import Parse;
NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UITableViewCell
@property (strong, nonatomic) IBOutlet PFImageView *postImage;
@property (strong, nonatomic) Post *post;
@property (strong, nonatomic) IBOutlet UILabel *postName;
@property (strong, nonatomic) IBOutlet UILabel *postCaption;

@end

NS_ASSUME_NONNULL_END
