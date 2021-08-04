//
//  APAgencySysParam.swift
//  TemplateProject
//
//  Created by guozw3 on 2019/8/12.
//  Copyright © 2019 Benoit PASQUIER. All rights reserved.
//

import Foundation

class APAgencySysParam: NSObject, NSCoding {
    var parameterName: String?        // 參數名稱
    var sysParameterTypeEnum: APSystemParameterType = .none // 參數類型
    var commonStatusEnum: APSysParameterStatus = .none // 參數狀態
    var items: [APSelectItemDto]?   // 房源篩選條件選項集合
    
    override init() {
        super.init()
    }
    
    // MARK : - NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(parameterName)
        aCoder.encode(sysParameterTypeEnum.rawValue, forKey: "sysParameterTypeEnum")
        aCoder.encode(commonStatusEnum.rawValue, forKey: "commonStatusEnum")
        aCoder.encode(items)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        parameterName = aDecoder.decodeObject() as! String?
        sysParameterTypeEnum = APSystemParameterType(rawValue: aDecoder.decodeInteger(forKey: "sysParameterTypeEnum")) ?? .none
        commonStatusEnum = APSysParameterStatus(rawValue: aDecoder.decodeInteger(forKey: "commonStatusEnum")) ?? .none
        items = aDecoder.decodeObject() as! [APSelectItemDto]?
    }
}
