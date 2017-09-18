import Foundation
import CoreData

func mapShopCDIntoShop(shopCD: ShopCD) -> Shop {
    let shop = Shop(name: shopCD.name!)
    
    shop.description = shopCD.desc ?? ""
    shop.openingHours = shopCD.openingHours ?? ""
    shop.address = shopCD.address ?? ""
    shop.image = shopCD.image ?? ""
    shop.logo = shopCD.logo ?? ""
    shop.latitude = shopCD.latitude
    shop.longitude = shopCD.longitude
    
    return shop
}

func mapShopIntoShopCD(context: NSManagedObjectContext, shop: Shop) -> ShopCD {
    
    // mapping shop into shopCD
    let shopCD = ShopCD(context: context)
    
    shopCD.name = shop.name
    shopCD.desc = shop.description
    shopCD.openingHours = shop.openingHours
    shopCD.address = shop.address
    shopCD.image = shop.image
    shopCD.logo = shop.logo
    shopCD.latitude = shop.latitude ?? 0.0
    shopCD.longitude = shop.longitude ?? 0.0
    
    return shopCD
}
