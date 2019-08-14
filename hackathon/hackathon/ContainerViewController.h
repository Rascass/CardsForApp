//
//  FirstPage.h
//  hackathon
//
//  Created by Яна Антонюк on 7/13/19.
//  Copyright © 2019 Яна Антонюк. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ContainerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
//@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property NSString *descriptionText;
@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;
@end

NS_ASSUME_NONNULL_END
