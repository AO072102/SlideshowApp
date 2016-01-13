//
//  ViewController.m
//  SlideshowApp
//
//  Created by gmmikan on 2016/01/13.
//  Copyright © 2016年 shunsuke.mikawa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    // 進むボタン
    UIButton *nextBuutton;
    
    // 戻るボタン
    UIButton *previousButton;

    // 表示する背景画像
    UIImageView *backgroundView;
    
    // 背景画像一覧
    NSArray *imageArray;
    
    // 表示する画像インデックス
    NSInteger imageCount;
}
@end

@implementation ViewController

- (void)setupParts {
    backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    backgroundView.image = [UIImage imageNamed:@"flower0.png"];
    [self.view addSubview:backgroundView];
    
    nextBuutton = [UIButton buttonWithType:UIButtonTypeSystem];
    nextBuutton.frame = CGRectMake(0, 0, 150, 50);
    nextBuutton.center = CGPointMake(240, 400);
    [nextBuutton setTitle:@"次へ" forState: UIControlStateNormal];
    [nextBuutton addTarget:self action:@selector(nextImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBuutton];
    
    
    previousButton = [UIButton buttonWithType:UIButtonTypeSystem];
    previousButton.frame = CGRectMake(0, 0, 50, 50);
    previousButton.center = CGPointMake(80, 400);
    [previousButton setTitle:@"前へ" forState: UIControlStateNormal];
    [previousButton addTarget:self action:@selector(previousImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:previousButton];
    
}

- (void)nextImage:(id)sender {
    if (imageCount == imageArray.count - 1) {
        imageCount = 0;
    } else {
        imageCount++;
    }
    backgroundView.image = [UIImage imageNamed:imageArray[imageCount]];
}

- (void)previousImage:(id)sender {
    if (imageCount == 0) {
        imageCount = imageArray.count - 1;
    } else {
        imageCount--;
    }
    backgroundView.image = [UIImage imageNamed:imageArray[imageCount]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // ボタンとイメージビューを作成
    [self setupParts];
    
    imageCount = 0;
    imageArray = @[@"flower0.png", @"flower1.png", @"flower2.png", @"flower3.png"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
