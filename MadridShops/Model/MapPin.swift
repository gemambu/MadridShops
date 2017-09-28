import Foundation
import MapKit

class MapPin: NSObject, MKAnnotation {
    
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    let entity: Entity?
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String, entity: Entity) {
        
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.entity = entity
        super.init()
    }
}
