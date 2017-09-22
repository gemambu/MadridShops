import Foundation

public class Entity {
    var name: String
    var description: String = ""
    var latitude: Float? = nil
    var longitude: Float? = nil
    var image: String = ""
    var logo: String = ""
    var openingHours: String = ""
    var address: String = ""
    var type: String?
    
    
    public init(name: String) {
        self.name = name
    }
    
    func getType() -> String {
        return ""
    }
}

