//
//  Cheking.m
//  hackathon
//
//  Created by Яна Антонюк on 8/1/19.
//  Copyright © 2019 Яна Антонюк. All rights reserved.
//

#import "Cheking.h"
#import "Training.h"
//#import <AudioToolbox/AudioToolbox.h>
//#import <AVFoundation/AVFoundation.h>
@interface Cheking ()
@end

@implementation Cheking

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.cllctnButtns = [NSArray arrayWithObjects:self.translate1Button, self.translate2Button, self.translate3Button, nil];
    self.dictionary = [NSMutableArray arrayWithObjects:@"Dzień dobry", @"Cześć", @"Dobry wieczór", @"Co słychać?",@"Wszystko w prządku", @"Jak się masz?", @"Powodzenia!", @"Jak masz na imię?", @"Proszę zaczekać", @"Zgoda", @"Tak, proszę bardzo", @"Dziękuję", @"Bardzo diękuję", @"Niestety", @"Szkoda", @"Przepraszam", nil];
    self.dictionary2 = [NSMutableArray arrayWithObjects:@"Добрый день", @"Привет", @"Добрый вечер", @"Что слышно?",@"Все в порядке", @"Как дела?", @"Удачи!", @"Как тебя зовут?", @"Прошу подождать", @"Согласие", @"Да, пожалуйста", @"Спасибо", @"Большое спасибо", @"К сожалению", @"Жаль", @"Прошу прощения", nil];
    for (UIButton *button in self.cllctnButtns)
    {
         [button addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self.nextButton addTarget:self action:@selector(nextAction) forControlEvents:UIControlEventTouchUpInside];
    [self chekwrds];
    
}
-(void)chekwrds
{
    if(self.time == 3)
    {
        Training *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"Training"];
        vc.number = self.startNumber;
        [self presentViewController:vc animated:YES completion:nil];
    }
    self.time++;
    int index = arc4random_uniform(_startNumber);
    self.indexcheking = index;
    self.wordLabel.text = self.dictionary[index];
    NSString *answer = self.dictionary2[index];
    NSString *answer2 = self.dictionary2[arc4random_uniform(8)];
    NSString *answer3 = self.dictionary2[arc4random_uniform(8)];
     NSLog(@"Результат рандома - %@-%@-%@", answer, answer2, answer3);
    if ([answer isEqualToString:answer2])
    {
        answer2 = self.dictionary2[arc4random_uniform(8)];
        NSLog(@"Первая проверка - %@-%@-%@", answer, answer2, answer3);
    }
    else if ([answer2 isEqualToString:answer3] && [answer isEqualToString:answer3])
    {
        answer3 = self.dictionary2[arc4random_uniform(8)];
        NSLog(@"Вторая проверка - %@-%@-%@", answer, answer2, answer3);
    }
    NSMutableSet *array = [[NSMutableSet alloc] initWithObjects:answer, answer2, answer3, nil];
    NSLog(@"%@, %@, %@", answer, answer2, answer3);
    for (int i = 0; i < 2; i++)
    {
        for (UIButton *button in self.cllctnButtns)
        {
            NSString *string = array.anyObject;
            if(string != nil)
            {
            [button setTitle:string forState:UIControlStateNormal];
            [array removeObject:string];
            }
            else
            {
                return;
            }
        }
    }
}
-(void)action:(UIButton*)sender
{
    if ([sender.titleLabel.text isEqualToString:self.dictionary2[self.indexcheking]])
    {
        sender.backgroundColor = [UIColor greenColor];
     //   AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:@"pick.mp3"] error:nil];
     //   [player play];
        [self.dictionary2 removeObjectAtIndex:self.indexcheking];
        [self.dictionary removeObjectAtIndex:self.indexcheking];
        self.nextButton.backgroundColor = [UIColor orangeColor];
    }
    else
    {
        sender.backgroundColor = [UIColor redColor];
    }
}
-(void)nextAction
{
     self.nextButton.backgroundColor = [UIColor whiteColor];
     self.translate1Button.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.5];
     self.translate2Button.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.5];
     self.translate3Button.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.5];
    [self chekwrds];
}
@end
