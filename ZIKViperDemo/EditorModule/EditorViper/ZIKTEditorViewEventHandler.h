//
//  ZIKTEditorViewEventHandler.h
//  ZIKTViperDemo
//
//  Created by zuik on 2017/7/16.
//  Copyright © 2017年 zuik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZIKTViperViewEventHandler.h"
#import "ZIKTTextViewDataSource.h"

@protocol ZIKTViperRouter;
@protocol ZIKTEditorViewEventHandler <ZIKTViperViewEventHandler>
- (void)didTouchNavigationBarDoneButton;
- (id<ZIKTViperRouter>)router;//向下子View传递
@end
