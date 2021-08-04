
import Foundation
import HandyJSON    // 属性名必须和 数据的键值对匹配

struct APHouseDetailStruct: HandyJSON {
    
    var UserIsShowTrustor: Bool = false     // 是否顯示業主信息 (Boolean)
    var PropertyNo: String?                 // 樓盤編號
    var SSDType: APPropertySSDType = .unkown // SSD類型0:未知，1：0%，2：10%，3：15%，4：20%
    var EstimatedDate: Date?
    var BuildingTagInfos: [String]?
    var PropertyStatusCategory: APPropertyStatusCategory? // 房源狀態四大分類枚舉：1-有效，2-暫緩，3-預定，4-無效
    var searcherTags: Array<PropertyFastSearcherTags_handyJson>?
    
    mutating func mapping(mapper: HelpingMapper) {
        mapper <<<
            self.SSDType <-- EnumTransform()
        
        mapper <<<
            self.PropertyStatusCategory <-- EnumTransform()
        
        mapper <<<
            self.searcherTags <-- "PropertyFastSearcherTags"
        
        mapper <<<
            self.EstimatedDate <-- CustomDateFormatTransform(formatString: "yyyy-MM-dd'T'HH:mm:ss")
    }
}

extension APHouseDetailStruct {
    static func convertFromJsonByHandy(_ jsonString: String) -> APHouseDetailStruct {
        guard let info = APHouseDetailStruct.deserialize(from: jsonString) else {
            return APHouseDetailStruct.init()
        }
        return info
    }
}


class APPropertyDetailInfoByHandy: HandyJSON {
    var UserIsShowTrustor: Bool = false     // 是否顯示業主信息 (Boolean)
    var PropertyNo: String?                 // 樓盤編號
    var SSDType: APPropertySSDType = .unkown // SSD類型0:未知，1：0%，2：10%，3：15%，4：20%
    var EstimatedDate: Date?
    var BuildingTagInfos: [String]?
    var PropertyStatusCategory: APPropertyStatusCategory? // 房源狀態四大分類枚舉：1-有效，2-暫緩，3-預定，4-無效
    var searcherTags: [PropertyFastSearcherTags_handyJson]?
    
    /// 必要的HandyJSON方法
    required init() {}
    
    func mapping(mapper: HelpingMapper) {
        mapper <<<
            PropertyStatusCategory <-- TransformOf<APPropertyStatusCategory,Int>(fromJSON: { (data) -> APPropertyStatusCategory? in
                if let value:Int = data {
                    return APPropertyStatusCategory(rawValue: value)
                }
                return nil
            }, toJSON: { (data) -> Int in
                if let value = data {
                    return value.rawValue
                }
                
                return 0
            })
        
        mapper <<<
            SSDType <-- TransformOf<APPropertySSDType,Int>(fromJSON: { (data) -> APPropertySSDType in
                if let value:Int = data {
                    return APPropertySSDType(rawValue: value) ?? .unkown
                }
                return .unkown
            }, toJSON: { (data) -> Int in
                if let value = data {
                    return value.rawValue
                }
                
                return 0
            })
        
        mapper <<<
            EstimatedDate <-- CustomDateFormatTransform(formatString: "yyyy-MM-dd'T'HH:mm:ss")
        
        mapper <<<
            self.searcherTags <-- "PropertyFastSearcherTags"
    }
}

extension APPropertyDetailInfoByHandy {
    static func convertFromJsonByHandy(_ jsonString: String) -> APPropertyDetailInfoByHandy {
        guard let info = APPropertyDetailInfoByHandy.deserialize(from: jsonString) else {
            return APPropertyDetailInfoByHandy()
        }
        return info
    }
    
}

struct PropertyFastSearcherTags_handyJson: HandyJSON {
    
    var ItemText: String?
    var ItemValue: String?
    var IsDelete: Bool?
    var PropertyType: Int?
    var Seq: Int?
    
    init() {
        
    }
    
    mutating func mapping(mapper: HelpingMapper) {
        
    }
    
    
}
