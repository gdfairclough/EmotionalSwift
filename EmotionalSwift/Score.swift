//
//  Score.swift
//  EmotionalSwift
//
//  Created by Gerald Fairclough, Jr on 2/26/17.
//  Copyright © 2017 Faircoder. All rights reserved.
//

import Foundation

//struct to hold an emotion represented by the face and a value from 0.0 to 1.0 with 0.0 being no display of the emotion and 1.0 being full display of the emotion
public struct Score {
    public var emotion : RepresentedEmotion
    public var value : Double
    
    public init(emotionString : String, value : Double) {
        self.emotion = RepresentedEmotion(rawValue : emotionString) ?? .unknown
        self.value = value
    }
    
    static func scores(for dict: [String:Any])->[Score] {
        let emotions = dict.keys
        var scores = [Score]()
        
        for emotion in emotions {
            let value = dict[emotion] as? Double ?? 0
            let score = Score(emotionString: emotion, value: value)
            scores.append(score)
        }
        return scores
    }
}
