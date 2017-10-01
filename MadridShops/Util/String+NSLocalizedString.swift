import UIKit

extension String {
    func localizedString() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
