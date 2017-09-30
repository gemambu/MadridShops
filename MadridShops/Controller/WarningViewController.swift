import UIKit


class WarningViewController : UIViewController {
 
    @IBOutlet weak var message: UITextView!
    @IBOutlet weak var imageGif: UIImageView!
    
    
    
    override func viewDidLoad() {
	
       let url = "https://los40sonlosnuevos30.files.wordpress.com/2016/06/chiquito-reverse.gif"
        
        url.loadImage(into: imageGif)
        
    }
}
