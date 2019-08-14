//
//  SecondPage.h
//  hackathon
//
//  Created by Яна Антонюк on 7/13/19.
//  Copyright © 2019 Яна Антонюк. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecondPage : UIViewController < UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *words;
@property (strong, nonatomic) NSArray *searchArray;
@property NSArray *dictionary;
@property NSString* sector;
//@property UIImage *imageTime;
@end

NS_ASSUME_NONNULL_END
