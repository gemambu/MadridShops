import UIKit

class EntityDetailViewController: UIViewController {

    @IBOutlet weak var descriptionView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    var entity: Entity?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.entity?.name
        self.descriptionView.text = self.entity?.description
        self.entity?.image.loadImage(into: imageView)
        
    }
    
    


}
