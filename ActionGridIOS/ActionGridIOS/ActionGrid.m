//
//  ActionGrid.m
//  ActionGridIOS
//
//  Created by Joshua on 2/27/15.
//  Copyright (c) 2015 Joshua. All rights reserved.
//

#import "ActionGrid.h"
@interface ActionGrid()

//Data
@property SKScene* parentScene;
@property NSArray* actionSpaceColors;
@property float actionSpaceSize;

//Action Spaces
@property SKShapeNode* actionSpaceOne;
@property SKShapeNode* actionSpaceTwo;
@property SKShapeNode* actionSpaceThree;
@property SKShapeNode* actionSpaceFour;
@property SKShapeNode* actionSpaceFive;
@property SKShapeNode* actionSpaceSix;
@property SKShapeNode* actionSpaceSeven;
@property SKShapeNode* actionSpaceEight;
@property SKShapeNode* actionSpaceNine;

//Action Space Names
@property NSString* idOne;
@property NSString* idTwo;
@property NSString* idThree;
@property NSString* idFour;
@property NSString* idFive;
@property NSString* idSix;
@property NSString* idSeven;
@property NSString* idEight;
@property NSString* idNine;

@end

@implementation ActionGrid

-(id)initWithScene: (SKScene*)scene actionSpaceColors: (NSArray*)asColors actionSpaceSize: (float)asSize
{
    if (self = [super init]) {
        self.parentScene = scene;
        self.actionSpaceColors = asColors;
        self.actionSpaceSize = asSize;
        
        self.idOne = @"1";
        self.idTwo = @"2";
        self.idThree = @"3";
        self.idFour = @"4";
        self.idFive = @"5";
        self.idSix = @"6";
        self.idSeven = @"7";
        self.idEight = @"8";
        self.idNine = @"9";
        
        self.actionSpaceOne = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(self.actionSpaceSize, self.actionSpaceSize)];
        self.actionSpaceOne.position = CGPointMake(-(self.actionSpaceSize), self.actionSpaceSize);
        self.actionSpaceOne.lineWidth = 2.0f;
        self.actionSpaceOne.name = self.idOne;
        [self addChild:self.actionSpaceOne];
        
        self.actionSpaceTwo = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(self.actionSpaceSize, self.actionSpaceSize)];
        self.actionSpaceTwo.position = CGPointMake(0, self.actionSpaceSize);
        self.actionSpaceTwo.lineWidth = 2.0f;
        self.actionSpaceTwo.name = self.idTwo;
        [self addChild:self.actionSpaceTwo];
        
        self.actionSpaceThree = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(self.actionSpaceSize, self.actionSpaceSize)];
        self.actionSpaceThree.position = CGPointMake(self.actionSpaceSize, self.actionSpaceSize);
        self.actionSpaceThree.lineWidth = 2.0f;
        self.actionSpaceThree.name = self.idThree;
        [self addChild:self.actionSpaceThree];
        
        self.actionSpaceFour = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(self.actionSpaceSize, self.actionSpaceSize)];
        self.actionSpaceFour.position = CGPointMake(-(self.actionSpaceSize), 0);
        self.actionSpaceFour.lineWidth = 2.0f;
        self.actionSpaceFour.name = self.idFour;
        [self addChild:self.actionSpaceFour];
        
        self.actionSpaceFive = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(self.actionSpaceSize, self.actionSpaceSize)];
        self.actionSpaceFive.position = CGPointMake(0, 0);
        self.actionSpaceFive.lineWidth = 2.0f;
        self.actionSpaceFive.name = self.idFive;
        [self addChild:self.actionSpaceFive];
        
        self.actionSpaceSix = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(self.actionSpaceSize, self.actionSpaceSize)];
        self.actionSpaceSix.position = CGPointMake(self.actionSpaceSize, 0);
        self.actionSpaceSix.lineWidth = 2.0f;
        self.actionSpaceSix.name = self.idSix;
        [self addChild:self.actionSpaceSix];
        
        self.actionSpaceSeven = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(self.actionSpaceSize, self.actionSpaceSize)];
        self.actionSpaceSeven.position = CGPointMake(-(self.actionSpaceSize), -(self.actionSpaceSize));
        self.actionSpaceSeven.lineWidth = 2.0f;
        self.actionSpaceSeven.name = self.idSeven;
        [self addChild:self.actionSpaceSeven];
        
        self.actionSpaceEight = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(self.actionSpaceSize, self.actionSpaceSize)];
        self.actionSpaceEight.position = CGPointMake(0, -(self.actionSpaceSize));
        self.actionSpaceEight.lineWidth = 2.0f;
        self.actionSpaceEight.name = self.idEight;
        [self addChild:self.actionSpaceEight];
        
        self.actionSpaceNine = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(self.actionSpaceSize, self.actionSpaceSize)];
        self.actionSpaceNine.position = CGPointMake(self.actionSpaceSize, -(self.actionSpaceSize));
        self.actionSpaceNine.lineWidth = 2.0f;
        self.actionSpaceNine.name = self.idNine;
        [self addChild:self.actionSpaceNine];
    }
    return self;
};
@end
