import Foundation


class DownloadAllShopsInteractorFakeImpl: DownloadAllShopsInteractor {
    func execute(onSuccess: @escaping (Shops) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure = nil) {
        let shops = Shops()
        
        for i in 0...10 {
            let shop = Shop(name: "Shop number \( i )")
            shop.address = "Address \( i )"
            shop.description = "Description for shop nomber \( i )"
            shop.openingHours = "Monday to Saturday 10:00 - 20:30"
            shop.image = "Assets/unicorn_icon.png"
            
            shops.add(shop: shop)
        }
        
        // The response must be on MainThread
        OperationQueue.main.addOperation {
            onSuccess(shops)
        }
    }
    
    
    
    
}

