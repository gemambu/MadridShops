
import Foundation


public func parseEntities(data: Data, type: String) -> Entities {
    let entities = Entities()
    do {
        let jsonObject = try JSONSerialization.jsonObject(with: data, options:
            JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, Any>
        let result = jsonObject["result"] as! [Dictionary<String, Any>]
      
        
        for entityJson in result {
            let entity = Entity(name: entityJson["name"] as! String)
            entity.address = entityJson["address"] as! String
            entity.description_en = entityJson["description_en"] as! String
            entity.description_es = entityJson["description_es"] as! String
            entity.image = entityJson["img"] as! String
            entity.logo = entityJson["logo_img"] as! String
            entity.openingHours_en = entityJson["opening_hours_en"] as! String
            entity.openingHours_es = entityJson["opening_hours_es"] as! String
            entity.type = type
            
            entity.longitude = convertToFloat(entityField:(entityJson["gps_lon"]! as! String))
            entity.latitude = convertToFloat(entityField:(entityJson["gps_lat"]! as! String))

            
            entities.add(entity: entity)
        }
    } catch {
        print("Error parsing JSON")
    }
    
    return entities
    
}

public func convertToFloat(entityField: String) -> Float {
    return Float(entityField
        .trimmingCharacters(in: .whitespaces)
        .replacingOccurrences(of: ",", with: ""))!
}
