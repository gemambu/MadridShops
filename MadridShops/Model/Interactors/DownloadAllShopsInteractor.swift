import Foundation

protocol DownloadAllShopsInteractor {
    // execute: downloads all shops. Return on the main thread
    func execute(onSuccess: @escaping successClosure, onError: errorClosure)
    func execute(onSuccess: @escaping successClosure)
    
}
