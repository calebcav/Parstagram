//
//  DetailedViewController.h
//  caleb-instagram
//
//  Created by Caleb Caviness on 7/8/20.
//  Copyright © 2020 Caleb Caviness. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
NS_ASSUME_NONNULL_BEGIN

@interface DetailedViewController : UIViewController
@property (strong, nonatomic) Post *post;

@end

NS_ASSUME_NONNULL_END
