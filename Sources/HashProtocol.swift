//
//  HashProtocol.swift
//  CryptoSwift
//
//  Created by Marcin Krzyzanowski on 17/08/14.
//  Copyright (c) 2014 Marcin Krzyzanowski. All rights reserved.
//

@_exported import C7

public protocol HashProtocol {
    static var size: Int { get }
    
    static func calculate(message: Array<UInt8>) -> [Byte]
}