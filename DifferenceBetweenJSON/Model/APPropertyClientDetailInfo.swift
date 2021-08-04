//
//  APPropertyClientDetailInfo.swift
//  TemplateProject
//
//  Created by guozw3 on 2019/8/12.
//  Copyright © 2019 Benoit PASQUIER. All rights reserved.
//

import Foundation


struct APPropertyClientDetailInfo {
    var contactTypeKeyId: String?  // 聯繫人類型KeyId (Guid)
    var contactName: String?       // 聯繫人姓名 (String)
    var genderKeyId: String?       // 聯繫人性別：系統參數性別 (Nullable`1)
    var mobile: String?            // 聯繫方式 (String)
    var contactInfoTypeKeyId: String? // 聯繫方式類型 (Nullable`1)
    var comment: String?           // 客戶備註 (String)
    
    var orderStr: String?          //
    var onlyTrustType: Int32?     //
    var inquiryKeyId: String?      //
    var inquiryName: String?       //
    var trustBookNo: String?       //
    var effectiveDate: String?    //
    var expirationDate: String?    //
    var tableType: String?         //
    var watchtowerDate: String?    //
    var onlyTrustsState: Int32?   //
    var creatorKeyId: String?      //
    var isForDelete: String?       //
    var keyId: String?             //
    var isEForm: Bool = false             //
    
    var customerKeyId: String?   // 客戶keyid (Guid)
    var customerName: String?    // 客戶姓名 (String)
    var inquiryContactValueType: String?   // 聯繫方式類型 (Nullable`1)
    var inquiryContactValueTypeName: String?    // 聯繫方式類型名称 (Nullable`1)
    var contactInfoTypeName: String?   // 聯繫方式類型 (Nullable`1)
    
}
