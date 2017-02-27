//
//  HTTPHeaderField.swift
//  EmotionalSwift
//
//  Created by Gerald Fairclough, Jr on 2/26/17.
//  Copyright © 2017 Faircoder. All rights reserved.
//

import Foundation

///Key values to place in the network request header
enum HTTPHeaderField : String {
    case contentType            = "Content-Type"
    case connection             = "Connection"
    case subscriptionKey        = "Ocp-Apim-Subscription-Key"
    case contentLength          = "Content-Length"
}
