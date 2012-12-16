//
//  ViewController.m
//  text-madnes
//
//  Created by Alexander Ignatenko on 12/15/12.
//  Copyright (c) 2012 Alexander Ignatenko. All rights reserved.
//

#import "ViewController.h"
#import "TextDrawingView.h"
#import "AppDelegate.h"

@interface ViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet TextDrawingView *verificationView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@end

static const CGFloat kTextViewMinHeight = 100.0f; // must depend on font
static const CGFloat kTextViewMinWidth = 100.0f; // must depend on font

@implementation ViewController

- (CGFloat)widthForTextView:(UITextView *)textView
{
    UIFont *font = [UIFont fontWithName:textView.font.fontName size:textView.font.pointSize];
    return [textView.text sizeWithFont:font forWidth:kTextViewMaxWidth lineBreakMode:NSLineBreakByTruncatingTail].width + 2*kTextViewTextOffset.x;
}

- (void)textViewDidChange:(UITextView *)textView
{
    // FIXME: new lines should not affect on width calculation
    CGFloat width = [self widthForTextView:textView];
    if (width < kTextViewMinWidth)
        width = kTextViewMinWidth;
    NSLog(@"%f", width);
    _verificationView.width = width;
    _verificationView.text = textView.text;
    _label.text = _textView.text;
    [_label sizeToFit];
    textView.width = width;
    if (textView.contentSize.height > kTextViewMinHeight)
        textView.height = textView.contentSize.height;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _textView.delegate = self;
    _verificationView.text = _textView.text;
    _verificationView.font = _textView.font;
    _label.left += kTextViewTextOffset.x;
    _label.text = _textView.text;
    _label.font = _textView.font;
    [_label sizeToFit];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionDemo:(id)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        _verificationView.origin = _textView.origin;
        _verificationView.alpha = 0.3;
    }];
}

- (IBAction)actionLabelDemo:(id)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        _label.origin = CGPointMake(_textView.left+kTextViewTextOffset.x,
                                    _textView.top+kTextViewTextOffset.y);
        _label.alpha = 0.3;
    }];
}

@end
