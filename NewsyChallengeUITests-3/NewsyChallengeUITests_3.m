//
//  NewsyChallengeUITests_3.m
//  NewsyChallengeUITests-3
//
//  Created by Jaime Hernandez on 12/16/15.
//  Copyright © 2015 Jaime Hernandez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DetailVC.h"

@interface NewsyChallengeUITests_3 : XCTestCase

@end

@implementation NewsyChallengeUITests_3

- (void)setUp {
    [super setUp];
    self.continueAfterFailure = NO;
    [[[XCUIApplication alloc] init] launch];
  
}

- (void)tearDown {
    [super tearDown];
}

-(void)testTitleExists {
  
  XCUIApplication *app = [[XCUIApplication alloc] init];
  XCUIElement *topRatedMoviesStaticText = app.navigationBars[@"Top Rated Movies"].staticTexts[@"Top Rated Movies"];
  
  XCTAssert(topRatedMoviesStaticText.exists);
}

-(void)testUITableViewExists {
  
  XCUIApplication *app = [[XCUIApplication alloc] init];
  XCUIElementQuery *tablesQuery = app.tables;
  
  XCTAssert(tablesQuery.count > 0);

}

-(void)testDetailLabelNavBarTitle {
  // Need to figure out how to go directly to second VC directly
  // Also how to use the cell @ index to relay on the internal array
  XCUIApplication *app = [[XCUIApplication alloc] init];
  XCUIElementQuery *tablesQuery = app.tables;
  [tablesQuery.staticTexts[@"Avg Vote 8.37, # of votes 1388"] tap];
  [[[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"Whiplash"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextView].element tap];
  
  XCTAssert([app.staticTexts[@"Whiplash"] exists]);
  
}

-(void)testDetailLabelReleaseDate {
  XCUIApplication *app = [[XCUIApplication alloc] init];
  XCUIElementQuery *tablesQuery = app.tables;
  [tablesQuery.staticTexts[@"Avg Vote 8.37, # of votes 1388"] tap];
  [[[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"Whiplash"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextView].element tap];
  
  XCTAssert([app.staticTexts[@"Release Date"] exists]);
  
}

-(void)testDetailLabelLanguage {
  XCUIApplication *app = [[XCUIApplication alloc] init];
  XCUIElementQuery *tablesQuery = app.tables;
  [tablesQuery.staticTexts[@"Avg Vote 8.37, # of votes 1388"] tap];
  [[[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"Whiplash"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextView].element tap];
  
  XCTAssert([app.staticTexts[@"Language"] exists]);
  
}

-(void) testDetailLabelReleaseDateData {
  XCUIApplication *app = [[XCUIApplication alloc] init];
  XCUIElementQuery *tablesQuery = app.tables;
  [tablesQuery.staticTexts[@"Avg Vote 8.37, # of votes 1388"] tap];
  [[[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"Whiplash"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextView].element tap];
  
  XCTAssert([app.staticTexts[@"10/10/2014"] exists]);

}

-(void)testDetailLabelLanguageData {
  XCUIApplication *app = [[XCUIApplication alloc] init];
  XCUIElementQuery *tablesQuery = app.tables;
  [tablesQuery.staticTexts[@"Avg Vote 8.37, # of votes 1388"] tap];
  [[[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"Whiplash"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextView].element tap];
  
  XCTAssert([app.staticTexts[@"EN"] exists]);

}

-(void)testDetailLabelLanguageDataDoesNoteExist {
  XCUIApplication *app = [[XCUIApplication alloc] init];
  XCUIElementQuery *tablesQuery = app.tables;
  [tablesQuery.staticTexts[@"Avg Vote 8.37, # of votes 1388"] tap];
  [[[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"Whiplash"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextView].element tap];
  
  XCTAssertFalse([app.staticTexts[@"FR"] exists]);
  
}

@end
