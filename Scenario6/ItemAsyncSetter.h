//
//  ItemAsyncSetter.h
//  ThreadSafeClassDesign
//
//  Created by bluecats on 6/11/2015.
//  Copyright © 2015 jiakai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemProtocol.h"

@interface ItemAsyncSetter : NSObject <ItemProtocol>

@property(nonatomic, copy) NSArray *subItems;

@end
