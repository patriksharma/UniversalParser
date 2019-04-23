//
//  ImagesLoaderTests.swift
//  ExampleParserTests
//
//  Created by prateek sharma on 23/04/19.
//  Copyright © 2019 PrateekSharma. All rights reserved.
//

import XCTest
@testable import ExampleParser

class ImagesLoaderTests: XCTestCase {
    var imagesLoader : ImagesLoader!
    
    let imageURL = "https://purepng.com/public/uploads/large/purepng.com-mario-runningmariofictional-charactervideo-gamefranchisenintendodesigner-1701528632710brm3o.png"
    
    
    override func setUp() {
        imagesLoader = ImagesLoader()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testloadProfileImage() {
        //testing profile image loading
        imagesLoader.loadProfileImage(imageView: UIImageView(), urlString: imageURL)
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
