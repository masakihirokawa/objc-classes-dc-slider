DCSlider
======================

Objective-Cで通常のスライダーと画像スライダーを取得する「DCSlider」クラスです。

##使用方法

###通常のスライダー取得

```objective-c
UISlider *slider = [DCSlider planeSlider:self rect:CGRectMake(50, 100, 220, 0)
                               minVolume:0.0 maxVolume:1.0 defaultVolume:0.5f continuous:NO
                                     tag:1 selector:@selector(sliderChangedEvent:)];
```

###画像スライダー取得

```objective-c
//つまみのサムネイル画像
UIImage *imageForThumb = [self getUIImageFromResources:@"slider_thumb" ext:@"png"];

//つまみのサムネイル画像 (ハイライト時)
UIImage *imageForThumbHighlited = [self getUIImageFromResources:@"slider_thumb-o" ext:@"png"];

//スライダーのベース画像
UIImage *imageMinBase = [self getUIImageFromResources:@"slider_min" ext:@"png"];
UIImage *imageMaxBase = [self getUIImageFromResources:@"slider_max" ext:@"png"];

UISlider *imageSlider = [DCSlider imageSlider:self rect:CGRectMake(50, 200, 224, 22)
                                    minVolume:0.0 maxVolume:1.0 defaultVolume:0.5f continuous:NO
                                   thumbImage:imageForThumb thumbHighlitedImage:imageForThumbHighlited minImage:imageMinBase maxImage:imageMaxBase
                                          tag:1 selector:@selector(sliderChangedEvent:)];
```
