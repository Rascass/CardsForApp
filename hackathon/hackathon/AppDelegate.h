//
//  AppDelegate.h
//  hackathon
//
//  Created by Яна Антонюк on 7/12/19.
//  Copyright © 2019 Яна Антонюк. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

