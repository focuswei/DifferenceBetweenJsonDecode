

import Foundation

struct APHouseDetailInfo_codable : Codable {
    
    var userIsShowTrustor: Bool
    var propertyNo: String?
    var sSDType: APPropertySSDType = .unkown
    var estimatedDate: Date
    var buildingTagInfos: [String]?
    var propertyStatusCategory: APPropertyStatusCategory? // 房源狀態四大分類枚舉：1-有效，2-暫緩，3-預定，4-無效
    var searcherTags: [PropertyFastSearcherTags]
    
    enum CodingKeys: String, CodingKey {
        case userIsShowTrustor = "UserIsShowTrustor"
        case propertyNo = "PropertyNo"
        case buildingTagInfos = "BuildingTagInfos"
        case sSDType = "SSDType"
        case estimatedDate = "EstimatedDate"
        case propertyStatusCategory = "PropertyStatusCategory"
        case searcherTags = "PropertyFastSearcherTags"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        userIsShowTrustor = try values.decode(Bool.self, forKey: .userIsShowTrustor)
        propertyNo = try values.decode(String.self, forKey: .propertyNo)
        sSDType = try values.decode(APPropertySSDType.self, forKey: .sSDType)
        estimatedDate = try values.decode(Date.self, forKey: .estimatedDate)
        buildingTagInfos = try values.decode([String].self, forKey: .buildingTagInfos)
        propertyStatusCategory = try values.decode(APPropertyStatusCategory.self, forKey: .propertyStatusCategory)
        searcherTags = try values.decode([PropertyFastSearcherTags].self, forKey: .searcherTags)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(userIsShowTrustor, forKey: .userIsShowTrustor)
        try container.encode(propertyNo, forKey: .propertyNo)
        try container.encode(sSDType, forKey: .sSDType)
        try container.encode(estimatedDate, forKey: .estimatedDate)
        try container.encode(buildingTagInfos, forKey: .buildingTagInfos)
        try container.encode(propertyStatusCategory, forKey: .propertyStatusCategory)
        try container.encode(searcherTags, forKey: .searcherTags)
    }
}

struct PropertyFastSearcherTags: Codable {
    var ItemText: String
    var ItemValue: String
    var IsDelete: Bool
    var PropertyType: Int
    var Seq: Int
}
