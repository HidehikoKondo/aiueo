//
//  ViewController.m
//  aiueo
//
//  Created by UDONKONET on 2017/05/27.
//  Copyright © 2017年 UDONKONET. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#include <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *hiraganaLabel;

@end

@implementation ViewController
AVSpeechSynthesizer *speechSynthesizer;


- (void)viewDidLoad {
    [super viewDidLoad];
    speechSynthesizer = [[AVSpeechSynthesizer alloc] init];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)speach:(id)sender {
    UIButton *button = sender;
    NSString *string = [[button titleLabel] text];
    [_hiraganaLabel setText:string];
    
    
    [speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];

    
    //NSString* speakingText = message;
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:string];
    utterance.rate = AVSpeechUtteranceMinimumSpeechRate;
    
    [speechSynthesizer speakUtterance:utterance];
}


@end
