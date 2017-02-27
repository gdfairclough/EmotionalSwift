//
//  NetworkError.swift
//  EmotionalSwift
//
//  Created by Gerald Fairclough, Jr on 2/26/17.
//  Copyright © 2017 Faircoder. All rights reserved.
//

import Foundation

///possible errors which will cause a network request to fail
public enum NetworkError : Error {
    case timeout
    case requestFailed(reason: String)
}
