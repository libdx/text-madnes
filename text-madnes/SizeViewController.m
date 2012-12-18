//
//  SizeViewController.m
//  text-madnes
//
//  Created by Alexander Ignatenko on 12/18/12.
//  Copyright (c) 2012 Alexander Ignatenko. All rights reserved.
//

#import "SizeViewController.h"
#import "TextDrawingView.h"
#import "AppDelegate.h"

@interface SizeViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet TextDrawingView *verificationView;

@end

@implementation SizeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (CGSize)sizeForTextView:(UITextView *)textView
{
    CGSize constrainedSize = CGSizeMake(textView.width, MAXFLOAT);
    constrainedSize.width -= 2*kTextViewTextOffset.x;
    CGSize res = [textView.text sizeWithFont:textView.font constrainedToSize:constrainedSize lineBreakMode:NSLineBreakByWordWrapping];
    res.width += 2*kTextViewTextOffset.x;
    res.height += 2*kTextViewTextOffset.y;
    return res;
}

- (void)textViewDidChange:(UITextView *)textView
{
    CGSize size = [self sizeForTextView:textView];
    _verificationView.text = textView.text;
    _verificationView.size = size;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Size";
    _textView.delegate = self;
    _verificationView.text = _textView.text;
    _verificationView.font = _textView.font;
    _verificationView.multiline = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
