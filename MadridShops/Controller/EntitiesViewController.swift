import UIKit
import CoreData
import CoreLocation
import MapKit

class EntitiesViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var entitiesCollectionView: UICollectionView!
    var context: NSManagedObjectContext!
    
    @IBOutlet weak var map: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        
        ExecuteOnceInteractorImpl().execute{
            initializeData()
        }
    
        self.entitiesCollectionView.delegate = self
        self.entitiesCollectionView.dataSource = self
        
        let madridLocation = CLLocation(latitude:40.41889 , longitude: -3.69194)
        self.map.setCenter(madridLocation.coordinate, animated: true)
        
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
                print("Entities downloaded and saved correctly!")
                
                SetExecutedOnceInteractorImpl().execute()
                
                self._fetchedResultsController = nil
                self.entitiesCollectionView.delegate = self
                self.entitiesCollectionView.dataSource = self
                self.entitiesCollectionView.reloadData()
            })
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let entityCD = self.fetchedResultsController.object(at: indexPath)
        self.performSegue(withIdentifier: "ShowEntityDetailSegue", sender: entityCD)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowEntityDetailSegue" {
            let vc = segue.destination as! EntityDetailViewController
            let entityCD: EntityCD =  sender as! EntityCD
            vc.entity = mapEntityCDIntoEntity(entityCD: entityCD)
            
        }
    }
    
    // MARK: - Fetched results controller
    
    var _fetchedResultsController: NSFetchedResultsController<EntityCD>? = nil
    
    var fetchedResultsController: NSFetchedResultsController<EntityCD> {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let fetchRequest: NSFetchRequest<EntityCD> = EntityCD.fetchRequest()
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Edit the sort key as appropriate.
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        // fetchedRequest == SELECT * FROM EVENT PRDER BY TIMESTAMP DESC
        _fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.context!, sectionNameKeyPath: nil, cacheName: "EntitiesChacheFile")
        //aFetchedResultsController.delegate = self
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("💩 Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        self.map.setCenter(location.coordinate, animated: true)
    }


}

