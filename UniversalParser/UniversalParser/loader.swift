//
//  loader.swift
//  UniversalParser
//
//  Created by prateek sharma on 23/04/19.
//  Copyright © 2019 PrateekSharma. All rights reserved.
//

//Class for loading data into memory and if already loaded get it from memory cache
import Foundation

open class Loader{
    static let dataCache = NSCache<AnyObject, AnyObject>()
    let urlSession = URLSession(configuration: URLSessionConfiguration.default)
    
    public init(){}
    
    open func cacheData(urlString: String, onComplete: @escaping (AnyObject)->Void){
        let url = URL(string: urlString)
        
        //analysis of data in memory
        if let dataFromCache = Loader.dataCache.object(forKey: urlString as AnyObject) {
            onComplete(dataFromCache)
        }
        //if data not available in memory
        if let url = url{
            urlSession.dataTask(with: url) {
                data, response, error in
                if data != nil {
                    DispatchQueue.main.async {
                        Loader.dataCache.setObject(data! as AnyObject, forKey: urlString as AnyObject)
                        onComplete(data! as AnyObject)
                    }
                }
                }.resume()
        }
    }
    
    //Stop downloading
    open func stopLoading(){
        self.urlSession.invalidateAndCancel()
    }
    //set the limit of cache
    open func setLimitInKiloBytes(limit: Int){
        Loader.dataCache.totalCostLimit = limit
    }
    
}

