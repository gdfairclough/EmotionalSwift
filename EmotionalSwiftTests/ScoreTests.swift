//
//  ScoreTests.swift
//  EmotionalSwift
//
//  Created by Gerald Fairclough, Jr on 2/26/17.
//  Copyright © 2017 Faircoder. All rights reserved.
//

import Foundation
import XCTest
@testable import EmotionalSwift

class ScoreTests : XCTestCase {
    
    func testScoreCreation(){

        let value = 1.98272858E-07
        let emotions : [String] = ["anger","contempt","disgust","fear","happiness","neutral","sadness","surprise"]
        
        for emotion in emotions {
            let score = Score(emotionString: emotion, value: value)
            
            XCTAssertEqual(score.emotion, RepresentedEmotion(rawValue: emotion))
            XCTAssertEqual(score.value,1.98272858E-07)
        }
        
    }
}
