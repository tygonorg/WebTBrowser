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
    [self removeFromSuperview];
}
-(void) install{
    [[NSBundle mainBundle] loadNibNamed:@"Tabs" owner:self options:nil];
    [self addSubview:self.contentview];
    self.contentview.frame = self.bounds;
}
@end
