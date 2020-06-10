//
//  Event.swift
//  Baseball01
//
//  Created by 0003 QBS on 2020/06/02.
//  Copyright © 2020 0003.kaori. All rights reserved.
//

import Foundation
import RealmSwift

class Event: Object {

    // 管理用 ID。プライマリーキー
    //@objc dynamic var id = 0
    
    // 日付
    @objc dynamic var date: String = ""
    // イベント
    @objc dynamic var event: String = ""
    // 同伴者
    //@objc dynamic var companion: String = ""
    // 場所
    //@objc dynamic var place: String = ""
    
    // id をプライマリーキーとして設定
    //override static func primaryKey() -> String? {
        //return "id"
    //}

}
