

import Foundation
import SwiftyJSON

class APPropertyDetailInfo: NSObject {
    var userIsShowTrustor: Bool = false     // 是否顯示業主信息 (Boolean)
    var propertyNo: String?                 // 樓盤編號
    var sSDType: APPropertySSDType = .unkown // SSD類型0:未知，1：0%，2：10%，3：15%，4：20%
    var estimatedDate: Date?              
    var buildingTagInfos: [String]?         
    var propertyStatusCategory: APPropertyStatusCategory? // 房源狀態四大分類枚舉：1-有效，2-暫緩，3-預定，4-無效
    var searcherTags: [PropertyFastSearcherTags]?
}

extension APPropertyDetailInfo {
    static func convertFromPropertyDetailInfoJsonObject(_ json: JSON) -> APPropertyDetailInfo {
        let info = APPropertyDetailInfo()
        
        info.userIsShowTrustor = json["UserIsShowTrustor"].boolValue
        info.propertyNo = json["PropertyNo"].stringValue
        info.estimatedDate = json["EstimatedDate"].stringValue.date()
        
        if let tagList = json["BuildingTagInfos"].array {
            var list: [String] = []
            for tag in tagList {
                list.append(tag.stringValue)
            }
            info.buildingTagInfos = list
        }
        info.propertyStatusCategory = APPropertyStatusCategory(rawValue: json["PropertyStatusCategory"].intValue)
        if let tagList = json["PropertyFastSearcherTags"].array {
            var list: [PropertyFastSearcherTags] = []
            for json in tagList {
                list.append(PropertyFastSearcherTags(ItemText: json["ItemText"].stringValue, ItemValue: json["ItemValue"].stringValue, IsDelete: json["IsDelete"].boolValue, PropertyType: json["PropertyType"].intValue, Seq: json["Seq"].intValue))
            }
            info.searcherTags = list
        }
        return info
    }
}
