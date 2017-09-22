import UIKit

extension String {

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
