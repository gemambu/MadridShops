import UIKit

class ShopCell: UICollectionViewCell {
    var shop: Shop?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var openingHours: UILabel!
    
    func refresh(shop: Shop) {
        self.shop = shop
        
        self.label.text = self.shop?.name
        self.openingHours.text = self.shop?.openingHours
        
        self.shop?.logo.loadImage(into: imageView)
        imageView.clipsToBounds = true
        UIView.animate(withDuration: 1.0) {
            self.imageView.layer.cornerRadius = 30
        }
        
        
    }
}
