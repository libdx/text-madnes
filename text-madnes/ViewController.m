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
@end

static const CGFloat kTextViewMinHeight = 100.0f; // must depend on font

@implementation ViewController

- (CGFloat)widthForTextView:(UITextView *)textView
{
    UIFont *font = [UIFont fontWithName:textView.font.fontName size:textView.font.pointSize];
    return [textView.text sizeWithFont:font forWidth:kTextViewMaxWidth lineBreakMode:NSLineBreakByTruncatingTail].width + 16;
}

- (void)textViewDidChange:(UITextView *)textView
{
    CGFloat width = [self widthForTextView:textView];
    NSLog(@"%f", width);
    _verificationView.width = width;
    _verificationView.text = textView.text;
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
