import UIKit

class EntityCell: UICollectionViewCell {
    
    var entity: Entity?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    func refresh(entity: Entity) {
        
        self.entity = entity
        
        self.label.text = self.entity?.name
        
        self.entity?.logo.loadImage(into: imageView)
        imageView.clipsToBounds = true
        UIView.animate(withDuration: 1.0) {
            self.imageView.layer.cornerRadius = 30
        }
        
        self.entity?.image.loadImage(into: backgroundImage)
        self.contentView.sendSubview(toBack: self.backgroundImage)
   
    }
}
