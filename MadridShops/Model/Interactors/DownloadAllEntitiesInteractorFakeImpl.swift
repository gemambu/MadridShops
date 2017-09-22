import Foundation


class DownloadAllEntitiesInteractorFakeImpl: DownloadAllEntitiesInteractor {
    func execute(onSuccess: @escaping (Entities) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Entities) -> Void, onError: errorClosure = nil) {
        let entities = Entities()
        
        for i in 0...10 {
            let entity = Shop(name: "Entity number \( i )")
            entity.address = "Address \( i )"
            entity.description = "Description for shop nomber \( i )"
            entity.openingHours = "Monday to Saturday 10:00 - 20:30"
            entity.image = "Assets/unicorn_icon.png"
            
            entities.add(entity: entity)
        }
        
        // The response must be on MainThread
        OperationQueue.main.addOperation {
            onSuccess(shops)
        }
    }
    
    
    
    
}

