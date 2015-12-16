//
//  ViewController.h
//  NewsyChallenge
//
//  Created by Jaime Hernandez on 12/11/15.
//  Copyright © 2015 Jaime Hernandez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic, strong) NSArray *topMovies;

typedef enum
{
  MovieYear = 0,
  MovieMonth,
  MovieDay,
} MovieDate; // Enum for movie date components not to use "magical numbers" for index
@end

