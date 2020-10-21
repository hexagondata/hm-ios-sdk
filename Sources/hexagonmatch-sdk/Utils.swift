//
//  File.swift
//  
//
//  Created by Mauricio Patiño on 20/10/20.
//

import Foundation
import CommonCrypto

struct Utils {
    
    func ccSha256(data: Data) -> Data {
        var digest = Data(count: Int(CC_SHA256_DIGEST_LENGTH))
        _ = digest.withUnsafeMutableBytes { digestBytes -> UInt8 in
                    data.withUnsafeBytes { messageBytes -> UInt8 in
                        if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                            let messageLength = CC_LONG(data.count)
                            CC_SHA256(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                        }
                        return 0
                    }
                }
        
        return digest
    }
    
    func getKeyType(key:String) -> String {
        var keyTypeString:String
        
        switch key
        {
            case "email":
                keyTypeString = "e"
                break;
            case "mobile":
                keyTypeString = "mo"
                break;
            case "customer":
                keyTypeString = "cu"
                break;
        default:
            keyTypeString = ""
        }

        return keyTypeString
    }
    


}
