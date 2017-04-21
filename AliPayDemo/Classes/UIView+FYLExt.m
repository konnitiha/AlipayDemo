//
//  UIView+FYLExt.m
//  享泊享停车
//
//  Created by eparking2 on 16/2/19.
//  Copyright © 2016年 eparking. All rights reserved.
//

#import "UIView+FYLExt.h"

@implementation UIView (FYLExt)
-(CGFloat)fyl_x{
    return self.frame.origin.x;
}

- (void)setFyl_x:(CGFloat)fyl_x{
    CGRect frame=self.frame;
    frame.origin.x=fyl_x;
    self.frame=frame;
}


- (CGFloat)fyl_y{
    return self.frame.origin.y;
}
- (void)setFyl_y:(CGFloat)fyl_y{
    CGRect frame=self.frame;
    frame.origin.y=fyl_y;
    self.frame=frame;
}

- (CGFloat)fyl_w{
    return self.frame.size.width;
}
- (void)setFyl_w:(CGFloat)fyl_w{
    CGRect frame=self.frame;
    frame.size.width=fyl_w;
    self.frame=frame;
}


- (CGFloat)fyl_h{
    return self.frame.size.height;
}
- (void)setFyl_h:(CGFloat)fyl_h{
    CGRect frame=self.frame;
    frame.size.height=fyl_h;
    self.frame=frame;
}

- (CGFloat)fyl_right{
    return self.frame.size.width + self.frame.origin.x;
}
- (void)setFyl_right:(CGFloat)fyl_right{
    CGRect frame=self.frame;
    frame.origin.x=fyl_right - frame.size.width;
    self.frame=frame;
}

- (CGFloat)fyl_bottom{
    return self.frame.size.height + self.frame.origin.y;
}
- (void)setFyl_bottom:(CGFloat)fyl_bottom{
    CGRect frame=self.frame;
    frame.origin.y=fyl_bottom - frame.size.height;
    self.frame=frame;
}

- (CGFloat)fyl_centerX{
    return self.center.x;
}
- (void)setFyl_centerX:(CGFloat)fyl_centerX{
    CGPoint center = self.center;
    center.x = fyl_centerX;
    self.center = center;
}

- (CGFloat)fyl_centerY{
    return self.center.y;
}
- (void)setFyl_centerY:(CGFloat)fyl_centerY{
    CGPoint center = self.center;
    center.y = fyl_centerY;
    self.center = center;
}

- (CGSize)fyl_size{
    return self.frame.size;
}
- (void)setFyl_size:(CGSize)fyl_size{
    CGRect frame = self.frame;
    frame.size.width = fyl_size.width;
    frame.size.height = fyl_size.height;
    self.frame = frame;
}

- (CGPoint)fyl_origin{
    return self.frame.origin;
}
- (void)setFyl_origin:(CGPoint)fyl_origin{
    CGRect frame = self.frame;
    frame.origin.x = fyl_origin.x;
    frame.origin.y = fyl_origin.y;
    self.frame = frame;
}

- (CGFloat)fyl_cornerRadius{
    return self.layer.cornerRadius;
}
- (void)setFyl_cornerRadius:(CGFloat)fyl_cornerRadius{
    self.layer.cornerRadius = fyl_cornerRadius;
    self.layer.masksToBounds = fyl_cornerRadius>0;
}

- (UIColor *)fyl_bordColor{
    return nil;
}
- (void)setFyl_bordColor:(UIColor *)fyl_bordColor{
    self.layer.borderColor = fyl_bordColor.CGColor;
}


- (CGFloat)fyl_borderWidth{
    return self.layer.borderWidth;
}
- (void)setFyl_borderWidth:(CGFloat)fyl_borderWidth{
    self.layer.borderWidth = fyl_borderWidth;
}


// Move via offset
- (void)FYLMoveBy:(CGPoint)delta {
    CGPoint newcenter = self.center;
    newcenter.x       += delta.x;
    newcenter.y       += delta.y;
    self.center       = newcenter;
}

// Scaling
- (void)FYLScaleBy:(CGFloat)scaleFactor {
    CGRect newframe      = self.frame;
    newframe.size.width  *= scaleFactor;
    newframe.size.height *= scaleFactor;
    self.frame           = newframe;
}

- (void)addShadow:(UIColor *)color opacity:(CGFloat)opacity radius:(CGFloat)radius offset:(CGSize)offset{
    self.layer.shadowOpacity = opacity;// 阴影透明度
    self.layer.shadowColor = color.CGColor;// 阴影的颜色
    self.layer.shadowRadius = radius;// 阴影扩散的范围控制
    self.layer.shadowOffset  = offset;// 阴影的范围
}

- (UIViewController*)FYLViewController {
    
    UIResponder *nextResponder =  self;
    
    do {
        nextResponder = [nextResponder nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
            return (UIViewController*)nextResponder;
    } while (nextResponder != nil);
    
    return nil;
}

-(void)FYLRemoveAllChildren{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

+ (instancetype)FYLViewFromXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

@end
