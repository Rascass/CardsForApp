//
//  SecondPage.m
//  hackathon
//
//  Created by Яна Антонюк on 7/13/19.
//  Copyright © 2019 Яна Антонюк. All rights reserved.
//

#import "SecondPage.h"
#import "Training.h"
NSString * const kCellReuseId2 = @"newId";
@interface SecondPage () <UISearchBarDelegate>
@end
@implementation SecondPage
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dictionary = [NSArray arrayWithObjects:@"Dzień dobry", @"Cześć", @"Dobry wieczór", @"Co słychać?",@"Wszystko w prządku", @"Jak się masz?", @"Powodzenia!", @"Jak masz na imię?", @"Proszę zaczekać", @"Zgoda", @"Tak, proszę bardzo", @"Dziękuję", @"Bardzo diękuję", @"Niestety", @"Szkoda", @"Przepraszam", nil];
    self.searchArray = self.dictionary;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellReuseId2];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.searchBar.delegate = self;
    self.tableView.tableFooterView = [UIView new];
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    [self.tableView registerClass:[UITableViewCell self] forCellReuseIdentifier:kCellReuseId2];
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kCellReuseId2 forIndexPath:indexPath];
    cell.textLabel.text = self.searchArray[indexPath.row];
    UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    cell.accessoryView = [iconView initWithImage:[UIImage imageNamed:@"oval"]];
   // NSNotificationCenter *center = [NSNotificationCenter new];
   // Training *vc = [Training new];
    //[center addObserver:vc selector:@selector(notificationChange:) name:notification object:vc.imageName];
//    if(indexPath.row < 10)
//    {
//            cell.accessoryView = [iconView initWithImage:[UIImage imageNamed:@"one"]];
//        }
//
    return cell;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return self.searchArray.count;
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length != 0)
    {
        NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
            return [evaluatedObject containsString:searchText];
        }];
        self.searchArray = [self.dictionary filteredArrayUsingPredicate:predicate];
    }
    else
    {
        self.searchArray = self.dictionary;
    }
    [self.tableView reloadData];
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    self.searchBar.text = @"";
    self.searchArray = self.dictionary;
    [self.tableView reloadData];
    [self.searchBar resignFirstResponder];
}

@end
