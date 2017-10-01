import Foundation


class DownloadAllEntitiesInteractorNSOpImpl: DownloadAllEntitiesInteractor {
    func execute(onSuccess: @escaping (Entities) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Entities) -> Void, onError: errorClosure = nil) {
        
        let urlStringShops = "https://madrid-shops.com/json_new/getShops.php"
        let urlStringActivities = "http://madrid-shops.com/json_new/getActivities.php"
        
        let queue = OperationQueue()
        queue.addOperation {

            self.downloadAndParseEntities(urlString: urlStringShops, type: "Shop", onSuccess: onSuccess)
                
            self.downloadAndParseEntities(urlString: urlStringActivities, type: "Activity", onSuccess: onSuccess)
                
            
        
        }
    }
    
    func downloadAndParseEntities(urlString: String, type: String, onSuccess: @escaping (Entities) -> Void){
        
        if let url = URL(string: urlString), let data = NSData(contentsOf: url) as Data? {
            
            let entities = parseEntities(data: data, type: type)
            
            // The response must be on MainThread
            OperationQueue.main.addOperation {
                onSuccess(entities)
            }
            
        }
    }
    
}


