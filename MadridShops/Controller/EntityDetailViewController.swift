import UIKit
import MapKit
import CoreLocation

class EntityDetailViewController: UIViewController {

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
        self.location.setCenter(entityLocation.coordinate, animated: true)
        
    }
    
    


}
