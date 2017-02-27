//
//  JSONParser.swift
//  EmotionalSwift
//
//  Created by Gerald Fairclough, Jr on 2/26/17.
//  Copyright © 2017 Faircoder. All rights reserved.
//

import Foundation

//Struct to parse the face information json received from Microsoft Cognitive Services
struct JSONParser {
    
    static var faceRectKey = "faceRectangle"
    static var scoresKey = "scores"
    
    static func parse(data : Data) -> [Face]?{
        var faces = [Face]()
        
        do {
            guard let array = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [ [String: Any] ] else {
                print("json data could not be converted to an array of [String:Any]")
                return nil
            }
            for item in array {
                let faceRectangleDict = item[faceRectKey] as! [String : Any]
                let faceRectangle = FaceRectangle(dict: faceRectangleDict)
                let scoresDict = item[scoresKey] as! [String : Any]
                let scores : [Score] = Score.scores(for : scoresDict)
                let face = Face(scores: scores, rect: faceRectangle)
                faces.append(face)
            }
        }catch (let error) {
            print("Error deserializing JSON object from Microsoft server. Error - \(error)")
            return nil
        }
        
        return faces
    }
    
}
