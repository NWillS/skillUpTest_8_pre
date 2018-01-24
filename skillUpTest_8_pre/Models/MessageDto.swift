//
//  MessageDto.swift
//  skillUpTest_8_pre
//
//  Created by S N on 2018/01/24.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Foundation
import RealmSwift

class MessageDto: Object {
    @objc dynamic var messageID = 0
    @objc dynamic var text = ""
    @objc dynamic var updateDate = Date()
    
    override static func primaryKey() -> String? {
        return "messageID"
    }
}
