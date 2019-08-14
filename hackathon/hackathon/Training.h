//
//  Training.h
//  hackathon
//
//  Created by Яна Антонюк on 7/14/19.
//  Copyright © 2019 Яна Антонюк. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Training : UIViewController
@property (weak, nonatomic) IBOutlet UIView *card;
@property (weak, nonatomic) IBOutlet UIImageView *cardImageView;
@property (weak, nonatomic) IBOutlet UILabel *firstWord;
@property (strong, nonatomic) UIView *translateView;
@property NSArray *dictionary2;
@property int number;
@property NSArray *imageNamesArray;
@property NSArray *dictionary;
@property double value;
@property NSString *imageName;
@end

NS_ASSUME_NONNULL_END
