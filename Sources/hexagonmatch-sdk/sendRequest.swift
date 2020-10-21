//
//  File.swift
//  
//
//  Created by Mauricio Patiño on 19/10/20.
//

import Foundation

public class SendRequest {
    
    init() {
        // perform some initialization here
    }
    
   
    public func sendRequest(requestURL: URLRequest, completion:(Data?)->()) -> Void {
        
        let userAgent = "HMiOSSDK"
        var request = requestURL
        request.setValue(userAgent, forHTTPHeaderField: "User-Agent")
        // Send HTTP Request
        let session = URLSession(configuration: .default)
        let sem = DispatchSemaphore.init(value: 0)
        
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            defer { sem.signal() }
            // Check if Error took place
            if error != nil {
                return
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
        }
        
        task.resume()
        sem.wait()
    }
}
    
