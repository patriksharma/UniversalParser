//
//  JSONParserTests.swift
//  ExampleParserTests
//
//  Created by prateek sharma on 23/04/19.
//  Copyright © 2019 PrateekSharma. All rights reserved.
//

import XCTest
@testable import ExampleParser
class JSONParserTests: XCTestCase {
    var jsonFetcher: JSON!
    
    override func setUp() {
        jsonFetcher = JSON()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testJSONFetcher() {
        jsonFetcher.fetchImagesData(urlString: DATA_URL) { (success, cards) in
            if success{
                XCTAssert(true)
            }
            else{
                XCTAssert(false)
            }
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
