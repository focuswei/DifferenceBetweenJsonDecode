
import Foundation
import ObjectMapper

class APPropertyDetailInfo_ObjectMapper: Mappable {
    
    var userIsShowTrustor: Bool = false     // 是否顯示業主信息 (Boolean)
    var propertyNo: String?                 // 樓盤編號
    var sSDType: APPropertySSDType = .unkown // SSD類型0:未知，1：0%，2：10%，3：15%，4：20%
    var estimatedDate: Date?
    var buildingTagInfos: [String]?
    var searcherTags: [PropertyFastSearcherTags_ObjectMapper]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        userIsShowTrustor         <- map["UserIsShowTrustor"]
        propertyNo      <- map["PropertyNo"]
        buildingTagInfos       <- map["BuildingTagInfos"]
        sSDType  <- map["SSDType"]
        estimatedDate     <- (map["EstimatedDate"], CustomDateFormatTransform(formatString: "yyyy-MM-dd HH:mm:ss"))
        searcherTags <- (map["PropertyFastSearcherTags"])
    }
    
    
}

struct PropertyFastSearcherTags_ObjectMapper: Mappable {
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        ItemText <- map["ItemText"]
        ItemValue <- map["ItemValue"]
        IsDelete <- map["IsDelete"]
        PropertyType <- map["PropertyType"]
//        Seq <- map["Seq"]
    }
    
    var ItemText: String?
    var ItemValue: String?
    var IsDelete: Bool?
    var PropertyType: Int?
    var Seq: Int?
}
