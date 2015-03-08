//
//  Machiawase.swift
//  machiawase-ios
//
//  Created by 小沢 邦雄 on 2015/03/07.
//  Copyright (c) 2015年 zakuni. All rights reserved.
//

import Foundation

@objc protocol MachiawaseDelegate {
    optional func didReceiveResult(result: NSDictionary)
}

class Machiawase : NSObject {
    weak var delegate: MachiawaseDelegate? = nil
    
    internal func rendezvous(place1: String, place2: String) {
        println(place1 + ", " + place2)
        let url = "http://machiawase.herokuapp.com/rendezvous.json?" + place1 + "," + place2
        let escapedUrl = url.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        var task = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: escapedUrl)!, completionHandler: { data, response, error in
            if (error == nil) {
                let result = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
                dispatch_async(dispatch_get_main_queue(), {
                    let _ = self.delegate?.didReceiveResult!(result)
                })
                
            } else {
                println(error)
            }
        })
        task.resume()
    }
}
