
import Foundation

class DownloadAllEntitiesInteractorNSURLSessionImpl : DownloadAllEntitiesInteractor {
    func execute(onSuccess: @escaping successClosure, onError: errorClosure) {
        
        let urlStringShops = "https://madrid-shops.com/json_new/getShops.php"
        let urlStringActivities = "http://madrid-shops.com/json_new/getActivities.php"
        
        let session = URLSession.shared
        downloadEntities(urlStringShops)
        downloadEntities(urlStringActivities)
        
    }
    
    func downloadEntities(urlString: String) {
        if let url = URL(string: urlString) {
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                
                OperationQueue.main.addOperation {
                    assert(Thread.current == Thread.main)
                    if error == nil {
                        // OK
                        let entities = parseEntities(data: data!)
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
