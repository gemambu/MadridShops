import Foundation


class DownloadAllEntitiesInteractorFakeImpl: DownloadAllEntitiesInteractor {
    func execute(onSuccess: @escaping (Entities) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Entities) -> Void, onError: errorClosure = nil) {
        let entities = Entities()
        for i in 0...10 {
            let entity = Entity(name: "Shop number \( i )")
            entity.address = "Address \( i )"
            entity.description_en = "Description for Shop number \( i )"
            entity.openingHours_en = "Monday to Saturday 10:00 - 20:30"
            entity.image = "Assets/unicorn_icon.png"
            entity.type = "Shop"
            
            entities.add(entity: entity)
        }
        
        for i in 0...10 {
            let entity = Entity(name: "Activity number \( i )")
            entity.address = "Address \( i )"
            entity.description_en = "Description for Activity number \( i )"
            entity.openingHours_en = "Monday to Saturday 10:00 - 20:30"
            entity.image = "Assets/unicorn_icon.png"
            entity.type = "Activity"
            
            entities.add(entity: entity)
        }
        
        // The response must be on MainThread
        OperationQueue.main.addOperation {
            onSuccess(entities)
        }
    }
    

    
    
    
    
}

