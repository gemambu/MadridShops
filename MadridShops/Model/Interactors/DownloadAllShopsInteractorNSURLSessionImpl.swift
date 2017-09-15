//
//  DownloadAllShopsInteractorNSURLSessionImpl.swift
//  MadridShops
//
//  Created by Gema on 14/9/17.
//  Copyright © 2017 Gema. All rights reserved.
//

import Foundation

class DownloadAllShopsInteractorNSURLSessionImpl : DownloadAllShopsInteractor {
    func execute(onSuccess: @escaping successClosure, onError: errorClosure) {
        let urlString = "https://madrid-shops.com/json_new/getShops.php"
        
        let session = URLSession.shared
        if let url = URL(string: urlString) {
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                
                OperationQueue.main.addOperation {
                    assert(Thread.current == Thread.main)
                    if error == nil {
                        // OK
                        let shops = parseShops(data: data!)
                        onSuccess(shops)
                    } else {
                        // Error
                        if let myError = onError {
                            myError(error!)
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
    
    func execute(onSuccess: @escaping successClosure) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    
}
