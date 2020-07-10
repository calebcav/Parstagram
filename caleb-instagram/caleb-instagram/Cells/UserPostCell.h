//
//  UserPostCell.h
//  caleb-instagram
//
//  Created by Caleb Caviness on 7/10/20.
//  Copyright © 2020 Caleb Caviness. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
@import Parse;
NS_ASSUME_NONNULL_BEGIN

@interface UserPostCell : UITableViewCell
@property (strong, nonatomic) IBOutlet PFImageView *userPostImage;
@property (strong, nonatomic) IBOutlet UILabel *userPostCaption;
@property (strong, nonatomic) Post *post;
@end

NS_ASSUME_NONNULL_END
