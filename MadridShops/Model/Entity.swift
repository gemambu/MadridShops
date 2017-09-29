import Foundation

public class Entity {
    var name: String
    var description_es: String = ""
    var description_en: String = ""
    var latitude: Float? = nil
    var longitude: Float? = nil
    var image: String = ""
    var logo: String = ""
    var openingHours_es: String = ""
    var openingHours_en: String = ""
    var address: String = ""
    var type: String?
    
    
    public init(name: String) {
        self.name = name
    }
    
    func getType() -> String {
        return ""
    }
    
    func getDescription(language: String) -> String {
        return ((language == "") || (language == "en")) ? self.description_en : self.description_es
    }
}

