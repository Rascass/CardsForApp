//
//  FirstPage.m
//  hackathon
//
//  Created by Яна Антонюк on 7/13/19.
//  Copyright © 2019 Яна Антонюк. All rights reserved.
//

#import "ContainerViewController.h"

@interface ContainerViewController ()
@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = [UIImage imageNamed:self.imageFile];
    self.titleLabel.text = self.titleText;
    self.descriptionLabel.text = self.descriptionText;
}
@end
