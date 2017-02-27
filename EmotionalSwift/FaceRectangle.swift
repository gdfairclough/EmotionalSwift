//
//  FaceRectangle.swift
//  EmotionalSwift
//
//  Created by Gerald Fairclough, Jr on 2/26/17.
//  Copyright © 2017 Faircoder. All rights reserved.
//

import Foundation

//Face rectangle with information regarding the posiiton of the face in the picture
public struct FaceRectangle {
    public let left: Int
    public let top: Int
    public let height: Int
    public let width: Int
    
    public init(left: Int, top: Int, height: Int, width: Int){
        self.left = left
        self.top = top
        self.height = height
        self.width = width
    }
    
    init(dict: [String:Any]){
        self.left = dict["left"] as? Int ?? 0
        self.top = dict["top"] as? Int ?? 0
        self.height = dict["height"] as? Int ?? 0
        self.width = dict["width"] as? Int ?? 0
    }
}
