import UIKit

extension String {
    
    /*
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
 */
    
    // hacer loadImage2, con nsurlSession
    func loadImage(into imageView: UIImageView) {
       let session = URLSession.shared
        if let url = URL(string: self) {
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                
                OperationQueue.main.addOperation {
                    assert(Thread.current == Thread.main)
                    if error == nil {
                        // OK
                        let image = UIImage(data: data as! Data)
                        imageView.image = image
                        
                    } else {
                        // Error
                        print("Error downloading photos")
                    }
                }
            }
            task.resume()
        }
    }
}
