//
//  ZIKTEditorInteractorDataSource.h
//  ZIKTViperDemo
//
//  Created by zuik on 2017/7/17.
//  Copyright © 2017年 zuik. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZIKTEditorInteractorDataSource <NSObject>
- (nullable NSString *)currentEditingNoteTitle;
- (nullable NSString *)currentEditingNoteContent;
@end
