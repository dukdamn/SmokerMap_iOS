//
//  Model.swift
//  SmokerMap
//
//  Created by 정의석 on 2020/03/09.
//  Copyright © 2020 pandaman. All rights reserved.
//

import Foundation
import UIKit

struct SmokingArea {
  let name: String
  let lat: Double
  let lng: Double
  let isInside: Bool
  let uid: String
  let spaceSzie: String
  
}
// 내일 흡연부스, 안밖, 밴치, 천장, 음료 자판기, 휴지통, 흡연부스, 개방형
struct maka {
  var name: String
  var latitude: Double
  var longitude: Double
}


//
//struct smokingAreaGwangJin {
//  let name: String
//  let lat: Double
//  let lng: Double
//  let open: Bool = false
//  let spaceSzie: SpaceSize
//  let locationDetail: String
//
//  let isInside: Bool = false
//  let roof: Bool = false
//  let bench: Bool = false
//
//
//
//  let memo: String
//}
