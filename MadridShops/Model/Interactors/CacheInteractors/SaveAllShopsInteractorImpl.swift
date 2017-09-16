//
//  SaveAllShopsInteractorImpl.swift
//  MadridShops
//
//  Created by Gema on 16/9/17.
//  Copyright © 2017 Gema. All rights reserved.
//

import Foundation
import CoreData

class SaveAllShopsInteractorImpl : SaveAllShopsInteractor {
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping successClosure, onError: errorClosure) {
        
        for i in 0 ..< shops.count() {
            let shop = shops.get(index: i)
            
            // sacar una funcion que mapee de shopCD desde shop
            let shopCD = ShopCD(context: context)
            shopCD.name = shop.name
            shopCD.desc = shop.description
            shopCD.openingHours = shop.openingHours
            shopCD.address = shop.address
            shopCD.image = shop.image
            shopCD.logo = shop.logo
            //shopCD.latitude = shop.latitude!
            //shopCD.longitude = shop.longitude!
            
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
