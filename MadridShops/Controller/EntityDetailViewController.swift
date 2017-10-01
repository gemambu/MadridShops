import UIKit


class EntityDetailViewController: UIViewController {

    @IBOutlet weak var descriptionView: UITextView!
    @IBOutlet weak var mapImage: UIImageView!
    @IBOutlet weak var addressView: UITextView!
    @IBOutlet weak var openingHoursView: UITextView!
    
    var entity: Entity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.entity?.name
        self.descriptionView.text = self.entity?.getDescription(language: languageCode!)
        self.openingHoursView.text = self.entity?.getOpeningHours(language: languageCode!)
        self.addressView.text = self.entity?.address
        
        loadImage(into: self.mapImage, latitude: (self.entity?.latitude)!, longitude:  (self.entity?.longitude)!)

    }
    
    


}
