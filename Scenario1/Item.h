//
//  Item.h
//  ThreadSafeClassDesign
//
//  Created by bluecats on 5/11/2015.
//  Copyright © 2015 jiakai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemProtocol.h"

@interface Item : NSObject<ItemProtocol>

@property(nonatomic, assign) NSUInteger itemCount;

@end
