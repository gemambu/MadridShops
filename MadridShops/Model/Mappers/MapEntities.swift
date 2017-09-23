import Foundation
import CoreData

func mapEntityCDIntoEntity(entityCD: EntityCD) -> Entity {
    let entity = Entity(name: entityCD.name!)
    
    entity.description = entityCD.desc ?? ""
    entity.openingHours = entityCD.openingHours ?? ""
    entity.address = entityCD.address ?? ""
    entity.image = entityCD.image ?? ""
    entity.logo = entityCD.logo ?? ""
    entity.latitude = entityCD.latitude
    entity.longitude = entityCD.longitude
    entity.type = entityCD.type
    
    return entity
}

func mapEntityIntoEntityCD(context: NSManagedObjectContext, entity: Entity) -> EntityCD {
    
    // mapping entity into entityCD
    let entityCD = EntityCD(context: context)
    
    entityCD.name = entity.name
    entityCD.desc = entity.description
    entityCD.openingHours = entity.openingHours
    entityCD.address = entity.address
    entityCD.image = entity.image
    entityCD.logo = entity.logo
    entityCD.latitude = entity.latitude ?? 0.0
    entityCD.longitude = entity.longitude ?? 0.0
    entityCD.type = entity.type
    
    return entityCD
}
