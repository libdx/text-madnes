//
//  TextDrawingView.m
//  text-madnes
//
//  Created by Alexander Ignatenko on 12/15/12.
//  Copyright (c) 2012 Alexander Ignatenko. All rights reserved.
//

#import "TextDrawingView.h"
#import "AppDelegate.h"

@implementation TextDrawingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    [self.layer setNeedsDisplay];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    UIGraphicsPushContext(ctx);
    [_text drawAtPoint:kTextViewTextOffset forWidth:kTextViewMaxWidth withFont:_font lineBreakMode:NSLineBreakByTruncatingTail];
    UIGraphicsPopContext();
}

- (void)setText:(NSString *)text
{
    _text = text;
    [self.layer setNeedsDisplay];
}

- (void)setFont:(UIFont *)font
{
    _font = font;
    [self.layer setNeedsDisplay];
}


@end
