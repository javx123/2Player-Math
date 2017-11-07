//
//  GameModel.h
//  2PlayerMath
//
//  Created by Javier Xing on 2017-11-06.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameModel : NSObject
@property (nonatomic, assign) int leftValue;
@property (nonatomic, assign) int rightValue;


-(int)calculateAnswer;
-(NSString*)randomQuestion;

@end
