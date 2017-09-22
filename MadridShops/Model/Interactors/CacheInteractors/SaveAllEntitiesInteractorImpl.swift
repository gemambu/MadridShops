import Foundation
import CoreData

class SaveAllEntitiesInteractorImpl : SaveAllEntitiesInteractor {
    func execute(entities: Entities, context: NSManagedObjectContext, onSuccess: @escaping successClosure,  onError: errorClosure) {
        
        for i in 0 ..< entities.count() {
            let entity = entities.get(index: i)
        
            let _ = mapEntityIntoEntityCD(context: context)
        }
        
        do {
            try context.save()
            onSuccess(entities)
        } catch {
            print("Error saving \(entities.get(index: 0).type) in CoreData")
        }
        
    }
    
    func execute(entities: Entities, context: NSManagedObjectContext, onSuccess: @escaping successClosure, type: String) {
        execute(entities: entities, context: context, onSuccess: onSuccess, onError: nil)
    }
    
    
}
