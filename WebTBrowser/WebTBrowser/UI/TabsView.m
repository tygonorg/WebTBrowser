//
//  TabsView.m
//  WebTBrowser
//
//  Created by Hung Tran on 8/13/20.
//  Copyright © 2020 Tran Phuoc Hung. All rights reserved.
//

#import "TabsView.h"

@implementation TabsView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype) initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if(self){
        [self install];
    }
    return self;
}


-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self install];
    }
    return self;
}

- (IBAction)close:(id)sender {
    if(self.maindelegate!=nil){
        [self.maindelegate closeTab:self.TabIndex];
    }
    //[self removeFromSuperview];
}
-(void) install{
    [[NSBundle mainBundle] loadNibNamed:@"Tabs" owner:self options:nil];
    [self addSubview:self.contentview];
    self.contentview.frame = self.bounds;
    
    CAShapeLayer * maskLayer = [CAShapeLayer layer];
    maskLayer.path = [UIBezierPath bezierPathWithRoundedRect: self.bounds byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: (CGSize){10.0, 10.}].CGPath;

    self.contentview.layer.mask = maskLayer;
    
    
   // self.contentview.layer.cornerRadius =8.0;
    
    UITapGestureRecognizer *tapGesture =
    [[UITapGestureRecognizer alloc]
     initWithTarget:self action:@selector(didTapLabelWithGesture:)];
    [self.lbl_titles addGestureRecognizer:tapGesture];
}
#pragma mark Tap on label
- (void)didTapLabelWithGesture:(UITapGestureRecognizer *)tapGesture {
    if(self.maindelegate!=nil){
        [self.maindelegate changeTab:self.TabIndex];
    }
}
#pragma mark TBrowerDelegate
-(void) SetTitle:(NSString *)title{
    self.lbl_titles.text = title;
}
- (void) setActive:(bool) active{
    if(active){
        self.contentview.backgroundColor = UIColor.redColor;
    } else{
        self.contentview.backgroundColor = UIColor.blackColor;
    }
}
@end
