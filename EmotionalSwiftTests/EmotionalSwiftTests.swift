//
//  EmotionalSwiftTests.swift
//  EmotionalSwiftTests
//
//  Created by Gerald Fairclough, Jr on 2/26/17.
//  Copyright © 2017 Faircoder. All rights reserved.
//

import XCTest
import Foundation
import EmotionalSwift

class EmotionalSwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAPICall(){
        
        let expectationDescription = "imageAPICall"
        
        let key = ""
        let requester = EmotionalDataRequester(apiKey: key)
        let imageName = "photo"
        let expectation = self.expectation(description: expectationDescription)
        
        let bundle = Bundle(for: type(of: self))
        
        guard let imageURL = bundle.url(forResource: imageName, withExtension: ".JPG") else {
            XCTFail("image \(imageName) could not be converted to imageURL")
            return
        }
        
        do {
            let data = try Data(contentsOf: imageURL)
            
            requester.requestEmotionalData(for : data) { (result) in
                switch result{
                case .success(let faces):
                    if faces?.count == 2 {
                        expectation.fulfill()
                    }else {
                        XCTFail("Incorrect number of faces returned form API. Expected 2, received \(faces?.count)")
                    }
                    
                case .failure(let error):
                    XCTFail("call to API failed \(error)")
                    break
                }
            }
        }catch (let error){
            print("unable to convert bundle image to data. Error - \(error)")
        }
        
        waitForExpectations(timeout: 60) { (error) in
            print("error")
            
        }
    }
    
}
