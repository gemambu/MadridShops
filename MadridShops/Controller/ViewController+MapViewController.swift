import UIKit
import CoreLocation
import MapKit

extension EntitiesViewController: CLLocationManagerDelegate, MKMapViewDelegate {
    
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
                annotationView.image = UIImage(named: "events_pin.png")
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
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            
            print("🔍 Showing detail for: \(view.annotation?.title!)")
            performSegue(withIdentifier: "ShowEntityDetailSegue", sender: view.annotation as! MapPin)
        }
        
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
}
