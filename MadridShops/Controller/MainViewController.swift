import UIKit
import FillableLoaders
import CoreData

class MainViewController: UIViewController {

    var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let starPath = UIBezierPath()
        starPath.move(to: CGPoint(x: 180, y: 25))
        starPath.addLine(to: CGPoint(x: 195.16, y: 43.53))
        starPath.addLine(to: CGPoint(x: 220.9, y: 49.88))
        starPath.addLine(to: CGPoint(x: 204.54, y: 67.67))
        starPath.addLine(to: CGPoint(x: 205.27, y: 90.12))
        starPath.addLine(to: CGPoint(x: 180, y: 82.6))
        starPath.addLine(to: CGPoint(x: 154.73, y: 90.12))
        starPath.addLine(to: CGPoint(x: 155.46, y: 67.67))
        starPath.addLine(to: CGPoint(x: 139.1, y: 49.88))
        starPath.addLine(to: CGPoint(x: 164.84, y: 43.53))
        starPath.close()
        starPath.fill()
        
        let myPath = starPath.cgPath
        let myLoader = WavesLoader.showLoader(with: myPath)
        self.view.addSubview(myLoader)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        ExecuteOnceInteractorImpl().execute{
            initializeData()
        }
    }
    
    func initializeData() {
        //let downloadEntitiesInteractor: DownloadAllEntitiesInteractor = DownloadAllEntitiesInteractorFakeImpl()
        
        let downloadEntitiesInteractor: DownloadAllEntitiesInteractor = DownloadAllEntitiesInteractorNSURLSessionImpl()
        
        downloadEntitiesInteractor.execute{ (entities: Entities) in
            // todo OK
            print("Name: " + entities.get(index: 0).name)
            
            // save the entities in core data
            let cacheInteractor = SaveAllEntitiesInteractorImpl()
            cacheInteractor.execute(entities: entities, context: self.context, onSuccess: { (entities: Entities)
                in
                print("Entities downloaded and saved correctly!")
                
                SetExecutedOnceInteractorImpl().execute()
                
//                self._fetchedResultsController = nil
//                self.entitiesCollectionView.delegate = self
//                self.entitiesCollectionView.dataSource = self
//                self.entitiesCollectionView.reloadData()
            })
        }
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowEntitiesSegue" {
            let vc = segue.destination as! EntitiesViewController
            vc.context = self.context
            vc.type = "Shop"
        }
    }
}
