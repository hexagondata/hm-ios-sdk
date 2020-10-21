//
//  File.swift
//
//
//  Created by Mauricio Patiño on 20/10/20.
//

import AdSupport
import WebKit
import Foundation
import CryptoKit

public struct hexagonmatch_sdk {
    private let uuid:String?;
    private let model:String;
    private let systemVersion:String;
    private let nameApp:String;
    private let device:String;
    private let urlPixel:String;
    private let unwrappedUUID:String;
    private let platformId:String;
    private let clientId:String;
    private let tagId:String;

    public init(platformId:String,tagId:String, clientId:String) {
        
        self.platformId  = platformId
        self.clientId  = clientId
        self.tagId  = tagId
        uuid = UIDevice.current.identifierForVendor?.uuidString
        unwrappedUUID = uuid!
        systemVersion = UIDevice.current.systemVersion
        device = UIDevice.current.name
        nameApp = Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String
        model = UIDevice.current.model
        urlPixel  = "https://locate.hexagondata.com/pixel.png"
        
    }

    public func SendData(keyValue:String, keyType:String) -> Void {
        
        let utils = Utils()
        let data = utils.ccSha256(data: keyValue.data(using: .utf8)!)
        let encriptData = data.map { String(format: "%02hhx", $0) }.joined()
        let paramKey = utils.getKeyType(key: keyType)
      
        var components = URLComponents(string: urlPixel)!

        components.queryItems = [
            URLQueryItem(name: "mid", value: unwrappedUUID),
            URLQueryItem(name: "type", value: "IDFA"),
            URLQueryItem(name: "platform_id", value: platformId),
            URLQueryItem(name: "tag_id", value: tagId),
            URLQueryItem(name: paramKey, value: encriptData),
            URLQueryItem(name: "app", value: nameApp),
            URLQueryItem(name: "d", value: UIDevice.current.name),
            URLQueryItem(name: "br", value: UIDevice.current.systemName),
            URLQueryItem(name: "ml", value: UIDevice.current.model),
            URLQueryItem(name: "mf", value: "APPLE")
        ]
       
        var requestURL = URLRequest(url: components.url!)
        requestURL.httpMethod = "GET"
        
        let send = SendRequest.init()
        send.sendRequest(requestURL:requestURL) {data in}
    }
    
  
}
