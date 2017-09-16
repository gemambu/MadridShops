
import Foundation
import CoreData

protocol SaveAllShopsInteractor {
    // execute: save all shops. Return on the main thread
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping successClosure, onError: errorClosure)
    func execute(shops: Shops, context: NSManagedObjectContext,onSuccess: @escaping successClosure)
    
}
