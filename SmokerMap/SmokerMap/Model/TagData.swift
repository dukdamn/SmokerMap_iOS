

import UIKit

struct TagModel {
    let name: String
    let color: UIColor
}



enum TagKey: String {
    case isInside, somkingBooth, bench, roof
}


struct TagData {
    // 내일 흡연부스, 안밖, 밴치, 천장, 음료 자판기, 휴지통, 흡연부스
    
     static let tags: [String: TagModel] = [
        TagKey.isInside.rawValue: TagModel(name: "", color:  #colorLiteral(red: 0.9764111638, green: 0.9074609876, blue: 0.8522706628, alpha: 1)),//1
        TagKey.somkingBooth.rawValue: TagModel(name: "안밖", color:  #colorLiteral(red: 0.9764111638, green: 0.9074609876, blue: 0.8522706628, alpha: 1)),//3
        TagKey.bench.rawValue: TagModel(name: "밴치", color:  #colorLiteral(red: 0.9764111638, green: 0.9074609876, blue: 0.8522706628, alpha: 1)),//6
        TagKey.roof.rawValue: TagModel(name: "천장", color:  #colorLiteral(red: 0.9764111638, green: 0.9074609876, blue: 0.8522706628, alpha: 1)),//5
    ]

    
    static let tagHeads = [
        TagKey.isInside,
        TagKey.somkingBooth,
        TagKey.bench,
        TagKey.roof
    ]
        
}


