import UIKit


class WarningViewController : UIViewController {
 
    @IBOutlet weak var message: UITextView!
    @IBOutlet weak var descEasterEgg: UITextView!
    @IBOutlet weak var funButton: UIButton!
    
    @IBOutlet weak var centerAlignFunButton: NSLayoutConstraint!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
//            self.centerAlignFunButton.constant += self.view.bounds.width
//            self.view.layoutIfNeeded()
//        }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.descEasterEgg.text = "easterEggDescription".localizedString()
        self.message.text = ""
        
        //self.centerAlignFunButton.constant -= view.bounds.width
        
        self.funButton.clipsToBounds = true
        
        self.funButton.layer.cornerRadius = 50
        
    }
    
    @IBAction func onClickedFunButton(_ sender: Any) {
        let diceRoll = Int(arc4random_uniform(UInt32(chiquito.count)))
        self.message.text = chiquito[diceRoll]
    }
    
    
    
}
