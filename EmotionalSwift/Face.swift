//
//  Face.swift
//  EmotionalSwift
//
//  Created by Gerald Fairclough, Jr on 2/26/17.
//  Copyright © 2017 Faircoder. All rights reserved.
//

import Foundation

//The values for the emotions considered by Microsoft Cognitive Services and the face positional information for the given Face
public struct Face {
    public var scores : [Score]?
    public var faceRect : FaceRectangle
    
    init(scores: [Score], rect: FaceRectangle){
        self.scores = scores
        self.faceRect = rect
    }
}
