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
        
        self.imageView.image = UIImage(contentsOfFile: (self.shop?.image)!)
        
        
        
    }
}
