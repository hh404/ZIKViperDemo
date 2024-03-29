//
//  ZIKTLoginViewController.m
//  ZIKTViperDemo
//
//  Created by zuik on 2017/7/15.
//  Copyright © 2017年 zuik. All rights reserved.
//

#import "ZIKTLoginViewController.h"
#import "ZIKTViperViewPrivate.h"
#import "UIViewController+ZIKTViperRouter.h"
#import "ZIKTLoginViewEventHandler.h"

@interface ZIKTLoginViewController () <ZIKTViperViewPrivate>
@property (nonatomic, assign) BOOL appeared;
@property (nonatomic, strong) id<ZIKTLoginViewEventHandler> eventHandler;
@property (nonatomic, strong) id viewDataSource;
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@end

@implementation ZIKTLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.message) {
        self.messageLabel.text = self.message;
    }
}

- (UIViewController *)routeSource {
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.appeared == NO) {
        NSAssert([self.eventHandler conformsToProtocol:@protocol(ZIKTLoginViewEventHandler)], nil);
        if ([self.eventHandler respondsToSelector:@selector(handleViewReady)]) {
            [self.eventHandler handleViewReady];
        }
        self.appeared = YES;
    }
    if ([self.eventHandler respondsToSelector:@selector(handleViewWillAppear:)]) {
        [self.eventHandler handleViewWillAppear:animated];
    };
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if ([self.eventHandler respondsToSelector:@selector(handleViewDidAppear:)]) {
        [self.eventHandler handleViewDidAppear:animated];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if ([self.eventHandler respondsToSelector:@selector(handleViewWillDisappear:)]) {
        [self.eventHandler handleViewWillDisappear:animated];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if ([self.eventHandler respondsToSelector:@selector(handleViewDidDisappear:)]) {
        [self.eventHandler handleViewDidDisappear:animated];
    }
    if (self.ZIK_isRemoving == YES) {
        if ([self.eventHandler respondsToSelector:@selector(handleViewRemoved)]) {
            [self.eventHandler handleViewRemoved];
        }
    }
}

- (IBAction)startLogin:(id)sender {
    [self.eventHandler didTouchLoginButton];
}

- (nullable NSString *)account {
    return self.accountTextField.text;
}

- (nullable NSString *)password {
    return self.passwordTextField.text;
}

- (void)setMessage:(NSString *)message {
    self.messageLabel.text = message;
    _message = message;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
