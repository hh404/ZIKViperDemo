//
//  ZIKTTextWidgetViewPresenter.m
//  ZIKTViperDemo
//
//  Created by zuik on 2017/7/17.
//  Copyright © 2017年 zuik. All rights reserved.
//

#import "ZIKTTextWidgetViewPresenter.h"
#import "ZIKTViperView.h"
#import "ZIKTViperPresenterPrivate.h"
#import "ZIKTViperWireframe.h"

#import "ZIKTTextWidgetViewProtocol.h"
#import "ZIKTTextWidgetInteractorInput.h"
#import "ZIKTTextWidgetInteractorDataSource.h"
#import "ZIKTTextWidgetInteractorEventHandler.h"

#import "ZIKTLoginViewProtocol.h"

@interface ZIKTTextWidgetViewPresenter () <ZIKTViperPresenterPrivate,ZIKTTextWidgetInteractorDataSource,ZIKTTextWidgetInteractorEventHandler>
@property (nonatomic, strong) id<ZIKTViperWireframe> wireframe;
@property (nonatomic, weak) id<ZIKTViperView,ZIKTTextWidgetViewProtocol> view;
@property (nonatomic, strong) id<ZIKTViperInteractor,ZIKTTextWidgetInteractorInput> interactor;
@end

@implementation ZIKTTextWidgetViewPresenter

#pragma mark ZIKTViperViewEventHandler

- (void)handleViewReady {
    NSAssert([self.view conformsToProtocol:@protocol(ZIKTTextWidgetViewProtocol)], @"Presenter should be attach to a view.");
    NSAssert([self.interactor conformsToProtocol:@protocol(ZIKTTextWidgetInteractorInput)], @"Interactor should be initlized when view is ready.");
    
    [self.view setPrefixText:[self.interactor copyrightDescription]];
}

- (void)handleViewWillAppear:(BOOL)animated {
    
}

- (void)handleViewDidAppear:(BOOL)animated {
    //UIView 's handleViewDidAppear: from -didMoveToWindow is not accurate, the view may not be displayed yet, still in will appear, so present another view controller may failed.
    
}

- (void)handleViewWillDisappear:(BOOL)animated {
    
}

- (void)handleViewDidDisappear:(BOOL)animated {
    
}

- (void)handleViewRemoved {
    
}

#pragma mark ZIKTLoginViewDelegate

//- (void)loginViewController:(UIViewController *)loginViewController didLoginWithAccount:(NSString *)account {
//    [self.interactor didLoginedWithAccount:account];
//}

#pragma mark ZIKTTextWidgetInteractorDataSource

#pragma mark ZIKTTextWidgetInteractorEventHandler

@end
