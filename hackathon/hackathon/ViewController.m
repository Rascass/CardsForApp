//
//  ViewController.m
//  hackathon
//
//  Created by Яна Антонюк on 7/12/19.
//  Copyright © 2019 Яна Антонюк. All rights reserved.
//

#import "ViewController.h"
#import "ContainerViewController.h"
#import "InitialViewCont.h"
#import "SecondPage.h"
@interface ViewController () <UIPageViewControllerDelegate, UIPageViewControllerDataSource>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _pageTitles = @[@"Запомнить все", @"Обучайтесь на ходу", @"Проверенные методы"];
    _pageImages = @[@"creativity", @"bus", @"open-book"];
    _pageText = @[@"Мы против скучных и неэффективных методов запоминания. Только провереннные методики и игровой процесс обучения.", @"Простота и разные интервалы тренировок позволяют вам тренироваться где угодно и когда угодно.", @"Система Лейтнера и принцип active recall помогут вам эффективно запоминать информацию."];
  //  self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"InitialViewCont"];
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
  //  self.pageViewController.transitionStyle = UIPageViewControllerTransitionStyleScroll;
    self.pageViewController.dataSource = self;
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    pageControl.backgroundColor = [UIColor whiteColor];

    ContainerViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 70);
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((ContainerViewController*) viewController).pageIndex;
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((ContainerViewController*) viewController).pageIndex;
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}
- (ContainerViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    // Create a new view controller and pass suitable data.
    ContainerViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContainerViewController"];
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.titleText = self.pageTitles[index];
    pageContentViewController.descriptionText = self.pageText[index];
    pageContentViewController.pageIndex = index;
    return pageContentViewController;
}
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}
@end
