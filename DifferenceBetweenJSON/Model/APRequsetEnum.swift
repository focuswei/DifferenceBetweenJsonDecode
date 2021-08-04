//
//  APRequsetEnum.swift
//  TemplateProject
//
//  Created by guozw3 on 2019/8/12.
//  Copyright © 2019 Benoit PASQUIER. All rights reserved.
//

import Foundation

// 房源獨家委託類型枚舉
enum APPropertyOnlyTrustType: NSInteger {
    case noCash = 1       // 未上錢獨家
    case cash = 2         // 上錢獨家
    case proxyThree = 3   // 委託書-表格三
    case proxyFive = 5    // 委託書-表格五
}

//房源狀態Code
enum APPropertyStatusCode: NSInteger {
    case all = -100           // all
    case none = 0             // none
    case active = 100         // N
    case pending = 200        // P
    case txned = 400          // G
    case withTenancy = 500    // WT
    case tenancyPending = 600 // TP
    case search = 700         // S
}

//房源委托类型（出售=1、出租=2、租售=3）
enum APPropertyTrustType: NSInteger{
    case none = 0
    case sale = 1
    case rent = 2
    case rentSale = 3
}

// 房源狀態四大分類枚舉：1-有效，2-暫緩，3-預定，4-無效
enum APPropertyStatusCategory: NSInteger {
    case vaild = 1
    case delay = 2
    case book  = 3
    case invalid = 4
}

// 房源鎖匙類型
enum APPropertyKeyType: NSInteger {
    case none = 1      // 無鎖匙
    case centaline = 2 // 中原鎖匙
    case counterpart = 3 // 行家鎖匙
}

// 房源地址Select KeyId Type
enum APPropertySearcherKeyIdType: NSInteger {
    case district = 1    // 城區KeyId
    case area = 2        // 片區KeyId
    case bigEstate = 3   // 大樓盤KeyId
    case estate = 4      // 樓盤KeyId
    case building = 5    // 大廈KeyId
    case street = 6      // 街道KeyId
}

// 業主直销類型枚举
enum APPropertyTrustorDirectSell: NSInteger {
    case can     = 0 // 可以
    case cannot  = 1 // 不可以
    case unknown = 2 // 未知
}

// SSD 类型
enum APPropertySSDType: NSInteger {
    case unkown = 0  // 未知
    case zero = 1    // 0%
    case ten = 2     // 10%
    case fifteen = 3 // 15%
    case twenty = 4  // 20%
}

// TransactionEnum
enum APTransactionType: Int {
    case centalineSale = 1    // 中原售 Y
    case centalineRent = 2    // 中原租 YT
    case agencySale = 3       // 行家售 X
    case agencyRent = 4       // 行家租 XT
    case internalTransfer = 5 // 內部轉讓 IT
}


//列表數據類型
enum APPropertyListType: Int {
    case house = 1        //樓盤列表
    case hotList = 2      //HotList
    case contribution = 3 //我的貢獻
    case favourite = 5    //我的收藏
    case transaction = 16 //成交记录
    case paper            //睇樓纸
    case client           //客戶
}

//房源面積類型
enum APPropertySquareType: Int {
    case building = 1
    case practical = 2
    case garden = 3
}

//房源日期类型
enum APPropertyDateType: Int {
    case statusChangedDate = 1   // 改盤日期
    case lasetUpdate = 2         // 最后修改日期
    case lastFollowDate = 3     // 最后跟進日期
    case registDate = 4          // 開盤日期
    case estimatedDate = 5       // 估計日期
    case changePriceDate = 6     // 最后改價日期
    case onlyTrustStartDate = 7  // 委託書開始日
    case onlyTrustEndDate = 8    // 委託書到期日
}

//房源搜尋的智能提示查詢類型枚舉值
enum APPropertyEstateSelectType: Int {
    case district = 1 // 行政區
    case region = 2   // 地理片區
    case estate = 3   // 屋苑
    case all = 4      // 全部
}

// 部门权限范围
enum APAccessScopeType: Int {
    case none = 0       // 无
    case all = 1        // 全部
    case myDept = 3     // 本部含有下级
    case mySelf = 4     // 本人
    case myDeptOnly = 8 // 仅本部
}

//均價類型(1:實均售,2:實均租,3:建均售,4:建均租)
enum APPropertyPriceUnitType: Int {
    case practicalSale = 1  // 實均售
    case practicalRent = 2  // 實均租
    case buildingSale = 3   // 建均售
    case buildingRent = 4   // 建均租
    case greenPracticalSale = 5 // 綠表價實均售
    case greenBuildingSale = 6  // 綠表價建均售
}

//跟進類型枚舉值
enum APFollowType: Int {
    case applyTurnProperty = 1 // 申請轉盤
    case infoAdd = 2 // 信息補充
    case clearInfo = 3 // 洗盤
    case addEstate = 4 // 新開盤
    case addLinker = 5 // 新增聯系人
    case askingPrice = 6 // 叫價
}


enum APContactSearchType: Int {
    case both = 1
    case buyer = 2
    case seller = 3
}

//成交日期类型
enum APTransactionDateType: Int {
    case transaction = 1    // 成交日期
    case prelim = 2         // 臨約日期
    case formal = 3         // 正約日期
    case complete = 4       // 完成日期
    case rent = 5           // 租期日期
}

// ActionRecordLogsActionEnum
enum APActionRecordLogsAction: Int {
    case screencapture = 1
    case view = 2
    case click = 3
}

// ActionRecordLogsPageEnum
enum APActionRecordLogsPage: Int {
    case propertyDetailBasic = 1        // 房源詳情
    case propertyDetailFollow = 2       // 房源詳情跟進
    case propertyDetailTrustor = 3      // 房源詳情業主
    case propertyList = 4               // 樓盤列表
    case propertyFavoriteList = 5       // 收藏列表
    case propertyTransactionList = 6    // 成交列表
    case propertyTransactionBasic = 7   // 成交詳情
    case propertyDetailPriceChangeRecord = 8 //房源詳情叫價記錄
    case propertyDetailTransaction = 9  //房源詳情成交
    case propertyDetailCentaData = 10   // 房源詳情數據資料
    
    case propertySearchBookletPDF = 19  //查冊PDF文件
    case propertySearchBookletWeb = 20  //查冊web文件
}

// 睇樓纸状态
enum APPaperStateType: Int {
    case statusDraft = 1          // 草稿
    case statusPrepraing = 2      // 準備中
    case statusBeSigned = 3       // 待簽署
    case statusInEffect = 4       // 生效中
    case statusExpired = 5        // 已過期
    case statusRevoked = 6        // 已撤銷
    case statusResigningPrepationInEffect = 7  // 生效中(重簽準備中)
    case statusBeResignedInEffect = 8          // 生效中(待重簽)
    
}

// 表格跳转入口
enum APFormFromType: Int {
    case other = 1       // 其他
    case client = 2      // 客戶
    
}

// 睇樓纸日期类型
enum APPaperDateType: Int {
    case paperDate = 1   // 睇樓日期
    case expirationDate = 2         // 有效期到期日
}
