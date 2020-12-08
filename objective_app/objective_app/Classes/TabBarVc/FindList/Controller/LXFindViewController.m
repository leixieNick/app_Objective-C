//
//  LXFindViewController.m
//  objective_app
//
//  Created by asdc on 2020/12/8.
//

#import "LXFindViewController.h"
#import "MBExample.h"

#import "LXRunTimeViewController.h"

@interface LXFindViewController () <NSURLSessionDelegate>

@property (nonatomic, strong) NSArray<NSArray<MBExample *> *> *examples;

@end

@implementation LXFindViewController

- (id)init {
    return [super initWithStyle:UITableViewStyleGrouped];
}

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.tintColor = [UIColor colorWithRed:.337f green:.57f blue:.731f alpha:1.f];
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.examples.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.examples[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MBExample *example = self.examples[indexPath.section][indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MBExampleCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MBExampleCell"];
    }
    
    cell.textLabel.text = example.title;
    cell.textLabel.textColor = self.view.tintColor;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.selectedBackgroundView = [UIView new];
    cell.selectedBackgroundView.backgroundColor = [cell.textLabel.textColor colorWithAlphaComponent:0.1f];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MBExample *example = self.examples[indexPath.section][indexPath.row];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self performSelector:example.selector];
#pragma clang diagnostic pop

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    });
}

#pragma mark - Examples
- (NSArray<NSArray<MBExample *> *> *)examples {
    if (!_examples) {
        _examples =
        @[@[[MBExample exampleWithTitle:@"Runtime" selector:@selector(runtimeExample)],
            [MBExample exampleWithTitle:@"With label" selector:@selector(indeterminateExample)],
            [MBExample exampleWithTitle:@"With details label" selector:@selector(indeterminateExample)]],
          @[[MBExample exampleWithTitle:@"Determinate mode" selector:@selector(indeterminateExample)],
            [MBExample exampleWithTitle:@"Annular determinate mode" selector:@selector(indeterminateExample)],
            [MBExample exampleWithTitle:@"Bar determinate mode" selector:@selector(indeterminateExample)]],
          @[[MBExample exampleWithTitle:@"Text only" selector:@selector(indeterminateExample)],
            [MBExample exampleWithTitle:@"Custom view" selector:@selector(indeterminateExample)],
            [MBExample exampleWithTitle:@"With action button" selector:@selector(indeterminateExample)],
            [MBExample exampleWithTitle:@"Mode switching" selector:@selector(indeterminateExample)]],
          @[[MBExample exampleWithTitle:@"On window" selector:@selector(indeterminateExample)],
            [MBExample exampleWithTitle:@"NSURLSession" selector:@selector(indeterminateExample)],
            [MBExample exampleWithTitle:@"Determinate with NSProgress" selector:@selector(indeterminateExample)],
            [MBExample exampleWithTitle:@"Dim background" selector:@selector(indeterminateExample)],
            [MBExample exampleWithTitle:@"Colored" selector:@selector(indeterminateExample)]]
          ];
    }
    return _examples;
}


#pragma mark -- 每行的点击事件
- (void)indeterminateExample {
    
}

- (void)runtimeExample {
    LXRunTimeViewController *nextVc = [[LXRunTimeViewController alloc] init];
    [self.navigationController pushViewController:nextVc animated:YES];
}

@end
