//
//  AFCollectionViewCell.m
//  Start_Two
//
//  Created by dengjiangzhou on 2018/2/5.
//  Copyright © 2018年 dengjiangzhou. All rights reserved.
//

#import "AFCollectionViewCell.h"



@implementation AFCollectionViewCell{
    UILabel * textLabel;
    
}


- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor whiteColor];
        textLabel = [[UILabel alloc] initWithFrame: self.bounds];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.font = [UIFont boldSystemFontOfSize: 20];
        [self.contentView addSubview: textLabel];
        
    }
    
    return self;
}




- (void)prepareForReuse{
    [super prepareForReuse];
    self.text = @"";
    
}



@end
