import UIKit
import MapKit
import CoreLocation

class EntityDetailViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var descriptionView: UITextView!
    @IBOutlet weak var location: MKMapView!
    @IBOutlet weak var addressView: UITextView!
    var entity: Entity?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.entity?.name
        self.descriptionView.text = self.entity?.description
        self.addressView.text = self.entity?.address
        
        let entityLocation = CLLocation(latitude: Double((self.entity?.latitude)!) , longitude: Double((self.entity?.longitude)!))
        let span = MKCoordinateSpanMake(0.002, 0.002)
        let region = MKCoordinateRegion(center: entityLocation.coordinate, span: span)
        
        self.location.setRegion(region, animated: true)
        self.location.setCenter(entityLocation.coordinate, animated: true)

    }
    
    


}
