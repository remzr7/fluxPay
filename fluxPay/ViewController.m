//
//  ViewController.m
//  fluxPay
//
//  Created by Rameez Remsudeen  on 2/25/15.
//  Copyright (c) 2015 Rameez Remsudeen. All rights reserved.
//

#import "ViewController.h"
#import "TextFieldEffects.h"
#import <APNumberPad.h>

#import <APNumberPadStyle.h>
#import "APDarkPadStyle.h"



@interface ViewController ()<APNumberPadStyle>
@property (weak, nonatomic) IBOutlet UITextField *NumberField;
@property (weak, nonatomic) IBOutlet UITextField *moneyField;

@end

@implementation ViewController


- (UIColor *)numberPadBackgroundColor
{
    return [UIColor clearColor];
    
}

- (UIColor *)numberButtonBackgroundColor
{
    return [UIColor clearColor];

}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BG1"]];
    
    [self.view insertSubview:imageView atIndex:0];
    
    UIBlurEffect * blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView * view = [[UIVisualEffectView alloc] initWithEffect:blur];
    view.frame = self.view.bounds;
    [self.view insertSubview:view atIndex:1];
    self.NumberField.keyboardAppearance = UIKeyboardAppearanceDark;
    self.moneyField.keyboardAppearance = UIKeyboardAppearanceDark;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)numberPad:(APNumberPad *)numberPad functionButtonAction:(UIButton *)functionButton textInput:(UIResponder<UITextInput> *)textInput {
    [textInput insertText:@"#"];
}
@end
