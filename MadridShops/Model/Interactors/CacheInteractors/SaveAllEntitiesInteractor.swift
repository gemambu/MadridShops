
import Foundation
import CoreData

protocol SaveAllEntitiesInteractor {
    // execute: save all entities. Return on the main thread
    func execute(entities: Entities, context: NSManagedObjectContext, onSuccess: @escaping successClosure, onError: errorClosure)
    func execute(entities: Entities, context: NSManagedObjectContext, onSuccess: @escaping successClosure)
    
}
