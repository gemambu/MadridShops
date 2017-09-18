import Foundation
import CoreData

class SaveAllShopsInteractorImpl : SaveAllShopsInteractor {
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping successClosure, onError: errorClosure) {
        
        for i in 0 ..< shops.count() {
            let shop = shops.get(index: i)
        
            let _ = mapShopIntoShopCD(context: context, shop: shop)
        }
        
        do {
            try context.save()
            onSuccess(shops)
        } catch {
            print("Error saving shops in CoreData")
        }
        
    }
    
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping successClosure) {
        execute(shops: shops, context: context, onSuccess: onSuccess,  onError: nil)
    }
    
    
}
