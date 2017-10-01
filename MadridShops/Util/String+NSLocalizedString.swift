import UIKit

extension String {
    public func localizedString() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
