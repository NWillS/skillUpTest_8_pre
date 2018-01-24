//
//  MessageDao.swift
//  skillUpTest_8_pre
//
//  Created by S N on 2018/01/24.
//  Copyright © 2018年 Seidi Nakamura. All rights reserved.
//

import Foundation

final class MessageDao {
    static let daoHelper = RealmDaoHelper<MessageDto>()
    
//    メッセージ追加
    static func addMessage(text: String) {
        let message = MessageDto()
        guard let newID = daoHelper.newId() else {
            return
        }
        message.messageID = newID
        message.text = text
        message.updateDate = Date()
        
        daoHelper.add(object: message)
    }
    
//    メッセージ全取得
    static func getAllMessages() -> [MessageDto] {
        let messageList = daoHelper.findAll().sorted(byKeyPath: "updateDate", ascending: false)
        return messageList.map { MessageDto( value: $0) }
    }
}
