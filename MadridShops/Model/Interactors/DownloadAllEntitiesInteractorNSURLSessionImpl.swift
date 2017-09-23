
import Foundation

class DownloadAllEntitiesInteractorNSURLSessionImpl : DownloadAllEntitiesInteractor {
    func execute(onSuccess: @escaping successClosure, onError: errorClosure) {
        
        let urlStringShops = "https://madrid-shops.com/json_new/getShops.php"
        let urlStringActivities = "http://madrid-shops.com/json_new/getActivities.php"
        
        
        downloadEntities(urlString: urlStringShops, type: "Shop", onSuccess: onSuccess, onError: onError)
        downloadEntities(urlString: urlStringActivities, type: "Activity", onSuccess: onSuccess, onError: onError)
        
    }
    
    func downloadEntities(urlString: String, type: String, onSuccess: @escaping successClosure, onError: errorClosure) {
        
        if let url = URL(string: urlString) {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                
                OperationQueue.main.addOperation {
                    assert(Thread.current == Thread.main)
                    if error == nil {
                        // OK
                        let entities = parseEntities(data: data!, type: type)
                        onSuccess(entities)
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
