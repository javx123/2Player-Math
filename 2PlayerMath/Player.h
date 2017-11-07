//
//  Player.h
//  2PlayerMath
//
//  Created by Javier Xing on 2017-11-06.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) int lives;
@property (nonatomic) int score;

-(void)decreaseLives;
-(void)increaseScore;
- (instancetype)initWithName:(NSString*)name;

@end
