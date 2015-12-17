//
//  DetailVC.m
//  NewsyChallenge
//
//  Created by Jaime Hernandez on 12/12/15.
//  Copyright © 2015 Jaime Hernandez. All rights reserved.
//

#import "DetailVC.h"

@interface DetailVC ()


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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
