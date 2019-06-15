//
//  InstabugChallengeTests.swift
//  InstabugChallengeTests
//
//  Created by Admin on 6/15/19.
//  Copyright © 2019 Instabug. All rights reserved.
//

import XCTest
@testable import InstabugChallenge

class InstabugChallengeTests: XCTestCase {

    override func setUp() {
      
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
    
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
  
    func testFetchingMovies(){
      let expectation = XCTestExpectation.init(description: "API Returns all movies successfully")
      APIClient.shared.getMovies(page: 9) { (movies, error) in
        if error == nil {
          XCTFail("Report Error Message")
        }
          expectation.fulfill()
      }
      
    }

}
