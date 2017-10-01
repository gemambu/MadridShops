import Foundation

public class Entity {
    
    public internal(set) var name: String
    public internal(set) var description_es: String = ""
    public internal(set) var description_en: String = ""
    public internal(set) var latitude: Float? = nil
    public internal(set) var longitude: Float? = nil
    public internal(set) var image: String = ""
    public internal(set) var logo: String = ""
    public internal(set) var openingHours_es: String = ""
    public internal(set) var openingHours_en: String = ""
    public internal(set) var address: String = ""
    public internal(set) var type: String?
    
    
    public init(name: String) {
        self.name = name
    }
    
    public init(name: String, description_es: String, description_en: String, latitude: Float, longitude: Float, image: String, logo: String, openingHours_es: String, openingHours_en: String, address: String, type: String){
        self.address = address
        self.description_en = description_en
        self.description_es = description_es
        self.openingHours_en = openingHours_en
        self.openingHours_es = openingHours_es
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.image = image
        self.logo = logo
        self.type = type
    }
    
    func getType() -> String {
        return ""
    }
    
    public func getDescription(language: String) -> String {
        return ((language == "") || (language == "en")) ? self.description_en : self.description_es
    }
    
    public func getOpeningHours(language: String) -> String {
        return ((language == "") || (language == "en")) ? self.openingHours_en : self.openingHours_es
    }
    
    
}

extension Entity: Comparable {
    public static func <(lhs: Entity, rhs: Entity) -> Bool {
        return lhs.name < rhs.name
    }
}

extension Entity: Equatable {
    public static func ==(lhs: Entity, rhs: Entity) -> Bool {
        return lhs.name == rhs.name
    }
}

extension Entity : Hashable {
    public var hashValue: Int {
        get {
            let proxy = "\(name) \(address)"
            return proxy.hashValue
        }
    }
}

