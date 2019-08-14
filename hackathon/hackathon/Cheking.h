//
//  Cheking.h
//  hackathon
//
//  Created by Яна Антонюк on 8/1/19.
//  Copyright © 2019 Яна Антонюк. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Cheking : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property (weak, nonatomic) IBOutlet UIButton *translate1Button;
@property (weak, nonatomic) IBOutlet UIButton *translate2Button;
@property (weak, nonatomic) IBOutlet UIButton *translate3Button;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (nonatomic, assign) int time;
@property (nonatomic, assign) int startNumber;
@property (nonatomic) NSArray *cllctnButtns;
@property NSMutableArray* dictionary;
@property NSMutableArray* dictionary2;
@property int indexcheking;
@end

NS_ASSUME_NONNULL_END
