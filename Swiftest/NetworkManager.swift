//
//  NetworkManager.swift
//  Swiftest
//
//  Created by Mark on 6/4/14.
//  Copyright (c) 2014 Mark. All rights reserved.
//

import Foundation

class NetworkManager {
    let baseUrlString = "http://www.myapifilms.com/search"

    func searchTitle(title: String, completionHandler:(response:AnyObject!, error: NSError?) -> Void) {
        let urlString = baseUrlString + "?title=\(title)&limit=10"
        execNetworkCall(urlString, completionHandler)
    }
    
    func execNetworkCall(urlString: String, completion:(response: AnyObject!, error: NSError?) -> Void) {

        let session = NSURLSession.sharedSession()
        let url : NSURL? = NSURL.URLWithString(urlString)
        if let myUrl = url {
            let dataTask = session.dataTaskWithURL(myUrl, completionHandler: {
                data, response, error in
                var jsonError: NSError?
                var json: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: &jsonError);
                if ((json) != nil) {
                    var moviesJson = json as NSArray
                    var movies = Array<Movie>()
                    for movie : AnyObject in moviesJson {
                        let movieObj = Movie(dictionary: movie as NSDictionary)
                        movies += movieObj
                    }
                    dispatch_async(dispatch_get_main_queue(), {
                        completion(response: movies, error: error)
                    })
                }

            })
            dataTask.resume()
        }

    }
}