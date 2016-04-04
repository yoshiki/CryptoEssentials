//
//  _ArrayType+Extension.swift
//  CryptoSwift
//
//  Created by Marcin Krzyzanowski on 08/10/15.
//  Copyright © 2015 Marcin Krzyzanowski. All rights reserved.
//

import Foundation
import C7

public protocol CSArrayType: _ArrayProtocol {
    func cs_arrayValue() -> [Generator.Element]
}

extension Array: CSArrayType {
    public func cs_arrayValue() -> [Iterator.Element] {
        return self
    }
}

public extension CSArrayType where Iterator.Element == Byte {
    public func toHexString() -> String {
        #if os(Linux)
            return self.lazy.reduce("") { $0 + (NSString(format:"%02x", $1).description) }
        #else
            return self.lazy.reduce("") { $0 + String(format:"%02x", $1) }
        #endif
    }
    
    public func toBase64() -> String? {
        guard let bytesArray = self as? [Byte] else {
            return nil
        }
        
        #if os(Linux)
            return NSData(bytes: bytesArray).base64EncodedStringWithOptions([])
        #else
            return NSData(bytes: bytesArray).base64EncodedString([])
        #endif
    }
    
    public init(base64: String) {
        self.init()
        
        guard let decodedData = NSData(base64EncodedString: base64, options: []) else {
            return
        }
        
        self.append(contentsOf: decodedData.arrayOfBytes())
    }
}