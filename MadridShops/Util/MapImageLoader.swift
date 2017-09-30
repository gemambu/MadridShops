
import UIKit

func loadImage(into imageView: UIImageView, latitude: Float, longitude: Float) {
    
    let url = "https://maps.googleapis.com/maps/api/staticmap?center=\(latitude),\(longitude)&zoom=17&size=320x220&scale=2"
    
    return url.loadImage(into: imageView)
}
