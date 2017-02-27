//
//  EmotionalDataRequester.swift
//  EmotionalSwift
//
//  Created by Gerald Fairclough, Jr on 2/26/17.
//  Copyright © 2017 Faircoder. All rights reserved.
//

import Foundation

public class EmotionalDataRequester {
    
    private var wrapper : CognitiveAPIWrapper
    
    ///Initializer which will internally create the API wrapper to prepare for the server request
    public init(apiKey: String){
        self.wrapper = CognitiveAPIWrapper(apiKey: apiKey)
    }
    
    /**
     
    Perform a request using the Microsoft Cognitive Servieces API. In the case of success the closure will receive a Result of Success and an array of Face structs [Face]
    */
    public func requestEmotionalData(for imageData : Data, closure : @escaping (Result<[Face]?>)->Void){
        wrapper.requestEmotionalData(for: imageData, closure: closure)
    }
    
}
