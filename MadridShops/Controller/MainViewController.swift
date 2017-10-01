import UIKit
import FillableLoaders
import CoreData

class MainViewController: UIViewController {
    
    var context: NSManagedObjectContext!
    var viewHasBeenSet: Bool = false
    
    @IBOutlet weak var shopsButton: UIButton!
    @IBOutlet weak var activitiesButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var shopsLabel: UILabel!
    @IBOutlet weak var activitiesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // the buttons are hidden by default.
        // with this solution, user cannot click on them while the app is downloading the information
        self.view.subviews.map{ $0.isHidden = true }
                
        self.shopsButton.setTitle("mainview.ShopsButton".localizedString(),
                                      for: UIControlState.normal)
        self.activitiesButton.setTitle("mainview.ActivitiesButton".localizedString(),
                                       for: UIControlState.normal)
        self.shopsLabel.text="mainview.ShopsButton".localizedString()
        self.activitiesLabel.text="mainview.ActivitiesButton".localizedString()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if (!self.viewHasBeenSet) {
            if (!Reachability.isConnectedToNetwork()) && (UserDefaults.standard.string(forKey: "once") == nil){
                // no connection and no core data info
                
                let alert = UIAlertController(title: "WarningTitle".localizedString(), message: "WarningMessage".localizedString(), preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "optionOK".localizedString(), style: UIAlertActionStyle.default, handler: nil))
                alert.addAction(UIAlertAction(title: "optionEasterEgg".localizedString(), style: UIAlertActionStyle.default, handler:  { action in self.performSegue(withIdentifier: "EasterEggSegue", sender: self)}))
                self.present(alert, animated: true, completion: nil)
            } else {
                
                self.displayActivityView()
                
                ExecuteOnceInteractorImpl().execute(closure: { initializeData() }, onSuccess: { hideActivityView() })
                
                self.viewHasBeenSet = true
                
            }
            
        }
    }
    
    func displayActivityView(){
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        self.view.subviews.map{ $0.isUserInteractionEnabled = false }

        self.activityIndicatorView.isHidden = false
        self.activityIndicatorView.startAnimating()
        
    }
    
    func hideActivityView() {
       
        self.view.subviews.map{ $0.isUserInteractionEnabled = true }
        self.view.subviews.map{ $0.isHidden = false }
        
        UIApplication.shared.endIgnoringInteractionEvents()
        
        self.activityIndicatorView.isHidden = true
        self.activityIndicatorView.stopAnimating()
        
    }
    
    func initializeData() {
        
        let downloadEntitiesInteractor: DownloadAllEntitiesInteractor = DownloadAllEntitiesInteractorNSURLSessionImpl()
        
        downloadEntitiesInteractor.execute{ (entities: Entities) in
            // todo OK
            print("Name: " + entities.get(index: 0).name)
            
            // save the entities in core data
            let cacheInteractor = SaveAllEntitiesInteractorImpl()
            cacheInteractor.execute(entities: entities, context: self.context, onSuccess: { (entities: Entities)
                in
                print("☑️ Entities downloaded and saved correctly!")
                
                SetExecutedOnceInteractorImpl().execute()
                
                self.hideActivityView()
            })
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is EntitiesViewController {
            let vc = segue.destination as! EntitiesViewController
            vc.context = self.context
            if segue.identifier == "ShowShopsSegue" {
                vc.type = entityType[0]
            } else if segue.identifier == "ShowActivitiesSegue" {
                vc.type = entityType[1]
            }
        }
        
    }
}
