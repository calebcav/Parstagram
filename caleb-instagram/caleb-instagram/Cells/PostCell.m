//
//  PostCell.m
//  caleb-instagram
//
//  Created by Caleb Caviness on 7/7/20.
//  Copyright © 2020 Caleb Caviness. All rights reserved.
//

#import "PostCell.h"
#import "Post.h"
@implementation PostCell


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
    self.postImage.file = post.image;
    
    [self.postImage loadInBackground];
    self.postName.text = post.author.username;
    self.postCaption.text = post.caption;
}

@end
