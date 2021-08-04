//
//  ViewController.swift
//  DifferenceBetweenJSON
//
//  Created by guozw3 on 2019/8/28.
//  Copyright © 2019 . All rights reserved.
//  SwiftyJSON 的好处在于，生成json对象的时候，不用那么多的解包和判断了，支持链式函数
//  HandyJSON 的好处在于，利用镜像动态去匹配每个key-value，方便转换成字典或者数组的复杂模型
//  Codable 的好处在于，apple自带，但是如果找不到value对应key会报错，服务器只能对json字段开放新增关闭修改

import UIKit
import SwiftyJSON
import HandyJSON
import CommonCrypto
import ObjectMapper

class ViewController: UIViewController {
    
    /// swiftyjson的Model
    var detailInfoModel: APPropertyDetailInfo?
    
    /// 使用HandyJSON的Model
    var detailInfoModel_handyObj: APPropertyDetailInfoByHandy?
    
    /// 使用HandyJSON的Struct
    var detailInfoModel_handyStruct: APHouseDetailStruct?
    
    /// 使用ObjectMapper的Model
    var detailInfoModel_ObjectMapper: APPropertyDetailInfo_ObjectMapper?
    
    /// 使用codable
    var detailInfoModel_codable: APHouseDetailInfo_codable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // - Note: weak self
        
        self.fetchBySwiftJSON() { (data) in
            self.detailInfoModel = APPropertyDetailInfo.convertFromPropertyDetailInfoJsonObject(data)
            print("statue: \(self.detailInfoModel?.propertyStatusCategory)")
        }
        
        self.fetchDataWithString() { (jsonString) in
            self.detailInfoModel_handyObj = APPropertyDetailInfoByHandy.convertFromJsonByHandy(jsonString)
            self.detailInfoModel_handyStruct = APHouseDetailStruct.convertFromJsonByHandy(jsonString)
            let jsonDic = self.detailInfoModel_handyStruct?.toJSON()
            print("statue: \(self.detailInfoModel_handyStruct?.PropertyStatusCategory), \(self.detailInfoModel_handyObj?.PropertyStatusCategory)")
        }
        
        self.fetchDataWithString() { (jsonString) in
            let detail_object1 = APPropertyDetailInfo_ObjectMapper(JSONString: jsonString)
            let detail_object2 = Mapper<APPropertyDetailInfo_ObjectMapper>().map(JSONString: jsonString)
            detail_object2?.toJSON()
            print(detail_object1)
        }
        
        self.fetchData() { (data) in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(DateFormatter.init(withFormat: "yyyy-MM-dd'T'HH:mm:ss", locale: NSLocale.current.identifier))
            do {
                let info = try decoder.decode(APHouseDetailInfo_codable.self, from: data)
                self.detailInfoModel_codable = info
            } catch let error {
                print(error)
            }
        }
    }
    
    /// 返回 JSON 的实体类
    func fetchBySwiftJSON(_ completion: @escaping(_ json: JSON) -> Void) {
        if let sampleJSON = APLocalSampleDataHandle.jsonFormLocalData(resourceName: "APPropertyDetailsSample") {
            completion(sampleJSON)
        }

    }
    
    /// 返回JSONString 的字符串
    func fetchDataWithString(_ completion: @escaping(_ string: String) -> Void) {
        if let data = APLocalSampleDataHandle.valueFormLocalData(resourceName: "APPropertyDetailsSample") {
            completion(String(data: data, encoding: .utf8) ?? "")
        }

    }

    func fetchData(_ completion: @escaping(_ data: Data) -> Void) {
        if let data = APLocalSampleDataHandle.valueFormLocalData(resourceName: "APPropertyDetailsSample") {
            completion(data)
        }

    }
}

extension String {
    func date() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter.date(from: self)
    }
}



