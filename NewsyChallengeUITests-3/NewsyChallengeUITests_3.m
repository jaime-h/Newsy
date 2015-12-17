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
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
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
-(void)testDetailVC {
  DetailVC *sut = [[DetailVC alloc] init];
  XCUIApplication *app = [XCUIApplication new];
  [sut view];
  XCTAssert(app.staticTexts[@"lang"].exists);
}




//- (void)testExample {
//  
//  XCUIApplication *app = [[XCUIApplication alloc] init];
//  XCUIElement *topRatedMoviesStaticText = app.navigationBars[@"Top Rated Movies"].staticTexts[@"Top Rated Movies"];
//  [topRatedMoviesStaticText tap];
//  [app.alerts[@"Error Retrieving Movies"].collectionViews.buttons[@"OK"] tap];
//  
//  XCUIElementQuery *tablesQuery = app.tables;
//  [tablesQuery.staticTexts[@"Avg Vote 8.37, # of votes 1388"] tap];
//  [[[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"Whiplash"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextView].element tap];
//  [app.staticTexts[@"10/10/2014"] tap];
//  
//  XCUIElement *enStaticText = app.staticTexts[@"EN"];
//  [enStaticText tap];
//  
//  XCUIElement *releaseDateStaticText = app.staticTexts[@"Release Date"];
//  [releaseDateStaticText tap];
//  
//  XCUIElement *languageStaticText = app.staticTexts[@"Language"];
//  [languageStaticText tap];
//  
//  XCUIElement *whiplashNavigationBar = app.navigationBars[@"Whiplash"];
//  [whiplashNavigationBar.staticTexts[@"Whiplash"] tap];
//  [whiplashNavigationBar.buttons[@"Top Rated Movies"] tap];
//  [tablesQuery.staticTexts[@"Avg Vote 8.30, # of votes 65"] tap];
//  [languageStaticText tap];
//  [releaseDateStaticText tap];
//  [app.staticTexts[@"06/11/2015"] tap];
//  [app.staticTexts[@"DE"] tap];
//  [[[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"Victoria"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextView].element tap];
//  
//  XCUIElement *victoriaNavigationBar = app.navigationBars[@"Victoria"];
//  [victoriaNavigationBar.staticTexts[@"Victoria"] tap];
//  [victoriaNavigationBar.buttons[@"Top Rated Movies"] tap];
//  [tablesQuery.staticTexts[@"Avg Vote 8.30, # of votes 3825"] tap];
//  [[[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"Interstellar"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextView].element tap];
//  [app.staticTexts[@"11/05/2014"] tap];
//  [enStaticText tap];
//  [languageStaticText tap];
//  [releaseDateStaticText tap];
//  
//  XCUIElement *interstellarNavigationBar = app.navigationBars[@"Interstellar"];
//  [interstellarNavigationBar.staticTexts[@"Interstellar"] tap];
//  [interstellarNavigationBar.buttons[@"Top Rated Movies"] tap];
//  [topRatedMoviesStaticText tap];
//  
//    // Use recording to get started writing UI tests.
//    // Use XCTAssert and related functions to verify your tests produce the correct results.
//}
@end
