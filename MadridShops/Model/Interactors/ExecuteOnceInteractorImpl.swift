import Foundation

class ExecuteOnceInteractorImpl : ExecuteOnceInteractor {
    func execute (closure: () -> Void, onSuccess: ()->Void){
        let defaults = UserDefaults.standard
        
        if defaults.string(forKey: "once") == nil {
            // first time here
            closure()
        } else {
            print("💾 Entities already saved on database")
            onSuccess()
        }
    }
}
