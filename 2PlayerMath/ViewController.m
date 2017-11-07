//
//  ViewController.m
//  2PlayerMath
//
//  Created by Javier Xing on 2017-11-06.
//  Copyright © 2017 Javier Xing. All rights reserved.
//

#import "ViewController.h"
#import "GameModel.h"
#import "Player.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *player1Score;
@property (weak, nonatomic) IBOutlet UILabel *player2Score;
@property (weak, nonatomic) IBOutlet UILabel *player1Lives;
@property (weak, nonatomic) IBOutlet UILabel *player2Lives;

@property (weak, nonatomic) IBOutlet UILabel *userAnswerLabel;

@property (nonatomic, strong)GameModel *gameModel;
@property (nonatomic, strong)NSMutableString *userAnswer;
@property (nonatomic, strong)Player * currentPlayer;
@property (nonatomic, assign)int currentPlayerIndex;
@property (nonatomic, strong)NSArray *players;
@property (nonatomic, strong)Player *player1;
@property (nonatomic, strong)Player *player2;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    

}
-(void)setup {
    self.gameModel = [[GameModel alloc]init];
    self.userAnswer = [[NSMutableString alloc]init];
    self.player1 = [[Player alloc]initWithName:@"Player1"];
    self.player2 = [[Player alloc]initWithName:@"Player2"];
    self.players = @[self.player1, self.player2];
    self.currentPlayerIndex= 0;
    self.currentPlayer = self.players[self.currentPlayerIndex];
    self.questionLabel.text =  [NSString stringWithFormat:@"%@: %@",self.currentPlayer.name, [self.gameModel randomQuestion]];
    self.player1Score.text = [NSString stringWithFormat:@"Player1 Score: %d", self.player1.score];
    self.player2Score.text = [NSString stringWithFormat:@"Player2 Score: %d", self.player2.score];
    self.player1Lives.text = [NSString stringWithFormat:@"Player1 Lives: %d", self.player1.lives];
    self.player2Lives.text = [NSString stringWithFormat:@"Player2 Lives: %d", self.player2.lives];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)push1:(id)sender {
    [self.userAnswer appendString:@"1"];
    self.userAnswerLabel.text = self.userAnswer;
}

- (IBAction)push2:(id)sender {
    [self.userAnswer appendString:@"2"];
    self.userAnswerLabel.text = self.userAnswer;
}

- (IBAction)push3:(id)sender {
    [self.userAnswer appendString:@"3"];
    self.userAnswerLabel.text = self.userAnswer;
}

- (IBAction)push4:(id)sender {
    [self.userAnswer appendString:@"4"];
    self.userAnswerLabel.text = self.userAnswer;
}

- (IBAction)push5:(id)sender {
    [self.userAnswer appendString:@"5"];
    self.userAnswerLabel.text = self.userAnswer;
}

- (IBAction)push6:(id)sender {
    [self.userAnswer appendString:@"6"];
    self.userAnswerLabel.text = self.userAnswer;
}

- (IBAction)push7:(id)sender {
    [self.userAnswer appendString:@"7"];
    self.userAnswerLabel.text = self.userAnswer;
}

- (IBAction)push8:(id)sender {
    [self.userAnswer appendString:@"8"];
    self.userAnswerLabel.text = self.userAnswer;
}

- (IBAction)push9:(id)sender {
    [self.userAnswer appendString:@"9"];
    self.userAnswerLabel.text = self.userAnswer;
}

- (IBAction)code9:(id)sender {
    [self.userAnswer appendString:@"0"];
    self.userAnswerLabel.text = self.userAnswer;
}

- (IBAction)push0:(id)sender {
    [self.userAnswer appendString:@"1"];
    self.userAnswerLabel.text = self.userAnswer;
}

- (IBAction)pushEnter:(id)sender {
    int userAnswerNumber = [self.userAnswer intValue];
    if (userAnswerNumber == [self.gameModel calculateAnswer]){
        [self.currentPlayer increaseScore];
//        self.userAnswerLabel.text = @"Correct!";
//        self.userAnswerLabel.textColor = [UIColor greenColor];
//        [UIView animateWithDuration:1.0 delay:1.0 options: UIViewAnimationOptionTransitionNone animations:^{
//            self.userAnswerLabel.textColor = [[UIColor greenColor]colorWithAlphaComponent:1.0f];
//        } completion:nil];
        
        
    }
    else{
        [self.currentPlayer decreaseLives];
    }
    
    if (self.currentPlayer.lives == 0) {
        Player* winningPlayer = self.players[++self.currentPlayerIndex % [self.players count]];
        self.userAnswerLabel.text = [NSString stringWithFormat: @"%@ won!", winningPlayer.name];
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Congratulation!"
                                                                       message:[NSString stringWithFormat:@"%@ won!", winningPlayer.name]
                                                                preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction* restartGame = [UIAlertAction actionWithTitle:@"Restart" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {
//                                                                  Restarting game functionality
                                                                  [self setup];
                                                              }];
        UIAlertAction* exitGame = [UIAlertAction actionWithTitle:@"Exit" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {
                                                                  exit(0);
                                                              }];
        [alert addAction:exitGame];
        [alert addAction:restartGame];
        [self presentViewController:alert animated:YES completion:nil];
        
        
//      UIAlertController
    }
//    UIAlertController
//    Switch Players
    self.currentPlayerIndex++;
    self.currentPlayer = self.players[self.currentPlayerIndex % [self.players count]];
    
    
//    Reset the application interface
    self.questionLabel.text =  [NSString stringWithFormat:@"%@: %@",self.currentPlayer.name, [self.gameModel randomQuestion]];
    self.player1Score.text = [NSString stringWithFormat:@"Player1 Score: %d", self.player1.score];
    self.player2Score.text = [NSString stringWithFormat:@"Player2 Score: %d", self.player2.score];
    self.player1Lives.text = [NSString stringWithFormat:@"Player1 Lives: %d", self.player1.lives];
    self.player2Lives.text = [NSString stringWithFormat:@"Player2 Lives: %d", self.player2.lives];
    [self.userAnswer setString:@""];
    self.userAnswerLabel.text = self.userAnswer;
}
@end
