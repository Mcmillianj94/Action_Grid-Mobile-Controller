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
@property UIColor* actionSpaceSelectedColor;
@property float actionSpaceSize;
@property NSMutableArray* touchedActionSpaces;
@property NSString* lastTouchedName;

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

-(id)initWithScene: (SKScene*)scene actionSpaceSelectedColor: (UIColor*)asSelectedColor actionSpaceSize: (float)asSize
{
    if (self = [super init]) {
        self.parentScene = scene;
        self.actionSpaceSelectedColor = asSelectedColor;
        self.actionSpaceSize = asSize;
        self.touchedActionSpaces = [[NSMutableArray alloc] init];
        
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
        
        [self setUserInteractionEnabled:true];
    }
    return self;
};

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    
    UITouch* touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode* node = [self nodeAtPoint:location];
    
    //Make sure the touches are only objects in this node
    if (node.parent == self) {
        //make sure it's not nil
        if (node.name != nil) {
            [self whenTouched:node];
        }
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    
    UITouch* touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode* node = [self nodeAtPoint:location];
    
    //Make sure the touches are only objects in this node
    if (node.parent == self) {
        //dont add node.names already entered
        if (node.name != self.lastTouchedName) {
            //make sure it's not nil
            if (node.name != nil) {
                [self whenTouched:node];
            }
        }
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    
    /*
     When touches ended is called it check how many objects are in the self.touchedActionSpaces.
     With that number it decides which action method to call
     **Each count needs a different method to call
     Ex. if the count is 1 it has a different call than if the count were 2.
     */
    switch (self.touchedActionSpaces.count) {
        case 1:
            [self oneCountActions:self.touchedActionSpaces.copy];
            break;
        case 2:
            [self twoCountActions:self.touchedActionSpaces.copy];
            break;
        case 3:
            [self threeCountActions:self.touchedActionSpaces.copy];
            break;
        case 4:
            //Make method for four count
            break;
        case 5:
            //Make method for five count
            break;
        case 6:
            //Make method for six count
            break;
        case 7:
            //Make method for seven count
            break;
        case 8:
            //Make method for eight count
            break;
        case 9:
            //Make method for nine count
            break;
        default:
            break;
    }
    
    //Clears the selected Action Spaces added to the array and resets their fill color
    [self.touchedActionSpaces removeAllObjects];
    [self resetActionSpaces];
}

-(void) whenTouched: (SKNode*)node{
    //change to shapeNode so you can change the fill color when touched
    SKShapeNode* convertNode = (SKShapeNode*)node;
    convertNode.fillColor = self.actionSpaceSelectedColor;
    //Add name to array
    [self.touchedActionSpaces addObject: node.name];
    //set the lastTouchedName to the recent node.name
    self.lastTouchedName = node.name;
}

////
/*
 These are the methods called based on the count of the Self.touchedActionSpaces Array
 once inside the method it sets each index of the array to a variable so you know the order
 Action Spaces were selected.
 
 Once variables are set an if statment checks which Action Spaces were slected and in what order
 based on that outcome it will execute the action you set for that specific set of Action Spaces 
 and order.
 
 In the twoCountActions Method below i have an example of ordering in one if-statment it check if 
 five was selected first and the other checks if six was selected first and based on that it does a different action.
*/
-(void) oneCountActions: (NSArray*) actionsArray{
    NSString* onlyTouchedSpace = [actionsArray objectAtIndex:0];
    
    //Tap the Action Space four
    if (onlyTouchedSpace == self.idFour) {
        NSLog(@"Back Dash");
    //Tap the Action Space six
    }else if(onlyTouchedSpace == self.idSix){
        NSLog(@"Punch Action");
    }
}

-(void) twoCountActions: (NSArray*) actionsArray{
    NSString* firstTouchedSpace = [actionsArray objectAtIndex:0];
    NSString* secondTouchedSpace = [actionsArray objectAtIndex:1];
    
    //Start by tapping Action Space five then sliding to Action Space Six
    if (firstTouchedSpace == self.idFive && secondTouchedSpace == self.idSix) {
        NSLog(@"Dash Punch Action");
    //Start by tapping Action Space Six then sliding to Action Space Five
    }else if (firstTouchedSpace == self.idSix && secondTouchedSpace == self.idFive){
        NSLog(@"Punch Back Dash Action");
    }
}

-(void) threeCountActions: (NSArray*) actionsArray{
    NSString* firstTouchedSpace = [actionsArray objectAtIndex:0];
    NSString* secondTouchedSpace = [actionsArray objectAtIndex:1];
    NSString* thirdTouchedSpace = [actionsArray objectAtIndex:2];
    
    //Start by tapping Action Space four then sliding to Action Space one the sliding to Action Space Two
    if (firstTouchedSpace == self.idFour && secondTouchedSpace == self.idOne && thirdTouchedSpace ==  self.idTwo) {
        NSLog(@"Forward Air Dash");
    }
}

-(void) fourCountActions: (NSArray*) actionsArray{
}

-(void) fiveCountActions: (NSArray*) actionsArray{
}

-(void) sixCountActions: (NSArray*) actionsArray{
}

-(void) sevenCountActions: (NSArray*) actionsArray{
}

-(void) eightCountActions: (NSArray*) actionsArray{
}

-(void) nineCountActions: (NSArray*) actionsArray{
}
////

//When the touches are done this method resets the fill color back to nil
-(void)resetActionSpaces{
    self.actionSpaceOne.fillColor = nil;
    self.actionSpaceTwo.fillColor = nil;
    self.actionSpaceThree.fillColor = nil;
    self.actionSpaceFour.fillColor = nil;
    self.actionSpaceFive.fillColor = nil;
    self.actionSpaceSix.fillColor = nil;
    self.actionSpaceSeven.fillColor = nil;
    self.actionSpaceEight.fillColor = nil;
    self.actionSpaceNine.fillColor = nil;
}
@end
