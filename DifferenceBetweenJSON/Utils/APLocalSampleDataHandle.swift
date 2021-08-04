//
//  File.swift
//  DifferenceBetweenJSON
//

//

import Foundation
import SwiftyJSON

class APLocalSampleDataHandle {
    
    static func jsonFormLocalData(resourceName: String) -> JSON? {
        
        if let path = Bundle.main.path(forResource: "APSampleSource", ofType: ".bundle"),
           let bundle = Bundle.init(path: path),
           let data = FileManager.readJson(bundle: bundle, forResource: resourceName) {
            do {
                let json = try JSON.init(data: data)
                return json
            } catch let error {
                debugPrint("打開本地JSON失敗 \(error)")
                return nil
            }
        } else {
            print("文件不存在")
            return nil
        }
    }
    
    static func valueFormLocalData(resourceName: String) -> Data? {
        
        if let path = Bundle.main.path(forResource: "APSampleSource", ofType: ".bundle"),
           let bundle = Bundle.init(path: path),
           let data = FileManager.readJson(bundle: bundle, forResource: resourceName) {
            return data
        } else {
            print("文件不存在")
            return nil
        }
    }
}

extension FileManager {
    
    static func readJson(bundle: Bundle = Bundle.main, forResource fileName: String) -> Data? {
        
        if let path = bundle.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                // handle error
            }
        }
        
        return nil
    }
}
