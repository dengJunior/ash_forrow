//
//  AshViewController.m
//  Start_Two
//
//  Created by dengjiangzhou on 2018/1/31.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

#import "AshViewController.h"


//
#import "AFCollectionViewCell.h"

@interface AshViewController ()

@end

static NSString * kCellIdentifier = @"Cell_Identifier";

@implementation AshViewController{
    NSMutableArray * datesArray;
    NSDateFormatter * dateFormatter;
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    datesArray = [NSMutableArray array];
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: [NSDateFormatter dateFormatFromTemplate:@"h:mm:ss a" options: 0 locale: [NSLocale currentLocale]]];
    UICollectionViewFlowLayout * flowLayout = (UICollectionViewFlowLayout *) self.collectionView.collectionViewLayout;
    flowLayout.minimumInteritemSpacing = 40.0f;
    flowLayout.minimumLineSpacing = 40.0;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    flowLayout.itemSize = CGSizeMake(200, 200);

    [self.collectionView registerClass:[AFCollectionViewCell class] forCellWithReuseIdentifier: kCellIdentifier];
    self.collectionView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    
    UIBarButtonItem * addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target: self action: @selector(userTappedAddButton:) ];
    self.navigationItem.rightBarButtonItem = addButton;
    self.navigationItem.title = @"Our Time Machine";
}


- (void)userTappedAddButton: (id) sender{
    [self addNewDate];
}


- (void)addNewDate{
    [self.collectionView performBatchUpdates:^{
        NSDate * newDate = [NSDate date];
        [datesArray insertObject: newDate atIndex: 0];
        [self.collectionView insertItemsAtIndexPaths: @[[NSIndexPath indexPathForItem:0 inSection:0 ]]];
    } completion: nil];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return datesArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AFCollectionViewCell * collectionViewCell = (AFCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier: kCellIdentifier forIndexPath: indexPath];
    collectionViewCell.text = [dateFormatter stringFromDate: datesArray[indexPath.item]];
    return collectionViewCell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
