import UIKit

extension String {
    
    func loadImage(into imageView: UIImageView) {
        let queue = OperationQueue()
        
        queue.addOperation {
            if let url = URL(string: self),
                let data = NSData(contentsOf: url),
                let image = UIImage(data: data as Data ){
                
                // Cargamos el UIImage en el hilo principal
                OperationQueue.main.addOperation {
                    imageView.image = image
                }
                
            }
            
        }
    }
    
    // hacer loadImage2, con nsurlSession
}
