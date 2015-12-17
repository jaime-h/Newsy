//
//  DetailVC.m
//  NewsyChallenge
//
//  Created by Jaime Hernandez on 12/12/15.
//  Copyright © 2015 Jaime Hernandez. All rights reserved.
//

#import "DetailVC.h"

@interface DetailVC ()
@property (strong, nonatomic) IBOutlet UITextView *overViewText;
@property (strong, nonatomic) IBOutlet UILabel *lang;
@property (strong, nonatomic) IBOutlet UILabel *releaseDate;

@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self strokeTextView];
  
    self.overViewText.text = self.movieOverviewText;
    self.lang.text = self.language;
    self.releaseDate.text = self.movieDate;
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)strokeTextView {
  
    self.overViewText.layer.borderColor = [[UIColor grayColor] CGColor];
    self.overViewText.layer.borderWidth = 1.0;
    self.overViewText.layer.cornerRadius = 8;
  
    self.lang.layer.borderColor = [[UIColor grayColor] CGColor];
    self.lang.layer.borderWidth = 1.0;
    self.lang.layer.cornerRadius = 4.0;
    
    self.releaseDate.layer.borderColor = [[UIColor grayColor] CGColor];
    self.releaseDate.layer.borderWidth = 1.0;
    self.releaseDate.layer.cornerRadius = 4.0;

  

}

@end
