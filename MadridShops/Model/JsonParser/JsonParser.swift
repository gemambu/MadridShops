
import Foundation

func parseEntities(data: Data, type: String) -> Entities {
    let entities = Entities()
    do {
        let jsonObject = try JSONSerialization.jsonObject(with: data, options:
            JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, Any>
        let result = jsonObject["result"] as! [Dictionary<String, Any>]
        
        for entityJson in result {
            let entity = Entity(name: entityJson["name"] as! String)
            entity.address = entityJson["address"] as! String
            entity.description = entityJson["description_en"] as! String
            entity.latitude = entityJson["gps_lat"] as? Float
            entity.longitude = entityJson["gps_lon"] as? Float
            entity.image = entityJson["img"] as! String
            entity.logo = entityJson["logo_img"] as! String
            entity.openingHours = entityJson["opening_hours_en"] as! String
            entity.type = type
            
            entities.add(entity: entity)
        }
    } catch {
        print("Error parsing JSON")
    }
    
    return entities
    
}
