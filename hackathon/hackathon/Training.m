//
//  Training.m
//  hackathon
//
//  Created by Яна Антонюк on 7/14/19.
//  Copyright © 2019 Яна Антонюк. All rights reserved.
//

#import "Training.h"
#import "ThirdPage.h"
#import "SecondPage.h"
#import "TabBarViewController.h"
#import "Cheking.h"
@interface Training () <UIGestureRecognizerDelegate>
@property int time;
@end

@implementation Training
- (void)viewDidLoad
{
    self.imageNamesArray = [NSArray arrayWithObjects:@"oval", @"one",@"two", @"three",@"success", nil];
    self.dictionary = [NSArray arrayWithObjects:@"Dzień dobry", @"Cześć", @"Dobry wieczór", @"Co słychać?",@"Wszystko w prządku", @"Jak się masz?", @"Powodzenia!", @"Jak masz na imię?", @"Proszę zaczekać", @"Zgoda", @"Tak, proszę bardzo", @"Dziękuję", @"Bardzo diękuję", @"Niestety", @"Szkoda", @"Przepraszam", nil];
    self.dictionary2 = [NSArray arrayWithObjects:@"Добрый день", @"Привет", @"Добрый вечер", @"Что слышно?",@"Все в порядке", @"Как дела?", @"Удачи!", @"Как тебя зовут?", @"Прошу подождать", @"Согласие", @"Да, пожалуйста", @"Спасибо", @"Большое спасибо", @"К сожалению", @"Жаль", @"Прошу прощения", nil];
    _card.layer.cornerRadius = 10;
    _firstWord.numberOfLines = 3;
    self.firstWord.adjustsFontSizeToFitWidth = YES;
    _firstWord.font = [UIFont systemFontOfSize:30];
    _firstWord.textAlignment = NSTextAlignmentCenter;
    _firstWord.text = self.dictionary[self.number];
    [_card addSubview:_firstWord];
    _card.userInteractionEnabled = true;
    [self setupRecognizer];
    [self.view addSubview:_card];
}
- (void)setupRecognizer
{
    UIPanGestureRecognizer* panSwipeRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanSwipe:)];
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
     [self.card addGestureRecognizer:tapRecognizer];
    panSwipeRecognizer.minimumNumberOfTouches = 1;
    [self.card addGestureRecognizer:panSwipeRecognizer];
}
#define SWIPE_UP_THRESHOLD -1000.0f
#define SWIPE_DOWN_THRESHOLD 1000.0f
#define SWIPE_LEFT_THRESHOLD -1000.0f
#define SWIPE_RIGHT_THRESHOLD 2000.0f
- (void)handlePanSwipe:(UIPanGestureRecognizer*)recognizer
{
    CGPoint t = [recognizer translationInView:recognizer.view];
    [recognizer setTranslation:CGPointZero inView:recognizer.view];
    self.card.center = CGPointMake(self.card.center.x + t.x, self.card.center.y + t.y);
    if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        CGPoint vel = [recognizer velocityInView:recognizer.view];
        if (vel.x < SWIPE_LEFT_THRESHOLD)
        {
        }
        else if (vel.x > SWIPE_RIGHT_THRESHOLD)
        {   self.number++;
            self.card.center = self.view.center;
            self.firstWord.text = self.dictionary[self.number];
            if(self.number > 9)
            {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Достижения" message:@"Поздравляю. Ты изучил 10 новых слов" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"Ок" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    TabBarViewController *destinationvcname = [self.storyboard instantiateViewControllerWithIdentifier:@"UITabBarController"];
                    [self presentViewController:destinationvcname animated:YES completion:nil];
                }];
                [alert addAction:action];
                [self presentViewController:alert animated:TRUE completion:nil];
               
                
            }
            if (self.number == 3 || self.number == 8)
            {
                //self.time++;
                Cheking *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"Cheking"];
                vc.startNumber = self.number;
                [self presentViewController:vc animated:YES completion:nil];
            }
        }
    }
}
-(void)handleTap
{
    [_card addSubview:_cardImageView];
    if (self.firstWord.text == self.dictionary[self.number])
    {
         self.firstWord.text = self.dictionary2[self.number];
    }
    else
    {
        self.firstWord.text = self.dictionary[self.number];
    }
    if (_cardImageView.image != nil)
    {
        _cardImageView.image = nil;
    }
    else{
         _cardImageView.image = [UIImage imageNamed:@"hello"];
    }
}
@end
