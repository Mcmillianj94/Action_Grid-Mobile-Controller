//
//  GameScene.m
//  ActionGridIOS
//
//  Created by Joshua on 2/27/15.
//  Copyright (c) 2015 Joshua. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    ActionGrid* actionGrid = [[ActionGrid alloc] initWithScene:self actionSpaceSelectedColor: [UIColor blueColor]  actionSpaceBorderColor: [UIColor blackColor] actionSpaceSize:50.0f];
    actionGrid.position = CGPointMake(self.size.width/4, self.size.height/2);
    [self addChild:actionGrid];
    
    ActionGrid* circleGrid = [[ActionGrid alloc] initWithSceneForCircleStyle:self actionSpaceSelectedColor:[UIColor redColor] actionSpaceBorderColor:[UIColor whiteColor] actionSpaceRadius:20.0f];
    circleGrid.position = CGPointMake(self.size.width/2, self.size.height/2);
    [self addChild:circleGrid];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
