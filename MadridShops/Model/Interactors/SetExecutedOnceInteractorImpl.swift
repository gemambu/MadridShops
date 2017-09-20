import Foundation

class SetExecutedOnceInteractorImpl : SetExecutedOnceInteractor {
    func execute() {
        let definition = UserDefaults.standard
        
        definition.set("SAVED", forKey: "once")
        
        definition.synchronize()
    }
    
}
