//
//  ItemAsyncSetter.m
//  ThreadSafeClassDesign
//
//  Created by bluecats on 6/11/2015.
//  Copyright © 2015 jiakai. All rights reserved.
//

#import "ItemAsyncSetter.h"

@implementation ItemAsyncSetter

@synthesize subItems = _subItems;

- (instancetype)init
{
    self = [super init];
    if (self) {
        _subItems = [NSArray array];
    }
    return self;
}

- (NSArray *)subItems {
    __block NSArray* array;
    dispatch_sync(self.syncQueue, ^{
        array = _subItems;
    });
    return array;
}

//- (void)setsubItems:(NSArray *)subItemArray {
//    __block NSArray * array = subItemArray.copy;
//    dispatch_async(self.syncQueue, ^{
//        _subItems = array;
//    });
//}

- (void)addsubItem:(NSString *)string
{
    dispatch_sync(self.syncQueue, ^{
        NSMutableArray * array = [NSMutableArray arrayWithArray:_subItems];
        [array addObject:string];
        self.subItems = array;
    });
}

#pragma mark - Private Properties
- (dispatch_queue_t)syncQueue {
    static dispatch_queue_t queue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue = dispatch_queue_create("com.jiakai.ItemAsyncSetter", DISPATCH_QUEUE_SERIAL);
    });
    
    return queue;
}

@end
