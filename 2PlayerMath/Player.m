//
//  Player.m
//  2PlayerMath
//
//  Created by Javier Xing on 2017-11-06.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

#import "Player.h"

@implementation Player


- (instancetype)initWithName:(NSString*)name
{
    self = [super init];
    if (self) {
        _name = name;
        _score = 0;
        _lives = 3;
    }
    return self;
}

-(void)decreaseLives{
    self.lives--;
}
-(void)increaseScore{
    self.score++;
}

@end







