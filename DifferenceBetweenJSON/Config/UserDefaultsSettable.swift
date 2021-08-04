

import Foundation

protocol UserDefaultsSettable {
    associatedtype defaultKeys: RawRepresentable
}

extension UserDefaultsSettable where defaultKeys.RawValue == String {
    static func set(value: String, forKey key: defaultKeys) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }
    
    static func string(forKey key: defaultKeys) -> String? {
        return UserDefaults.standard.string(forKey: key.rawValue)
    }
    
}
