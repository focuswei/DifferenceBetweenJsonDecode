
import Foundation



//房源委托类型（出售=1、出租=2、租售=3）
enum APPropertyTrustType: NSInteger {
    case none = 0
    case sale = 1
    case rent = 2
    case rentSale = 3
}

// 房源狀態四大分類枚舉：1-有效，2-暫緩，3-預定，4-無效
enum APPropertyStatusCategory: NSInteger, Codable {
    case vaild = 1
    case delay = 2
    case book  = 3
    case invalid = 4
}

enum APPropertySSDType: NSInteger, Codable {
    case unkown = 0  // 未知
    case zero = 1    // 0%
    case ten = 2     // 10%
    case fifteen = 3 // 15%
    case twenty = 4  // 20%
}
