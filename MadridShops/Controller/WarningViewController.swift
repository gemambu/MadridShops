import UIKit


class WarningViewController : UIViewController {
 
    @IBOutlet weak var message: UITextView!

    @IBOutlet weak var funButton: UIButton!
    
    override func viewDidLoad() {
        
        self.message.text = ""
    }
    
    @IBAction func onClickedFunButton(_ sender: Any) {
        let diceRoll = Int(arc4random_uniform(UInt32(chiquito.count)))
        self.message.text = chiquito[diceRoll]
    }
    
    
    
}
