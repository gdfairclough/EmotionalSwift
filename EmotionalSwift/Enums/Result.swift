//
//  Result.swift
//  EmotionalSwift
//
//  Created by Gerald Fairclough, Jr on 2/26/17.
//  Copyright © 2017 Faircoder. All rights reserved.
//

import Foundation

///Enum for the potential results of the netowkr request
public enum Result<T> {
    case success(T)
    case failure(Error)
}
