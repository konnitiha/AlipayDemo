//
//  UIView+FYLExt.h
//  享泊享停车
//
//  Created by eparking2 on 16/2/19.
//  Copyright © 2016年 eparking. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FYLExt)

@property(nonatomic,assign)CGFloat fyl_x;
@property(nonatomic,assign)CGFloat fyl_y;
@property(nonatomic,assign)CGFloat fyl_w;
@property(nonatomic,assign)CGFloat fyl_h;
@property(nonatomic,assign)CGFloat fyl_right;
@property(nonatomic,assign)CGFloat fyl_bottom;
@property(nonatomic,assign)CGFloat fyl_centerX;
@property(nonatomic,assign)CGFloat fyl_centerY;
@property(nonatomic,assign)CGSize fyl_size;
@property(nonatomic,assign)CGPoint fyl_origin;

/**
 圆角
 */
@property (nonatomic,assign)IBInspectable CGFloat fyl_cornerRadius;
/**
 *  边框颜色
 */
@property IBInspectable UIColor *fyl_bordColor;

/**
 *  边框宽度
 */
@property IBInspectable CGFloat fyl_borderWidth;
- (void)FYLMoveBy:(CGPoint)delta;
- (void)FYLScaleBy:(CGFloat)scaleFactor;
- (void)addShadow:(UIColor *)color opacity:(CGFloat)opacity radius:(CGFloat)radius offset:(CGSize)offset;
/**
 *  获取view的viewController
 *
 *  @return 返回view的viewController
 */
- (UIViewController*)FYLViewController;

/**
 *  删除view里的所有子view
 */
- (void)FYLRemoveAllChildren;

/**
 *  初始化xib
 *
 */
+ (instancetype)FYLViewFromXib;

@end
