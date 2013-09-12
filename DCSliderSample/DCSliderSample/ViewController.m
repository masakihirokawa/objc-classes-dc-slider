//
//  ViewController.m
//  DCSliderSample
//
//  Created by 廣川政樹 on 2013/09/10.
//  Copyright (c) 2013年 Masaki Hirokawa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

typedef enum sliderId : NSUInteger {
    PLANE_SLIDER = 1,
    IMAGE_SLIDER = 2
} sliderId;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //スライダー配置
    [self setSlider];
    
    //画像スライダー配置
    [self setImageSlider];
}

//スライダー配置
- (void)setSlider
{
    UISlider *slider = [DCSlider planeSlider:self rect:CGRectMake(50, 100, 220, 0)
                                   minVolume:SLIDER_MIN_VOLUME maxVolume:SLIDER_MAX_VOLUME defaultVolume:SLIDER_DEF_VOLUME continuous:NO
                                         tag:PLANE_SLIDER selector:@selector(sliderChangedEvent:)];
    [self.view addSubview:slider];
}

//画像スライダー配置
- (void)setImageSlider
{
    UIImage *imageForThumb = [self getUIImageFromResources:@"slider_thumb" ext:@"png"];
    UIImage *imageForThumbHighlited = [self getUIImageFromResources:@"slider_thumb-o" ext:@"png"];
    UIImage *imageMinBase = [self getUIImageFromResources:@"slider_min" ext:@"png"];
    UIImage *imageMaxBase = [self getUIImageFromResources:@"slider_max" ext:@"png"];
    UISlider *imageSlider = [DCSlider imageSlider:self rect:CGRectMake(50, 200, 224, 22)
                                        minVolume:SLIDER_MIN_VOLUME maxVolume:SLIDER_MAX_VOLUME defaultVolume:SLIDER_DEF_VOLUME continuous:NO
                                       thumbImage:imageForThumb thumbHighlitedImage:imageForThumbHighlited minImage:imageMinBase maxImage:imageMaxBase
                                              tag:IMAGE_SLIDER selector:@selector(sliderChangedEvent:)];
    [self.view addSubview:imageSlider];
}

//スライダー変更時のイベント
- (void)sliderChangedEvent:(UISlider *)slider
{
    NSUInteger tag = slider.tag;
    if (tag == PLANE_SLIDER) {
        NSLog(@"sliderValue: %f", slider.value);
    } else if (tag == IMAGE_SLIDER) {
        NSLog(@"imageSliderValue: %f", slider.value);
    }
}

//画像ファイル取得
- (UIImage *)getUIImageFromResources:(NSString*)fileName ext:(NSString*)ext
{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:ext];
    UIImage *img = [[UIImage alloc] initWithContentsOfFile:path];
    return (img);
}

@end
