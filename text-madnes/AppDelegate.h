//
//  AppDelegate.h
//  text-madnes
//
//  Created by Alexander Ignatenko on 12/15/12.
//  Copyright (c) 2012 Alexander Ignatenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WidthViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) WidthViewController *viewController;

@end


extern const CGFloat kTextViewMaxWidth;
extern const CGPoint kTextViewTextOffset;