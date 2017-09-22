import Foundation
import MapKit

class MapPin: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let logo: String?
    let name: String?
    
    init(coordinate: CLLocationCoordinate2D, logo: String, name: String){
        self.coordinate = coordinate
        self.logo = logo
        self.name = name
    }
}
