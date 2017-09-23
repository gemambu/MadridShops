import Foundation
import CoreData

class SaveAllEntitiesInteractorImpl : SaveAllEntitiesInteractor {
    func execute(entities: Entities, context: NSManagedObjectContext, onSuccess: @escaping successClosure,  onError: errorClosure) {
        
        var entityType: String = ""
        
        for i in 0 ..< entities.count() {
            let entity = entities.get(index: i)
        
            let _ = mapEntityIntoEntityCD(context: context, entity: entity)
        }
        
        entityType = entities.get(index: 0).type!
        
        do {
            try context.save()
            onSuccess(entities)
        } catch {
            print("Error saving \(entityType) in CoreData")
        }
        
    }
    
    func execute(entities: Entities, context: NSManagedObjectContext, onSuccess: @escaping successClosure) {
        execute(entities: entities, context: context, onSuccess: onSuccess, onError: nil)
    }
    
    
}
