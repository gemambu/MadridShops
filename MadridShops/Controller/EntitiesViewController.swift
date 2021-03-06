import UIKit
import CoreData
import CoreLocation
import MapKit

class EntitiesViewController: UIViewController {
    
    @IBOutlet weak var entitiesCollectionView: UICollectionView!
    
    var context: NSManagedObjectContext!
    var type: String!

    @IBOutlet weak var map: MKMapView!
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch (self.type) {
            case entityType[0]:
                self.title = titleEntities[0]
            case entityType[1]:
                self.title = titleEntities[1]
            case entityType[2]:
                self.title = titleEntities[2]
        case .none:
            self.title = ""
        case .some(_):
            self.title = ""
        }
        
  

        self.map.delegate = self
        
        self.entitiesCollectionView.delegate = self
        self.entitiesCollectionView.dataSource = self
        
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        
        
        loadPins()
        
        let madridLocation = CLLocation(latitude: 40.41889 , longitude: -3.69194)
        
        let region = MKCoordinateRegion(center: madridLocation.coordinate, span: MKCoordinateSpanMake(0.2, 0.2))
        
        self.map.setRegion(region, animated: true)
        self.map.setCenter(madridLocation.coordinate, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let entityCD = self.fetchedResultsController.object(at: indexPath)
        self.performSegue(withIdentifier: "ShowEntityDetailSegue", sender: entityCD)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowEntityDetailSegue" {
            let vc = segue.destination as! EntityDetailViewController
            var entityCD : EntityCD? = nil
            if sender is EntityCD {
                entityCD =  sender as! EntityCD
            } else if sender is MapPin {
                let entity = (sender as! MapPin).entity
                entityCD = mapEntityIntoEntityCD(context: self.context, entity: entity!)
            }
            
            vc.entity = mapEntityCDIntoEntity(entityCD: entityCD!)
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
        
        // filter by the entity type
        fetchRequest.predicate = NSPredicate(format: "type == %@", self.type)
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        
        // fetchedRequest == SELECT * FROM EVENT PRDER BY TIMESTAMP DESC
        _fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.context!, sectionNameKeyPath: nil, cacheName: "EntitiesChacheFile")
        
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
    
    
}

