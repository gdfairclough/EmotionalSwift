//
//  Score.swift
//  EmotionalSwift
//
//  Created by Gerald Fairclough, Jr on 2/26/17.
//  Copyright © 2017 Faircoder. All rights reserved.
//

import Foundation

struct Score {
    var emotion : RepresentedEmotion
    var value : Double
    
    init(emotionString : String, value : Double) {
        self.emotion = RepresentedEmotion(rawValue : emotionString) ?? .unknown
        self.value = value
    }
}
