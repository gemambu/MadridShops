import Foundation

protocol DownloadAllEntitiesInteractor {
    // execute: downloads all entities. Return on the main thread
    func execute(onSuccess: @escaping successClosure, onError: errorClosure)
    func execute(onSuccess: @escaping successClosure)
    
}
