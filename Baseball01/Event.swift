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
    @objc dynamic var id = 0
    
    // 日付
    @objc dynamic var date: String = ""
    // 場所
    @objc dynamic var place: String = ""
    // 同伴者
    @objc dynamic var companion: String = ""
    // 座種
    @objc dynamic var seat: String = ""
    // 勝利チーム名
    @objc dynamic var winTeam: String = ""
    // 勝利点数
    @objc dynamic var winCount: String = ""
    // 敗北チーム名
    @objc dynamic var loseTeam: String = ""
    // 敗北点数
    @objc dynamic var loseCount: String = ""
    
    // イベント
    //@objc dynamic var event: String = ""
    
    // id をプライマリーキーとして設定
    override static func primaryKey() -> String? {
        return "id"
    }

}
