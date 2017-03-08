//
//  ChangeColorView.m
//  ChangeColorLabel
//
//  Created by Null on 16/2/2.
//  Copyright © 2016年 zcs_yang. All rights reserved.
//

#import "ChangeColorView.h"
@interface ChangeColorView()
@property (nonatomic ,strong)UIView *upperView;
@property (nonatomic ,strong)UIView *slideView;
@property (nonatomic ,strong)UIView *lowerView;
@property (nonatomic ,strong)NSArray *testArr;
@property (nonatomic ,strong)UIColor *oriColor;
@property (nonatomic ,strong)UIColor *willColor;
@end
@implementation ChangeColorView
- (instancetype)initWithFrame:(CGRect)frame OrignTextColor:(UIColor *)oriColor willColor:(UIColor *)willColor textArr:(NSArray *)textArr{
    self = [super initWithFrame:frame];
    if (self) {
        self.oriColor = oriColor;
        self.willColor = willColor;
        self.testArr = textArr;
        [self addSubview:self.lowerView];
        [self addSubview:self.slideView];
    }
    return self;
}

- (UIView *)lowerView{
    if (_lowerView) {
        return _lowerView;
    }
    _lowerView = [[UIView alloc]init];
    _lowerView.backgroundColor = [UIColor clearColor];
    _lowerView.frame = self.bounds;
    for (int i = 0; i<self.testArr.count; i++) {
        [_lowerView addSubview:[self createLabels:i textColor:self.oriColor]];
    }
    return _lowerView;
}

- (UIView *)slideView{
    if (_slideView) {
        return _slideView;
    }
    _slideView = [[UIView alloc]init];
    _slideView.backgroundColor = [UIColor blackColor];
    [_slideView addSubview:self.upperView];
    _slideView.clipsToBounds = YES;
    _slideView.frame = CGRectMake(0, 0, self.bounds.size.width, [self height]);
    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGesAction:)];
    [_slideView addGestureRecognizer:panGes];
    return _slideView;
}

- (UIView *)upperView{
    if (_upperView) {
        return _upperView;
    }
    _upperView = [[UIView alloc]init];
    _upperView.backgroundColor = [UIColor clearColor];
    _upperView.frame = self.bounds;
    for (int i = 0; i<self.testArr.count; i++) {
        [_upperView addSubview:[self createLabels:i textColor:self.willColor]];
    }
    return _upperView;
}

- (CGFloat)height{
    return self.bounds.size.height / self.testArr.count;
}

- (UILabel *)createLabels:(NSInteger)index textColor:(UIColor *)textColor{
    UILabel *label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor clearColor];
    label.text = self.testArr[index];
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:35.f];
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = CGRectMake(0, index *[self height], self.bounds.size.width, [self height]);
    return label;
}

- (void)panGesAction:(UIPanGestureRecognizer *)panGes{
    CGPoint location = [panGes translationInView:self];
    CGRect slideFrame = self.slideView.frame;
    CGRect upperLabelFrame = self.upperView.frame;
    slideFrame.origin.y += location.y;
    upperLabelFrame.origin.y -= location.y;
    if (slideFrame.origin.y<0) {
        slideFrame.origin.y = 0;
        upperLabelFrame.origin.y = 0;
    }
    else if (slideFrame.origin.y > 2*[self height]) {
        slideFrame.origin.y = 2*[self height];
        upperLabelFrame.origin.y = -2*[self height];
    }
    self.upperView.frame = upperLabelFrame;
    self.slideView.frame = slideFrame;
    [panGes setTranslation:CGPointZero inView:self];
}
@end
