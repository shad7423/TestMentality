//
//  myReachability.swift
//  meditation-test
//
//  Created by Shadab Khan on 4/23/18.
//  Copyright © 2018 Shadab Khan. All rights reserved.
//

import Foundation
import SystemConfiguration

public class myReachability {
    
    class func isConnectedToNetwork() -> Bool {
        
        var Status:Bool = false
        let url = NSURL(string: "http://google.com/")
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = "HEAD"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
        request.timeoutInterval = 10.0
        var response: URLResponse?
        _ = try? NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: &response) as NSData?
        if let httpResponse = response as? HTTPURLResponse {
            if httpResponse.statusCode == 200 {
                Status = true
            }
        }
        return Status
        }
    }
