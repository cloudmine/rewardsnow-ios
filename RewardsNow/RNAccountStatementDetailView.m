//
//  RNAccountStatementDetailView.m
//  RewardsNow
//
//  Created by Ethan Mick on 4/23/13.
//  Copyright (c) 2013 CloudMine LLC. All rights reserved.
//

#import "RNAccountStatementDetailView.h"
#import "RNConstants.h"
#import <QuartzCore/QuartzCore.h>

@interface RNAccountStatementDetailView()

@property (nonatomic) NSInteger numLabels;

@end

@implementation RNAccountStatementDetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIColor *backgroundColor = [UIColor colorWithRed:C(227) green:C(228) blue:C(228) alpha:1.0];
        
        self.backgroundColor = backgroundColor;
        self.layer.cornerRadius = 3;
        self.numLabels = 0;
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 290, 40)];
        self.titleLabel.backgroundColor = backgroundColor;
        [self addSubview:_titleLabel];
        
        UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(5, 55, 280, 2)];
        line.image = [UIImage imageNamed:@"divider-line.png"];
        [self addSubview:line];
        
    }
    return self;
}

- (void)addLeftText:(NSString *)left rightText:(NSString *)right {
    
    UILabel *detail = [[UILabel alloc] initWithFrame:CGRectMake(5, 60 + (40 * _numLabels), 160, 40)];
    detail.backgroundColor = [UIColor colorWithRed:C(227) green:C(228) blue:C(228) alpha:1.0];
    detail.font = [UIFont fontWithName:@"Arial" size:12];
    detail.text = left;
    [self addSubview:detail];
    
    UILabel *detailRight = [[UILabel alloc] initWithFrame:CGRectMake(160, 60 + (40 * _numLabels), 160, 40)];
    detailRight.backgroundColor = [UIColor colorWithRed:C(227) green:C(228) blue:C(228) alpha:1.0];
    detailRight.text = right;
    detail.font = [UIFont fontWithName:@"Arial" size:12];
    detailRight.textColor = [UIColor redColor];
    [self addSubview:detailRight];
    _numLabels++;
}



@end
