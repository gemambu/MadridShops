import Foundation


class DownloadAllEntitiesInteractorFakeImpl: DownloadAllEntitiesInteractor {
    func execute(onSuccess: @escaping (Entities) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Entities) -> Void, onError: errorClosure = nil) {
        createEntities(onSuccess: onSuccess, type: "Shop")
        createEntities(onSuccess: onSuccess, type: "Activity")
    }
    
    
    func createEntities(onSuccess: @escaping (Entities) -> Void, type: String){
        let entities = Entities()
        for i in 0...10 {
            let entity = Shop(name: "\(type) number \( i )")
            entity.address = "Address \( i )"
            entity.description = "Description for \(type) number \( i )"
            entity.openingHours = "Monday to Saturday 10:00 - 20:30"
            entity.image = "Assets/unicorn_icon.png"
            entity.type = type
            
            entities.add(entity: entity)
        }
        
        // The response must be on MainThread
        OperationQueue.main.addOperation {
            onSuccess(entities)
        }
    }
    
    
    
    
}

