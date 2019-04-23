//
//  ImageTableViewHandlerTests.swift
//  ExampleParserTests
//
//  Created by prateek sharma on 23/04/19.
//  Copyright © 2019 PrateekSharma. All rights reserved.
//

import XCTest
@testable import ExampleParser

class ImageTableViewHandlerTests: XCTestCase {
    
    var cardsTableViewHandler : ImageTableViewHandler!
    
    override func setUp() {
        cardsTableViewHandler = ImageTableViewHandler()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitializeComponents(){
        cardsTableViewHandler.intializeComponents(cards: [CellViewModel](), activityIndicator: UIActivityIndicatorView())
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
