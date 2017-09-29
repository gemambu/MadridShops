import UIKit
import CoreData
import CoreLocation
import MapKit

class EntitiesViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var entitiesCollectionView: UICollectionView!
    
    var context: NSManagedObjectContext!
    var type: String!
    var pin: String!
    
    @IBOutlet weak var map: MKMapView!
    let locationManager = CLLocationManager()

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.type
        
        self.map.delegate = self
        
        self.entitiesCollectionView.delegate = self
        self.entitiesCollectionView.dataSource = self
        
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        
        
        loadPins()
        
        let madridLocation = CLLocation(latitude:40.41889 , longitude: -3.69194)
        
        let region = MKCoordinateRegion(center: madridLocation.coordinate, span: MKCoordinateSpanMake(0.2, 0.2))
        
        self.map.setRegion(region, animated: true)
        self.map.setCenter(madridLocation.coordinate, animated: true)
        
        
        // OJO!!
        self.pin = self.type == entityType[0] ? pinType[0] : pinType[1]
        

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
    
    // MARK: - Map View


    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? MapPin {
            let annotationIdentifier = "AnnotationIdentifier"
            var annotationView: MKPinAnnotationView?
            if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
                as? MKPinAnnotationView { // 2
                annotationView = dequeuedAnnotationView
                annotationView?.annotation = annotation
            } else {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            }

             if let annotationView = annotationView {
                // 3
                annotationView.canShowCallout = true
                annotationView.calloutOffset = CGPoint(x: -5, y: 5)
                annotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView

                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: annotationView.frame.height, height: annotationView.frame.height))
                annotation.entity?.logo.loadImage(into: imageView)
                imageView.contentMode = .scaleAspectFit
                annotationView.leftCalloutAccessoryView = imageView
                
            }

            return annotationView
        }
        return nil
    }
    
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        if (UIApplication.shared.isIgnoringInteractionEvents) {
        print("Is ignoring " )
        } else {
        print("Is NOT ignoring ")
        }
        self.displayActivityView()
        
        self.view.addSubview(self.activityIndicator)

        
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        self.hideActivityView()
        
         UIApplication.shared.endIgnoringInteractionEvents()
    }

    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            print("🔍 Showing detail for: \(view.annotation?.title!)")
            performSegue(withIdentifier: "ShowEntityDetailSegue", sender: view.annotation as! MapPin)
        }
        
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        
        
        image.draw(in: CGRect(x: 0, y: 0,width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    

    func loadPins() {
        var entityList = [MapPin]()
        for entity in self.fetchedResultsController.fetchedObjects! {
            let entityLocation = CLLocation(latitude: Double(entity.latitude) , longitude: Double(entity.longitude))
            let entityPin = MapPin(coordinate: entityLocation.coordinate , title: entity.name!, subtitle: "", entity: mapEntityCDIntoEntity(entityCD: entity))

            entityList.append(entityPin)
        }
        
        self.map.addAnnotations(entityList)
        
    }
    
    // MARK: - Activity View
    
    func displayActivityView(){
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
    }
    
    func hideActivityView() {
        self.activityIndicator.isHidden = true
        self.activityIndicator.stopAnimating()
    }
    
}

