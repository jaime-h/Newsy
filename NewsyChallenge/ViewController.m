//
//  ViewController.m
//  NewsyChallenge
//
//  Created by Jaime Hernandez on 12/11/15.
//  Copyright © 2015 Jaime Hernandez. All rights reserved.
//

#import "ViewController.h"
#import "MovieInfo.h"
#import "DetailVC.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"

#define APIKey @"232f72a9ddf4da165eb64d7ac7168102"
#define APIUrl @"http://api.themoviedb.org/3/movie/top_rated?"
#define APIImg @"http://image.tmdb.org/t/p/w500"


@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSDictionary *topMovieDict;
@property (nonatomic, strong) UITableView  *movieTableView;
@property (nonatomic, strong) IBOutlet UITableView *mytableView;
@property (nonatomic, strong) NSArray *displayMovieArray;

@property (nonatomic) NSNumber* pageValue;
@property (nonatomic) int pageCounter;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageValue = [NSNumber numberWithInt:1];
//    [self setUpRefreshControl];
    [self callAPI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)callAPI
{
    // Spinner on
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
  
    NSString *urlString = [NSString stringWithFormat:@"%@api_key=%@", APIUrl, APIKey];
    NSURL *baseURL = [NSURL URLWithString:urlString];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSDictionary *parameters = @{ @"sort_by": @"vote_average.desc",
                                  @"page": self.pageValue};

  [manager GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
     
      // Check for paging, create it intitally for page 1 or add to it for subsiquent calls..
      if (self.pageValue.intValue > 1) {
        self.topMovies = [self.topMovies arrayByAddingObjectsFromArray:responseObject[@"results"]];
      } else {
        self.topMovies = responseObject[@"results"];
      }
      
      // page parameters takes an object - NSNumber gymnastics to add and send it as object..
      self.pageValue = @(self.pageValue.intValue + 1);
      [self.mytableView reloadData];

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
      [self displayUIAlert:error];
    }];
  
    // spinner off
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}


-(void)displayUIAlert :(NSError *)error {
  
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error Retrieving Movies"
                                                                 message:[error localizedDescription]
                                                          preferredStyle:UIAlertControllerStyleAlert];
  
  UIAlertAction* ok = [UIAlertAction
                       actionWithTitle:@"OK"
                       style:UIAlertActionStyleDefault
                       handler:^(UIAlertAction * action)
                       {
                         [alert dismissViewControllerAnimated:YES completion:nil];
                         
                       }];
  
  UIAlertAction* cancel = [UIAlertAction
                           actionWithTitle:@"Cancel"
                           style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction * action)
                           {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                           }];
  
  [alert addAction:ok];
  [alert addAction:cancel];
  
  [self presentViewController:alert animated:YES completion:nil];
  
}

#pragma mark - UIRefresh Control

//-(void)setUpRefreshControl {
//  // http://stackoverflow.com/questions/12497940/uirefreshcontrol-without-uitableviewcontroller/12502450#12502450
//  // http://stackoverflow.com/questions/10291537/pull-to-refresh-uitableview-without-uitableviewcontroller?rq=1
//  
//  UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
//  [refreshControl addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
//  [self.mytableView addSubview:refreshControl];
//}
//
//-(void)handleRefresh:(UIRefreshControl *)refreshControl
//{
//  [refreshControl beginRefreshing];
//  // [self callAPI];
//  [refreshControl endRefreshing];
//}


#pragma mark TableViewDelegates

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.topMovies.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    NSDictionary *movie = self.topMovies[indexPath.row];

    cell.textLabel.text = movie[@"original_title"];
    float avote = [movie[@"vote_average"] floatValue];
    long votes = [movie[@"vote_count"] integerValue];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Avg Vote %.2f, # of votes %li", avote, votes];
  
    NSString *movieImageName = movie[@"poster_path"];
    NSString *urlString = [NSString stringWithFormat:@"%@%@", APIImg, movieImageName];
  
    // prepare URL for image request ~ don't block the main thread!
    // NSURL *url = [NSURL URLWithString:urlString];
  
     NSURLRequest *imageRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]
                                                   cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                               timeoutInterval:60];
  
    // NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *placeholderImage = [UIImage imageNamed:@"PlaceHolder.png"];
  
    __weak UITableViewCell *weakCell = cell;
  
    [cell.imageView setImageWithURLRequest:imageRequest
                          placeholderImage:placeholderImage
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                     
                                     weakCell.imageView.image = image;
                                     [weakCell setNeedsLayout];
                                     
                                   } failure:nil];
  
    if (indexPath.row == [self.self.topMovies count] - 1)
    {
      [self callAPI];
    }
  
    return cell;
  
}


#pragma mark - Navigation -> Segue to DetailVC

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.mytableView indexPathForCell:sender];
    if (indexPath) {
      if ([segue.identifier isEqualToString:@"MovieDetail"]) {
        if ([segue.destinationViewController isKindOfClass:[DetailVC class]]) {
          
            DetailVC *dvc = segue.destinationViewController;
            MovieInfo *movie = self.topMovies[indexPath.row];
          
            dvc.title = [movie valueForKeyPath:@"original_title"];
            dvc.movieOverviewText = [movie valueForKey:@"overview"];
          
            // Capitialize the language and reformat the date to US format
            dvc.language = [[movie valueForKey:@"original_language"] uppercaseString];
            NSString *dateString = [movie valueForKey:@"release_date"];
            NSArray *dateArray = [dateString componentsSeparatedByString:@"-"];
            NSString *dateYear = dateArray[MovieYear]; NSString *dateDay = dateArray[MovieDay]; NSString *dateMonth = dateArray[MovieMonth];
            dvc.movieDate = [NSString stringWithFormat:@"%@/%@/%@", dateMonth, dateDay, dateYear];
        
      }
    }
  }
}

@end
