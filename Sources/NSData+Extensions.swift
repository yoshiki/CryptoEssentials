//
//  PGPDataExtension.swift
//  SwiftPGP
//
//  Created by Marcin Krzyzanowski on 05/07/14.
//  Copyright (c) 2014 Marcin Krzyzanowski. All rights reserved.
//

import Foundation
import C7

extension NSMutableData {
    /** Convenient way to append bytes */
    public func appendBytes(arrayOfBytes: [Byte]) {
        self.appendBytes(arrayOfBytes, length: arrayOfBytes.count)
    }
}

extension NSData {
    /// Two octet checksum as defined in RFC-4880. Sum of all octets, mod 65536
    public func checksum() -> UInt16 {
        var s:UInt32 = 0
        var bytesArray = self.arrayOfBytes()
        for i in 0..<bytesArray.count {
            s = s + UInt32(bytesArray[i])
        }
        s = s % 65536
        return UInt16(s)
    }
}

extension NSData {
    public func toHexString() -> String {
        return self.arrayOfBytes().toHexString()
    }
    
    public func arrayOfBytes() -> [Byte] {
        let count = self.length / sizeof(Byte)
        var bytesArray = [Byte](repeating: 0, count: count)
        self.getBytes(&bytesArray, length:count * sizeof(Byte))
        return bytesArray
    }
    
    public convenience init(bytes: [Byte]) {
        self.init(data: NSData.withBytes(bytes))
    }
    
    class public func withBytes(bytes: [Byte]) -> NSData {
        return NSData(bytes: bytes, length: bytes.count)
    }
}