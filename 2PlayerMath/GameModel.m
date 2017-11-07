//
//  GameModel.m
//  2PlayerMath
//
//  Created by Javier Xing on 2017-11-06.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _rightValue = arc4random_uniform(20)+1;
        _rightValue = arc4random_uniform(20)+1;
    }
    return self;
}

-(NSString*)randomQuestion{
    self.rightValue = arc4random_uniform(20)+1;
    self.leftValue = arc4random_uniform(20)+1;
    return [NSString stringWithFormat:@"%d + %d = ?",self.rightValue, self.leftValue];
}

-(int)calculateAnswer{
    return self.rightValue + self.leftValue;
}

@end
