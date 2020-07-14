//
//  UserPostCell.m
//  caleb-instagram
//
//  Created by Caleb Caviness on 7/10/20.
//  Copyright © 2020 Caleb Caviness. All rights reserved.
//

#import "UserPostCell.h"
#import "Post.h"
@implementation UserPostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)setPost:(Post *)post {
    _post = post;
    self.userPostImage.file = post.image;
    [self.userPostImage loadInBackground];
    self.userPostCaption.text = post.caption;
}

@end
