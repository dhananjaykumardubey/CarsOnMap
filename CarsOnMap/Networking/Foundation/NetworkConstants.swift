
import Foundation

/// This Enum can have constants related to network. For now, only base url for Production environment is added, but can have staging and dev environment base urls too.
enum NetworkConstant {
    
    // Base Url for Production.
    static let baseURL = URL(string: "cdn.sixt.io")!
}

