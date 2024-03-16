
import Foundation

public func isValidStringURL(_ string: String) -> Bool {
    URL(string: string) != nil
}
