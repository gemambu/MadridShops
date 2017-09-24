
import Foundation



class DownloadAllEntitiesInteractorNSURLSessionImpl : DownloadAllEntitiesInteractor {
    
    var entities: Entities?
    
    func execute(onSuccess: @escaping successClosure, onError: errorClosure) {
        downloadEntities(urlString: urlEntities[0], type: entityType[0], finish: false, onSuccess: onSuccess, onError: onError)
    }
    
    func downloadEntities(urlString: String, type: String, finish: Bool, onSuccess: @escaping successClosure, onError: errorClosure) {
        
        if let url = URL(string: urlString) {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                
                OperationQueue.main.addOperation {
                    assert(Thread.current == Thread.main)
                    if error == nil {
                        self.entities = parseEntities(data: data!, type: type)
                        if finish {
                            onSuccess(self.entities!)
                            return
                        }
                        // OK
                        self.downloadEntities(urlString: urlEntities[1], type: entityType[1], finish: true, onSuccess: onSuccess, onError: onError)
                        
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
