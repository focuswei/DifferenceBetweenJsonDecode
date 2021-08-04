

import UIKit

class APConfiguration {
    static var appVersion: String {
        let info = Bundle.main.infoDictionary
        return info!["CFBundleShortVersionString"] as? String ?? ""
    }
    
    static var channel: String {
        return "none"
    }
    
    static var platform: String {
        return "iOS"
    }
    
    static var userAgent: String {
        return "iPhone"
    }
    
}

