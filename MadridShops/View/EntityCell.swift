import UIKit

class EntityCell: UICollectionViewCell {
    var entity: Entity?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var openingHours: UILabel!
    
    func refresh(entity: Entity) {
        self.entity = entity
        
        self.label.text = self.entity?.name
        self.openingHours.text = self.entity?.openingHours
        
        self.entity?.logo.loadImage(into: imageView)
        imageView.clipsToBounds = true
        UIView.animate(withDuration: 1.0) {
            self.imageView.layer.cornerRadius = 30
        }
        
        
    }
}
