//
//  ActionGrid.h
//  ActionGridIOS
//
//  Created by Joshua on 2/27/15.
//  Copyright (c) 2015 Joshua. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface ActionGrid : SKSpriteNode
-(id)initWithScene: (SKScene*)scene actionSpaceColors: (NSArray*)asColors actionSpaceSize: (float)asSize;
@end
