//
//  DetailVC.h
//  NewsyChallenge
//
//  Created by Jaime Hernandez on 12/12/15.
//  Copyright © 2015 Jaime Hernandez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailVC : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *overViewText;
@property (strong, nonatomic) IBOutlet UILabel *lang;
@property (strong, nonatomic) IBOutlet UILabel *releaseDate;

@property (strong, nonatomic) NSString *movieOverviewText;
@property (strong, nonatomic) NSString *movieDate;
@property (strong, nonatomic) NSString *language;


@end
