//
//  ZIKTTextViewWireframe.m
//  ZIKthoroughViperDemo
//
//  Created by zuik on 2017/8/3.
//  Copyright © 2017年 zuik. All rights reserved.
//

#import "ZIKTTextViewWireframe.h"
#import "ZIKTViperWireframePrivate.h"
#import "ZIKTViperView.h"

@interface ZIKTTextViewWireframe () <ZIKTViperWireframePrivate>
@property (nonatomic, weak) id<ZIKTViperView> view;
@property (nonatomic, strong) id<ZIKTViperRouter> router;
@end

@implementation ZIKTTextViewWireframe

@end
