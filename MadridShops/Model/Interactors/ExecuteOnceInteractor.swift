

import Foundation

protocol ExecuteOnceInteractor{
    func execute (closure: () -> Void)
}
